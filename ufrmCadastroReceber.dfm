inherited frmCadastroReceber: TfrmCadastroReceber
  Caption = 'Contas a Receber'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    inherited tbsCadastro: TTabSheet
      TabVisible = True
      object Label1: TLabel
        Left = 8
        Top = 24
        Width = 109
        Height = 13
        Caption = 'Numero do Documento'
      end
      object Label8: TLabel
        Left = 239
        Top = 24
        Width = 41
        Height = 13
        Caption = 'Varia'#231#227'o'
      end
      object Label3: TLabel
        Left = 8
        Top = 80
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object Label4: TLabel
        Left = 8
        Top = 144
        Width = 70
        Height = 13
        Caption = 'N'#176' de Parcelas'
      end
      object Label6: TLabel
        Left = 8
        Top = 208
        Width = 64
        Height = 13
        Caption = 'Valor Compra'
      end
      object Label7: TLabel
        Left = 8
        Top = 264
        Width = 78
        Height = 13
        Caption = 'Data da Compra'
      end
      object EditDocumento: TEdit
        Left = 46
        Top = 43
        Width = 121
        Height = 21
        MaxLength = 20
        TabOrder = 0
      end
      object EditVariacao: TEdit
        Left = 272
        Top = 43
        Width = 121
        Height = 21
        MaxLength = 20
        NumbersOnly = True
        TabOrder = 1
      end
      object EditDescricao: TEdit
        Left = 46
        Top = 99
        Width = 171
        Height = 21
        MaxLength = 200
        TabOrder = 2
      end
      object EditQtdParcelas: TEdit
        Left = 46
        Top = 163
        Width = 121
        Height = 21
        MaxLength = 20
        NumbersOnly = True
        TabOrder = 3
      end
      object EditValorCompra: TtpEdit
        Left = 46
        Top = 227
        Width = 121
        Height = 21
        Alignment = taLeftJustify
        CharCase = ecUpperCase
        TabOrder = 4
        Caracter = tcNumeric
      end
      object EditDataCompra: TtpEdit
        Left = 46
        Top = 283
        Width = 121
        Height = 21
        Alignment = taLeftJustify
        CharCase = ecUpperCase
        MaxLength = 8
        TabOrder = 5
        Check = ckDate
        Caracter = tcNumeric
      end
      object BtnGerarParcelas: TBitBtn
        Left = 288
        Top = 209
        Width = 86
        Height = 25
        Caption = 'Gerar Parcelas'
        TabOrder = 6
        OnClick = BtnGerarParcelasClick
      end
      object BtnLimparParcelas: TBitBtn
        Left = 407
        Top = 209
        Width = 86
        Height = 25
        Caption = 'Limpar Parcelas'
        TabOrder = 7
        OnClick = BtnLimparParcelasClick
      end
      object DBGrid1: TDBGrid
        Left = 288
        Top = 240
        Width = 205
        Height = 113
        DataSource = dsParcelas
        DrawingStyle = gdsGradient
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
        TabOrder = 8
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = dbgDadosDrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'Parcela'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Valor'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Vencimento'
            Width = 73
            Visible = True
          end>
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
            FieldName = 'status'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'documento'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'parcelas'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valor_parcelas'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valor_compra'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valor_abatido'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dt_compra'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dt_vencimento'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dt_cadastro'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dt_pagamento'
            Visible = True
          end>
      end
      inherited cbxFiltros: TComboBoxEx
        ItemsEx = <
          item
            Caption = 'Documento'
          end
          item
            Caption = 'Descri'#231#227'o'
          end>
      end
    end
  end
  inherited dsTabela: TDataSource
    DataSet = dmDados.CDS_contas_receber
  end
  object cdsParcelas: TClientDataSet
    PersistDataPacket.Data = {
      5F0000009619E0BD0100000018000000030000000000030000005F0007506172
      63656C6104000100000000000556616C6F720800040000000100075355425459
      50450200490006004D6F6E6579000A56656E63696D656E746F04000600000000
      000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 656
    Top = 264
    object cdsParcelasParcela: TIntegerField
      FieldName = 'Parcela'
    end
    object cdsParcelasValor: TCurrencyField
      FieldName = 'Valor'
    end
    object cdsParcelasVencimento: TDateField
      FieldName = 'Vencimento'
    end
  end
  object dsParcelas: TDataSource
    DataSet = cdsParcelas
    Left = 664
    Top = 344
  end
end
