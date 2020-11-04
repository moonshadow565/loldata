NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffName = "SonaAriaofPerseveranceSound"
PersistsThroughDeath = true
NonDispellable = true
SpellFXOverrideSkins = {"PaxSona"}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sonasoundoff"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "sonaariaofperserverancesound.troy"
    }
  }
}
