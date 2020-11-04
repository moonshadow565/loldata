BuffTextureName = "Draven_passive.dds"
BuffName = "DravenPassive"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "ezreal_cyberezreal_recall.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "ezreal_cyberezreal_summonerteleport.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "dariusrecalloverride"
    }
  }
}
