BuffTextureName = "Jester_CarefulStrikes.dds"
BuffName = "Backstab"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "castfrombehind"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "absolutezero_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "twoshivpoison"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "frombehind"}
  }
}
