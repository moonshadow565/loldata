NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Skarner_E.dds"
BuffName = "SkarnerFracture"
AutoBuffActivateEffect = "Skarner_Base_Q_Activate_R.troy"
AutoBuffActivateAttachBoneName = "tail_t"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "skarner_base_e_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "skarner_base_q_activate_r.troy"
    }
  }
}
