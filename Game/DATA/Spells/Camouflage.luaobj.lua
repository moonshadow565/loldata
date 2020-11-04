BuffTextureName = "Teemo_Camouflage.dds"
BuffName = "Camouflage"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "camouflagecheck"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "camouflagestealth"
    }
  }
}
