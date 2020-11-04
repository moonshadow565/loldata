NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Skarner_E.dds"
BuffName = "SkarnerFracture"
AutoBuffActivateEffect = "Skarner_Crystal_Slash_Activate_R.troy"
AutoBuffActivateAttachBoneName = "tail_t"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "skarner_fracture_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "skarner_crystal_slash_activate_r.troy"
    }
  }
}
