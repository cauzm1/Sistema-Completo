inherited frmCadastroCaixa: TfrmCadastroCaixa
  Caption = 'Lan'#231'amentos no Caixa'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    inherited tbsCadastro: TTabSheet
      object Label1: TLabel
        Left = 32
        Top = 64
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object Label3: TLabel
        Left = 32
        Top = 110
        Width = 24
        Height = 13
        Caption = 'Valor'
      end
      object Label4: TLabel
        Left = 32
        Top = 18
        Width = 109
        Height = 13
        Caption = 'Numero do Documento'
      end
      object EditDescricaoCaixa: TEdit
        Left = 32
        Top = 83
        Width = 225
        Height = 21
        TabOrder = 0
      end
      object EditNumeroDoc: TEdit
        Left = 32
        Top = 37
        Width = 225
        Height = 21
        TabOrder = 1
      end
      object RadioGroup: TRadioGroup
        Left = 32
        Top = 172
        Width = 153
        Height = 45
        Caption = 'Tipo'
        Columns = 2
        Items.Strings = (
          'Cr'#233'dito'
          'D'#233'bito')
        TabOrder = 2
      end
      object editValorCaixa: TtpEdit
        Left = 32
        Top = 129
        Width = 121
        Height = 21
        Alignment = taLeftJustify
        CharCase = ecUpperCase
        TabOrder = 3
        Caracter = tcNumeric
      end
    end
    inherited tbsPesquisa: TTabSheet
      inherited Button1: TButton
        OnClick = Button1Click
      end
      inherited dbgDados: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'id'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'numero_doc'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao'
            Width = 256
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valor'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'tipo'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dt_cadastro'
            Visible = True
          end>
      end
      inherited cbxFiltros: TComboBoxEx
        ItemsEx = <
          item
            Caption = 'Documento'
          end
          item
            Caption = 'Descricao'
          end>
      end
    end
  end
end
