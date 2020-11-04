NotSingleTargetSpell = false
DoesntBreakShields = False
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "GnarBig_R.dds"
BuffName = "GnarRKnockback"
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "gnar_base_r_hit.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "gnar_base_r_trail.troy"
    }
  }
}
