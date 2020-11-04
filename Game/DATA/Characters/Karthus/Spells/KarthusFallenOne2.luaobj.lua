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
    Function = BBPreloadParticle,
    Params = {
      Name = "karthus_base_r_explosion.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "Karthus_Base_R_Target.troy"
    }
  }
}
