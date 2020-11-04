BuffTextureName = "LeblancMirrorImage.dds"
BuffName = "LeblancNoxianCruelty"
PersistsThroughDeath = true
Nondispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "leblancmiapplicator"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "leblancpassivecooldown"
    }
  }
}
