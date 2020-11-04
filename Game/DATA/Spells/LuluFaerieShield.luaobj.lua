NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "Lulu_CommandPix.dds"
BuffName = "LuluEShield"
OnPreDamagePriority = 3
DoOnPreDamageInExpirationOrder = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "lulu_e_shield_01.troy"
    }
  }
}
