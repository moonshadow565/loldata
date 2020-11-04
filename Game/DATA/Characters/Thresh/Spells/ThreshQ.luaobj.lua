NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Thresh_Q.dds"
BuffName = "ThreshQ"
PopupMessage1 = "game_floatingtext_Stunned"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "thresh_q_stab_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "threshqinternal"
    }
  }
}
