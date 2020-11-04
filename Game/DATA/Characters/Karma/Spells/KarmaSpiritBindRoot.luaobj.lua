NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Karma_W1.dds"
BuffName = "KarmaSpiritBindRoot"
AutoBuffActivateEffect = "global_Watched.troy"
AutoBuffActivateAttachBoneName = "C_BUFFBONE_GLB_HEAD_LOC"
PopupMessage1 = "game_floatingtext_Snared"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "karma_base_w_tar_05.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "karma_base_w_tar_04.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "karma_base_w_tar_03.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "karma_base_w_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "karma_base_w_tar_02.troy"
    }
  }
}
