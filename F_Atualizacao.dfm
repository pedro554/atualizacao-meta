object FAtualizadorOphera: TFAtualizadorOphera
  Left = 0
  Top = 0
  Caption = 'Atualizador Base'
  ClientHeight = 89
  ClientWidth = 499
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object pnl1: TPanel
    Left = 0
    Top = 5
    Width = 499
    Height = 84
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 4
    ExplicitWidth = 495
    object pbProgresso: TProgressBar
      Left = 91
      Top = 8
      Width = 318
      Height = 17
      TabOrder = 0
    end
    object btnAtualizar: TButton
      Left = 127
      Top = 54
      Width = 120
      Height = 21
      Caption = 'Atualizar Banco'
      TabOrder = 2
      OnClick = btnAtualizarClick
    end
    object pbSubProgresso: TProgressBar
      Left = 91
      Top = 31
      Width = 318
      Height = 17
      TabOrder = 1
    end
    object btnSair: TButton
      Left = 253
      Top = 54
      Width = 120
      Height = 21
      Caption = 'Sair'
      TabOrder = 3
      OnClick = btnSairClick
    end
  end
end
