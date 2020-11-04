NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = false
IsDamagingSpell = false
BuffTextureName = "Udyr_TurtleStance.dds"
BuffName = "UdyrTurtleActivation"
OnPreDamagePriority = 3
SpellFXOverrideSkins = {"SpiritUdyr"}
DoOnPreDamageInExpirationOrder = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "udyr_turtlestance.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "udyr_turtlestance_buf.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "udyr_spirit_turtle_activation_max.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "udyr_spirit_turtle_activation.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "udyr_spirit_turtlestance_shieldbreak.troy"
    }
  }
}
