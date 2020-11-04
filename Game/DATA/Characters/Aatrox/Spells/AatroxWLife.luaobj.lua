NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "Aatrox_W2.dds"
BuffName = "AatroxWLife"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "aatroxwparticler"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "aatroxwparticle"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "aatroxwonhlifebuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "aatroxwonhlife"
    }
  }
}
