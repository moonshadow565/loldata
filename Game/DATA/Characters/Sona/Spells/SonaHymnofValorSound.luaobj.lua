NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffName = "SonaHymnofValorSound"
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
      Name = "sonahymnofvalorsound.troy"
    }
  }
}
