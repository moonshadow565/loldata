DoesntBreakShields = false
DoesntTriggerSpellCasts = true
BuffTextureName = "LuxIlluminatingFraulein.dds"
BuffName = "LuxIlluminationPassive"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "luxilluminatingfraulein"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "luxpassive_tar.troy"
    }
  }
}
