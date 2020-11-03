NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Minotaur_TriumphantRoar.dds"
BuffName = "Triumphant Roar"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "meditate_eff.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "alistartrample"
    }
  }
}
