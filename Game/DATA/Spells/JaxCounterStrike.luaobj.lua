NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "Armsmaster_Disarm.dds"
BuffName = "JaxEvasion"
AutoBuffActivateEffect = "JaxDodger.troy"
AutoBuffActivateAttachBoneName = ""
OnPreDamagePriority = 3
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "jaxdodger.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "shen_feint_self_deactivate.troy"
    }
  }
}
