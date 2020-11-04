NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
ChannelDuration = 3
AutoCooldownByLevel = {
  180,
  150,
  120
}
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "fallenonetarget"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "fallenone_nova.troy"
    }
  }
}
