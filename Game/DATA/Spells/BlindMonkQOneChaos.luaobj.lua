NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "BlindMonkQOne.dds"
BuffName = "BlindMonkSonicWave"
AutoBuffActivateEffect = "global_Watched.troy"
AutoBuffActivateAttachBoneName = "head"
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
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "blindmonkqmanager"
    }
  }
}
