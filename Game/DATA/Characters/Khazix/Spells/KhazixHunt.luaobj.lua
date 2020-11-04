BuffTextureName = "RengarUlt.dds"
BuffName = "KhazixHunt"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "khazixhuntdefeatr"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "khazixhuntvictoryk"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "victory_glb.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "khazixevolve"
    }
  }
}
