unit Controller.ProjetoDPR;

interface

uses SysUtils, Math, StrUtils, SqlExpr, Classes;

type
   TProjetoDPRController = class
      public
         constructor create;

         procedure VerificaTexto(pModulo : string ; pCaminho : String);
         function EncontraUnitPrincipal(const pDiretorio : String) : Boolean;


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
  const pDiretorio: String): Boolean;
  var
   xProcuraArquivo  : TSearchRec;
   xVerificaLinhas  : TStringList;
   xEnderecoArquivo : string;
begin
  try
     Result := False;
     xVerificaLinhas := TStringList.Create;

      if FindFirst(IncludeTrailingPathDelimiter(pDiretorio) + '*.pas', faAnyFile, xProcuraArquivo) = 0 then  //localizar o arquivo
      begin                                                                                                   //IncludeTrailingPathDelimiter = delimitador
         repeat
           xEnderecoArquivo := IncludeTrailingPathDelimiter(pDiretorio) + xProcuraArquivo.Name; //pega o nome do arquivo

           xVerificaLinhas.LoadFromFile(xEnderecoArquivo);

           if (xVerificaLinhas.Count > 0) and (Pos('program', LowerCase(xVerificaLinhas[0])) > 0) then   //verifica subcadeia
           begin
             Result := True;
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

procedure TProjetoDPRController.VerificaTexto(pModulo, pCaminho: String);
var
   xVerificadorLinhas : TStringList;
   xAux : Integer;
begin
  try
      xVerificadorLinhas := TStringList.Create;


      for xAux := 0 to Length(pEndereco) do
      begin
         if pEndereco[xAux] = ';'  then
            pEndereco[xAux] := ',';
      end;
   except
      on E : Exception do
      begin
         Raise Exception.Create(
            'Falha ao verificar dados da unit. [Controller]'#13 +
            e.Message);
      end;
   end;
end;

end.
