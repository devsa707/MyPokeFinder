program MyPokeFinder;

uses
  System.StartUpCopy,
  FMX.Forms,
  Main.Form in '..\Source\Main.Form.pas' {MainForm},
  PokemonList.Detail in '..\Source\Frames\Detail\PokemonList.Detail.pas' {PokemonListDetail},
  PokemonList.Frame in '..\Source\Frames\Main\PokemonList.Frame.pas' {PokemonListFrame: TFrame},
  PokemonFinder in '..\Source\Data\PokemonFinder.pas',
  DataFinder.DB in '..\Source\Data\DataFinder.DB.pas' {DataFinder: TDataModule},
  StringCapitalHelper in '..\Source\Commom\StringCapitalHelper.pas',
  PokemonFrame.Detail in '..\Source\Frames\Detail\PokemonFrame.Detail.pas' {PokemonFrameDetail: TFrame},
  PokeWrapper in '..\..\PokeWrapper\Source\Wrapper\PokeWrapper.pas',
  PokeWrapper.Interfaces in '..\..\PokeWrapper\Source\Wrapper\PokeWrapper.Interfaces.pas',
  PokeFactory in '..\..\PokeWrapper\Source\Wrapper\PokeFactory.pas',
  PokemonType.Entity in '..\..\PokeWrapper\Source\Entities\Pokemon\PokemonType.Entity.pas',
  PokemonStat.Entity in '..\..\PokeWrapper\Source\Entities\Pokemon\PokemonStat.Entity.pas',
  Pokemon.Entity in '..\..\PokeWrapper\Source\Entities\Pokemon\Pokemon.Entity.pas',
  PokemonSpecies.Entity in '..\..\PokeWrapper\Source\Entities\Pokemon\PokemonSpecies.Entity.pas',
  PokeWrapper.Resources in '..\..\PokeWrapper\Source\Wrapper\PokeWrapper.Resources.pas',
  PokeWrapper.Types in '..\..\PokeWrapper\Source\Wrapper\PokeWrapper.Types.pas',
  PokemonShape.Entity in '..\..\PokeWrapper\Source\Entities\Pokemon\PokemonShape.Entity.pas',
  PokemonHabitat.Entity in '..\..\PokeWrapper\Source\Entities\Pokemon\PokemonHabitat.Entity.pas',
  PokemonForm.Entity in '..\..\PokeWrapper\Source\Entities\Pokemon\PokemonForm.Entity.pas',
  PokemonColor.Entity in '..\..\PokeWrapper\Source\Entities\Pokemon\PokemonColor.Entity.pas',
  Pokemon.Generation.Node.Entity in '..\..\PokeWrapper\Source\Entities\Pokemon\Pokemon.Generation.Node.Entity.pas',
  Move.Entity in '..\..\PokeWrapper\Source\Entities\Moves\Move.Entity.pas',
  PokeathlonStat.Entity in '..\..\PokeWrapper\Source\Entities\Pokemon\PokeathlonStat.Entity.pas',
  Nature.Entity in '..\..\PokeWrapper\Source\Entities\Pokemon\Nature.Entity.pas',
  GrowthRate.Entity in '..\..\PokeWrapper\Source\Entities\Pokemon\GrowthRate.Entity.pas',
  Gender.Entity in '..\..\PokeWrapper\Source\Entities\Pokemon\Gender.Entity.pas',
  EggGroup.Entity in '..\..\PokeWrapper\Source\Entities\Pokemon\EggGroup.Entity.pas',
  Characteristic.Entity in '..\..\PokeWrapper\Source\Entities\Pokemon\Characteristic.Entity.pas',
  Ability.Entity in '..\..\PokeWrapper\Source\Entities\Pokemon\Ability.Entity.pas',
  MoveTarget.Entity in '..\..\PokeWrapper\Source\Entities\Moves\MoveTarget.Entity.pas',
  MoveLearnMethod.Entity in '..\..\PokeWrapper\Source\Entities\Moves\MoveLearnMethod.Entity.pas',
  MoveDamageClass.Entity in '..\..\PokeWrapper\Source\Entities\Moves\MoveDamageClass.Entity.pas',
  MoveCategory.Entity in '..\..\PokeWrapper\Source\Entities\Moves\MoveCategory.Entity.pas',
  MoveBattleStyle.Entity in '..\..\PokeWrapper\Source\Entities\Moves\MoveBattleStyle.Entity.pas',
  MoveAilment.Entity in '..\..\PokeWrapper\Source\Entities\Moves\MoveAilment.Entity.pas',
  Machine.Entity in '..\..\PokeWrapper\Source\Entities\Machines\Machine.Entity.pas',
  ItemFlingEffect.Entity in '..\..\PokeWrapper\Source\Entities\Items\ItemFlingEffect.Entity.pas',
  ItemAttribute.Entity in '..\..\PokeWrapper\Source\Entities\Items\ItemAttribute.Entity.pas',
  Item.Entity in '..\..\PokeWrapper\Source\Entities\Items\Item.Entity.pas',
  Pokedex.Entity in '..\..\PokeWrapper\Source\Entities\Games\Pokedex.Entity.pas',
  SuperContestEffect.Entity in '..\..\PokeWrapper\Source\Entities\Contests\SuperContestEffect.Entity.pas',
  ContestEffect.Entity in '..\..\PokeWrapper\Source\Entities\Contests\ContestEffect.Entity.pas',
  ContestType.Entity in '..\..\PokeWrapper\Source\Entities\Contests\ContestType.Entity.pas',
  Commons.Entities in '..\..\PokeWrapper\Source\Entities\Commons\Commons.Entities.pas',
  Region.Entity in '..\..\PokeWrapper\Source\Entities\Locations\Region.Entity.pas',
  PalParkArea.Entity in '..\..\PokeWrapper\Source\Entities\Locations\PalParkArea.Entity.pas',
  LocationArea.Entity in '..\..\PokeWrapper\Source\Entities\Locations\LocationArea.Entity.pas',
  Location.Entity in '..\..\PokeWrapper\Source\Entities\Locations\Location.Entity.pas',
  VersionGroup.Entity in '..\..\PokeWrapper\Source\Entities\Games\VersionGroup.Entity.pas',
  Generation.Entity in '..\..\PokeWrapper\Source\Entities\Games\Generation.Entity.pas',
  EvolutionTrigger.Entity in '..\..\PokeWrapper\Source\Entities\Evolution\EvolutionTrigger.Entity.pas',
  EvolutionChain.Entity in '..\..\PokeWrapper\Source\Entities\Evolution\EvolutionChain.Entity.pas',
  EncounterConditionValue.Entity in '..\..\PokeWrapper\Source\Entities\Encounters\EncounterConditionValue.Entity.pas',
  EncounterCondition.Entity in '..\..\PokeWrapper\Source\Entities\Encounters\EncounterCondition.Entity.pas',
  PokeList.Entity in '..\..\PokeWrapper\Source\Entities\List\PokeList.Entity.pas',
  BerryFlavor.Entity in '..\..\PokeWrapper\Source\Entities\Berries\BerryFlavor.Entity.pas',
  BerryFirmness.Entity in '..\..\PokeWrapper\Source\Entities\Berries\BerryFirmness.Entity.pas',
  Berry.Entity in '..\..\PokeWrapper\Source\Entities\Berries\Berry.Entity.pas',
  Version.Entity in '..\..\PokeWrapper\Source\Entities\Games\Version.Entity.pas',
  ItemPocket.Entity in '..\..\PokeWrapper\Source\Entities\Items\ItemPocket.Entity.pas',
  EncounterMethod.Entity in '..\..\PokeWrapper\Source\Entities\Encounters\EncounterMethod.Entity.pas',
  Json.Icons in '..\Source\Icons\Json.Icons.pas',
  Pokemon.Types.Constants in '..\Source\Icons\Pokemon.Types.Constants.pas',
  SVG.TypeIcons in '..\Source\Icons\SVG.TypeIcons.pas',
  PokemonList.Search in '..\Source\Frames\Main\PokemonList.Search.pas' {SearchPokemon: TFrame};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;

end.
