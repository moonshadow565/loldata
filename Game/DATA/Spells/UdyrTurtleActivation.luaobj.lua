NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = false
IsDamagingSpell = false
BuffTextureName = "Udyr_TurtleStance.dds"
BuffName = "UdyrTurtleActivation"
OnPreDamagePriority = 3
DoOnPreDamageInExpirationOrder = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "turtlestance.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "turtlestance_buf.troy"
    }
  }
}
