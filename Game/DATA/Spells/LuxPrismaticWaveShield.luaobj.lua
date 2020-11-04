NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "LuxPrismaWrap.dds"
BuffName = "LuxShield"
AutoBuffActivateEffect = "LuxPrismaticWave_shield.troy"
OnPreDamagePriority = 3
SpellFXOverrideSkins = {
  "SteelLegionLux"
}
DoOnPreDamageInExpirationOrder = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "shen_feint_self_deactivate.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "spelleffect_proc.troy"
    }
  }
}
