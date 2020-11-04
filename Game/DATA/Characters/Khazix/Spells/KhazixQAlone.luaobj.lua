NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "SkarnerVirulentSlash.dds"
BuffName = "KhazixPDamage"
SpellFXOverrideSkins = {
  "KhazixDroid"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "khazix_base_q_singleenemy_indicator.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "khazix_base_q_singleenemypov_indicator.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "khazix_base_q_singleminion_indicator.troy"
    }
  }
}
