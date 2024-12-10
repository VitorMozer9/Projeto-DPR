program DPR,
testes in teste12,
testes in teste12;

uses
  Vcl.Forms,
  View.ProjetoDPR in 'View.ProjetoDPR.pas' {frmDPRView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmDPRView, frmDPRView);
  Application.Run;
end.
