NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "Armsmaster_Disarm.dds"
BuffName = "JaxEvasion"
AutoBuffActivateEffect = "JaxDodger.troy"
AutoBuffActivateEffect2 = "jax_immortal_e_cas_02.troy"
AutoBuffActivateAttachBoneName2 = "R_hand"
OnPreDamagePriority = 3
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
      Name = "counterstrike_cas.troy"
    }
  }
}
