NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "055_Borses_Staff_of_Apocalypse.dds"
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
