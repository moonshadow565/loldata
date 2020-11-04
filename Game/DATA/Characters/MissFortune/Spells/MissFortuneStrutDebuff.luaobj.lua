BuffTextureName = "MissFortune_Strut_Grey.dds"
BuffName = "Miss Fortune Strut Cooldown"
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "missfortunestrutdebuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "missfortunestrut"
    }
  }
}
