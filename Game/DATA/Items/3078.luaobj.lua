BuffTextureName = "3078_Trinity_Force.dds"
BuffName = "Hamstring"
AutoBuffActivateEffect = "Global_Slow.troy"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "sheen"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "internal_30slow"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "internal_20slow"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "itemslow"}
  }
}
