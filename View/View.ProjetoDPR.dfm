object frmDPRView: TfrmDPRView
  Left = 0
  Top = 0
  Caption = 'Projeto DPR'
  ClientHeight = 197
  ClientWidth = 520
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  TextHeight = 15
  object pnlBotoes: TPanel
    Left = 0
    Top = 147
    Width = 520
    Height = 50
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 146
    ExplicitWidth = 516
    object btnInserir: TButton
      Left = 248
      Top = 14
      Width = 75
      Height = 25
      Caption = '&Inserir'
      TabOrder = 0
      OnClick = btnInserirClick
    end
    object btnLimpar: TButton
      Left = 336
      Top = 14
      Width = 75
      Height = 25
      Caption = '&Limpar'
      TabOrder = 1
      OnClick = btnLimparClick
    end
    object Button3: TButton
      Left = 425
      Top = 14
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 2
      OnClick = Button3Click
    end
  end
  object pnlArea: TPanel
    Left = 0
    Top = 0
    Width = 520
    Height = 147
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 516
    ExplicitHeight = 146
    object lblModulo: TLabel
      Left = 4
      Top = 37
      Width = 137
      Height = 15
      Caption = 'Digite o nome do m'#243'dulo'
    end
    object lblCaminho: TLabel
      Left = 5
      Top = 104
      Width = 119
      Height = 15
      Caption = 'Digite o caminho .DPR'
    end
    object edtModulo: TEdit
      Left = 147
      Top = 29
      Width = 345
      Height = 23
      TabOrder = 0
    end
    object edtCaminho: TEdit
      Left = 147
      Top = 101
      Width = 345
      Height = 23
      TabOrder = 1
    end
  end
end
