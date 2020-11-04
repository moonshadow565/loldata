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
      Name = "tempkarma_spiritbindroot_tar5.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "tempkarma_spiritbindroot_tar4.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "tempkarma_spiritbindroot_tar3.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "tempkarma_spiritbindroot_tar2.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "tempkarma_spiritbindroot_tar.troy"
    }
  }
}
