BuffTextureName = "Sejuani_Passive.dds"
BuffName = "SejuaniPassiveDisplay"
PersistsThroughDeath = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "sejuani_passive.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "sejuani_passive_self.troy"
    }
  }
}
