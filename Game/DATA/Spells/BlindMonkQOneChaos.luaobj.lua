NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "BlindMonkQOne.dds"
BuffName = "BlindMonkSonicWave"
AutoBuffActivateEffect = "global_Watched.troy"
AutoBuffActivateAttachBoneName = "C_BUFFBONE_GLB_HEAD_LOC"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "blindmonk_q_resonatingstrike_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "blindmonk_q_resonatingstrike_tar_blood.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "blindmonk_q_tar_indicator.troy"
    }
  }
}
