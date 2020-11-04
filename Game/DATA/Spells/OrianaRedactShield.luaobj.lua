NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "OriannaCommandRedact.dds"
BuffName = "OrianaRedactShield"
AutoBuffActivateEffect = "OrianaProtectShield.troy"
AutoBuffActivateAttachBoneName = "C_Buffbone_Glb_Center_Loc"
OnPreDamagePriority = 3
DoOnPreDamageInExpirationOrder = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "orianaprotectshield.troy"
    }
  }
}
