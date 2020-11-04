NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = false
IsDamagingSpell = false
BuffTextureName = "Udyr_BearStance.dds"
BuffName = "UdyrBearActivation"
AutoBuffActivateEffect = "Udyr_BearStance.troy"
SpellFXOverrideSkins = {"SpiritUdyr"}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "primalcharge.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "udyr_spirit_bear_activation_max.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "udyr_spirit_bear_activation.troy"
    }
  }
}
