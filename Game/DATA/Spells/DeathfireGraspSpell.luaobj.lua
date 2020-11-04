NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "3128_Deathfire_Grasp.dds"
BuffName = "DeathfireGraspSpell"
SpellDamageRatio = 1
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "deathfiregraspspell"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "obj_deathfiregrasp_debuff.troy"
    }
  }
}
