inherited frmCadastroUsuarios: TfrmCadastroUsuarios
  Caption = 'Cadastro de Usu'#225'rios'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    inherited tbsCadastro: TTabSheet
      inherited btnInserir: TSpeedButton
        Left = -1
        Top = 434
        ExplicitLeft = -1
        ExplicitTop = 434
      end
      object Label3: TLabel
        Left = 21
        Top = 64
        Width = 25
        Height = 13
        Caption = 'Login'
      end
      object Label4: TLabel
        Left = 21
        Top = 109
        Width = 30
        Height = 13
        Caption = 'Senha'
      end
      object Label1: TLabel
        Left = 21
        Top = 24
        Width = 27
        Height = 13
        Caption = 'Nome'
      end
      object EditLogin: TEdit
        Left = 72
        Top = 61
        Width = 121
        Height = 21
        MaxLength = 20
        TabOrder = 0
      end
      object EditSenha: TEdit
        Left = 72
        Top = 106
        Width = 121
        Height = 21
        MaxLength = 20
        PasswordChar = '*'
        TabOrder = 1
      end
      object EditNome: TEdit
        Left = 72
        Top = 21
        Width = 121
        Height = 21
        MaxLength = 50
        TabOrder = 2
      end
    end
    inherited tbsPesquisa: TTabSheet
      inherited SpeedButton9: TSpeedButton
        Left = 7
        Top = 435
        ExplicitLeft = 7
        ExplicitTop = 435
      end
      inherited SpeedButton13: TSpeedButton
        Top = 435
        ExplicitTop = 435
      end
      inherited Button1: TButton
        OnClick = Button1Click
      end
      inherited dbgDados: TDBGrid
        Left = 0
        Top = 186
        Height = 229
        Columns = <
          item
            Expanded = False
            FieldName = 'id'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'login'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'status'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dt_cadastro'
            Visible = True
          end>
      end
    end
  end
  inherited dsTabela: TDataSource
    DataSet = dmDados.CDSusuarios
  end
  inherited actAcoes: TActionList
    object Action1: TAction
      Caption = 'Action1'
    end
  end
end
