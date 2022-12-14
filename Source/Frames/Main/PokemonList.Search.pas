unit PokemonList.Search;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.Messaging,
  Fmx.Ani,
  Fmx.Types,
  Fmx.Graphics,
  Fmx.Controls,
  Fmx.Forms,
  Fmx.Dialogs,
  Fmx.StdCtrls,
  Skia,
  Skia.Fmx,
  Fmx.Layouts,
  Fmx.Controls.Presentation,
  Fmx.Edit;

type
  TMessageType = (mtSearch, mtCancel);

  TSearch = class(TMessage)
  private
    Fpokemon    : string;
    FmessageType: TMessageType;
  public
    constructor Create(APokemon: string; AMessage: TMessageType); overload;
    property messageType: TMessageType read FmessageType write FmessageType;
    property pokemon: string read Fpokemon write Fpokemon;
  end;

  TSearchPokemon = class(TFrame)
    svgBackground: TSkSvg;
    GridPanelLayout1: TGridPanelLayout;
    edtPokemonSearch: TEdit;
    svgBack: TSkSvg;
    FloatAnimationIn: TFloatAnimation;
    procedure edtPokemonSearchKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure svgBackClick(Sender: TObject);
    procedure FloatAnimationInFinish(Sender: TObject);
    procedure FloatAnimationInProcess(Sender: TObject);
  private
    procedure SearchPokemon(AValue: string);
  public
    procedure AnimationIn;
    procedure AnimationOut;
  end;

implementation

{$R *.fmx}
{ TFrame1 }

procedure TSearchPokemon.AnimationIn;
begin
  FloatAnimationIn.Start;
end;

procedure TSearchPokemon.AnimationOut;
begin
  FloatAnimationIn.Inverse := True;
  FloatAnimationIn.Start;
end;

procedure TSearchPokemon.edtPokemonSearchKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  if Key = 13 then
  begin
    SearchPokemon(edtPokemonSearch.Text);
  end;
end;

procedure TSearchPokemon.FloatAnimationInFinish(Sender: TObject);
begin
  if not FloatAnimationIn.Inverse then
    Self.Align := TAlignLayout.Client;
end;

procedure TSearchPokemon.FloatAnimationInProcess(Sender: TObject);
begin
  Self.Align := TAlignLayout.Right;
end;

procedure TSearchPokemon.SearchPokemon(AValue: string);
begin
  AnimationOut;
  TMessageManager.DefaultManager.SendMessage(Self, TSearch.Create(AValue, TMessageType.mtSearch));
end;

procedure TSearchPokemon.svgBackClick(Sender: TObject);
begin
  AnimationOut;
  TMessageManager.DefaultManager.SendMessage(Self, TSearch.Create(EmptyStr, TMessageType.mtCancel));
end;

{ TSearch }

constructor TSearch.Create(APokemon: string; AMessage: TMessageType);
begin
  Fpokemon     := APokemon;
  FmessageType := AMessage;
end;

end.
