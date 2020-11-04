NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffName = "SonaSongofDiscordSound"
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
      Name = "sonasoundofdiscordsound.troy"
    }
  }
}
