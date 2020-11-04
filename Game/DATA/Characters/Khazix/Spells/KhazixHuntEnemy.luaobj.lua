BuffTextureName = "Khazix_P.dds"
BuffName = "KhazixHuntEnemy"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "khazixhuntvictoryr"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "khazixhuntdefeatk"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "victory_glb.troy"
    }
  }
}
