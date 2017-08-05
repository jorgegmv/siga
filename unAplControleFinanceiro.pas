unit unAplControleFinanceiro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, AdvObj, BaseGrid, AdvGrid,
  AdvCGrid, Vcl.StdCtrls, JvExStdCtrls, JvCheckBox, Vcl.ComCtrls, Vcl.ToolWin,
  JvExComCtrls, JvToolBar, Vcl.Buttons, JvExButtons, JvBitBtn, Vcl.ExtCtrls,
  JvExExtCtrls, JvExtComponent, JvPanel, JvCombobox, JvComCtrls, Vcl.Mask,
  JvExMask, JvToolEdit, JvMaskEdit, JvCheckedMaskEdit, JvDatePickerEdit,
  JvGroupBox;

type
  TfmAplControleFinanceiro = class(TForm)
    PanelBotoes: TJvPanel;
    BitBtnFechar: TJvBitBtn;
    ToolBarGrid: TJvToolBar;
    ToolButtonAbrirJanelaPesquisa: TToolButton;
    ToolButtonOrdenarRegistros: TToolButton;
    ToolButtonAtualizarTabela: TToolButton;
    ToolButtonSeparador1: TToolButton;
    ToolButtonImprimirRelatorio: TToolButton;
    ToolButtonExportarPlanilha: TToolButton;
    ToolButtonExportarHTML: TToolButton;
    PanelCentral: TJvPanel;
    PanelInfoFiltro: TJvPanel;
    ColumnGridItens: TAdvColumnGrid;
    LabelFiltros: TLabel;
    PageControlPrincipal: TJvPageControl;
    TabSheetFiltro: TTabSheet;
    PanelCampos: TJvPanel;
    TabSheetDados: TTabSheet;
    PanelGrid: TJvPanel;
    DatePickerEditFiltroPeriodoInicial: TJvDatePickerEdit;
    DatePickerEditFiltroPeriodoFinal: TJvDatePickerEdit;
    PanelTitulos: TJvPanel;
    LabelPeriodo: TLabel;
    LabelDataCadastro: TLabel;
    LabelPeriodoAte: TLabel;
    GroupBoxTiposRegistros: TJvGroupBox;
    CheckBoxFiltroDespesa: TJvCheckBox;
    CheckBoxFiltroReceita: TJvCheckBox;
    CheckBoxFiltroAquisicoes: TJvCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmAplControleFinanceiro: TfmAplControleFinanceiro;

implementation

{$R *.dfm}

end.
