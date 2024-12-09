unit View.ProjetoDPR;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uMessageUtil;

type
  TfrmDPRView = class(TForm)
    pnlBotoes: TPanel;
    pnlArea: TPanel;
    edtModulo: TEdit;
    edtCaminho: TEdit;
    lblModulo: TLabel;
    lblCaminho: TLabel;
    btnInserir: TButton;
    btnLimpar: TButton;
    Button3: TButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button3Click(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    vKey : Word;

  function ValidaCampos : Boolean;

  procedure ProcessInsercao;
  procedure LimpaTela;

  public
    { Public declarations }
  end;

var
  frmDPRView: TfrmDPRView;

implementation

{$R *.dfm}

{ TfrmDPRView }

procedure TfrmDPRView.btnLimparClick(Sender: TObject);
begin
  LimpaTela;
end;

procedure TfrmDPRView.Button3Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmDPRView.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  vKey := Key;

   case vKey of

      VK_RETURN:
      begin
         Perform(WM_NextDlgCtl, 0, 0);
      end;

      VK_ESCAPE:
      begin
         if (edtModulo.Text <> EmptyStr) or (edtCaminho.Text <> EmptyStr) then
         begin
            if(TMessageUtil.Pergunta(
               'Deseja realmente abortar esta opera��o?')) then
            begin
               edtModulo.Text := EmptyStr;
               edtCaminho.Text := EmptyStr;
            end;
         end
         else
         begin
           if (TMessageUtil.Pergunta(
              'Deseja sair da rotina?')) then
              Close;
         end;
      end;
   end;
end;

procedure TfrmDPRView.FormShow(Sender: TObject);
begin
  if (edtModulo.CanFocus) then
      edtModulo.SetFocus;
end;

procedure TfrmDPRView.LimpaTela;
var
  xI : Integer;
begin
  for xI := 0 to pred(ComponentCount) do
   begin
      if (Components[xI] is TEdit) then
         (Components[xI] as TEdit).Text := EmptyStr;
   end;
end;

procedure TfrmDPRView.ProcessInsercao;
begin
  //Inser��o
end;

function TfrmDPRView.ValidaCampos: Boolean;
begin
  Result := False;

   if (edtModulo.Text = EmptyStr) then
   begin
      TMessageUtil.Alerta('O M�dulo a ser inserido n�o pode ficar em branco.');
      if (edtModulo.CanFocus) then
         edtModulo.SetFocus;
      Exit;
   end;

   if (edtCaminho.Text = EmptyStr) then
   begin
      TMessageUtil.Alerta('O caminho a ser inserido n�o pode ficar em branco.');
      if (edtCaminho.CanFocus) then
         edtCaminho.SetFocus;
      Exit;
   end;

   Result := True;
end;

end.
