unit Controller.ProjetoDPR;

interface

uses SysUtils, Math, StrUtils, SqlExpr, Classes;

type
   TProjetoDPRController = class
      public
        constructor create;

        Procedure VerificaTexto(const pUnitPrincipal : string ;
          pModulo : string ; pCaminho : String);
        function EncontraUnitPrincipal(const pDiretorio : String) : String;


      published
         class function getInstancia : TProjetoDPRController;
   end;

implementation

var
   _instance : TProjetoDPRController;

{ TProjetoDPRController }

constructor TProjetoDPRController.create;
begin
  inherited create;
end;

function TProjetoDPRController.EncontraUnitPrincipal(
  const pDiretorio: String): string;
  var
   xProcuraArquivo  : TSearchRec;
   xVerificaLinhas  : TStringList;
   xEnderecoArquivo : string;
begin
   try
     xEnderecoArquivo := '';
     xVerificaLinhas := TStringList.Create;

//     if FileExists(pDiretorio) then
//         exit;
//
//       [....] . .dpr

      if FindFirst(IncludeTrailingPathDelimiter(pDiretorio) + '*.dpr', faAnyFile, xProcuraArquivo) = 0 then  //localizar o arquivo
      begin                                                                                                   //IncludeTrailingPathDelimiter = delimitador
         repeat
           xEnderecoArquivo := IncludeTrailingPathDelimiter(pDiretorio) + xProcuraArquivo.Name; //pega o nome do arquivo

           xVerificaLinhas.LoadFromFile(xEnderecoArquivo);
           if (xVerificaLinhas.Count > 0) and (Pos('program', LowerCase(xVerificaLinhas[0])) > 0) then   //verifica subcadeia
           begin
             Result := xEnderecoArquivo;
             Break;
           end;
         until FindNext(xProcuraArquivo) <> 0;

         FindClose(xProcuraArquivo);
      end;
   finally
      xVerificaLinhas.Free;
   end;
end;

class function TProjetoDPRController.getInstancia: TProjetoDPRController;
begin
  if _instance = nil then
     _instance := TProjetoDPRController.Create;

   Result := _instance;
end;

procedure TProjetoDPRController.VerificaTexto(const pUnitPrincipal : string ;
  pModulo, pCaminho: String);
var
   xVerificadorLinhas : TStringList;
   xAux : Integer;
begin
   try
      xVerificadorLinhas := TStringList.Create;
      xVerificadorLinhas.LoadFromFile(pUnitPrincipal);

      for xAux := 0 to xVerificadorLinhas.Count - 1 do
      begin
         if xVerificadorLinhas[xAux].Contains(';') then
         begin
            xVerificadorLinhas[xAux] := StringReplace(xVerificadorLinhas[xAux], ';', ',', []);
            xVerificadorLinhas.Insert(xAux + 1, pModulo + ' in ' + pCaminho + ';');
            Break;
         end;
      end;

      xVerificadorLinhas.SaveToFile(pUnitPrincipal);
   except
      on e : Exception do
      begin
         raise Exception.Create(
            'Falha ao verificar dados da unit. [Controller]'#13 +
            e.Message);
      end;
    end;
end;

end.
