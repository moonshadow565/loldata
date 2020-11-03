NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "LuxPrismaWrap.dds"
BuffName = "LuxShield"
AutoBuffActivateEffect = "LuxPrismaticWave_shieldself.troy"
AutoBuffActivateAttachBoneName = ""
OnPreDamagePriority = 3
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
