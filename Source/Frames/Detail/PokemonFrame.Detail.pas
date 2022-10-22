unit PokemonFrame.Detail;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Graphics,
  FMX.Controls,
  FMX.Forms,
  FMX.Dialogs,
  FMX.StdCtrls,
  Skia,
  Skia.FMX,
  FMX.Layouts;

type
  TPokemonFrameDetail = class(TFrame)
    gridBackGround: TGridPanelLayout;
    lblName: TSkLabel;
    gridMain: TGridPanelLayout;
    svgGraphStats: TSkSvg;
    aniPokemon: TSkAnimatedImage;
    GridPanelLayout2: TGridPanelLayout;
    svgType1: TSkSvg;
    lblType1: TSkLabel;
    svgTypeIcon1: TSkSvg;
    svgType2: TSkSvg;
    lblType2: TSkLabel;
    svgTypeIcon2: TSkSvg;
    svgBackground: TSkSvg;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
