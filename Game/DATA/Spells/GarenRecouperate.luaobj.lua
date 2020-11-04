NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "Garen_Perseverance.dds"
BuffName = "GarenRecouperate"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "garenrecoupdebuff"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "garen_heal.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "garenrecouperate1"
    }
  }
}
