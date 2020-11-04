BuffTextureName = "Karma_W1.dds"
BuffName = "KarmaSpiritBind"
AutoBuffActivateEffect = "global_Watched.troy"
AutoBuffActivateAttachBoneName = "C_BUFFBONE_GLB_HEAD_LOC"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "karmaspiritbind"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "karmaspiritbindslow"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "tempkarma_spiritbindtether_beam.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "karmaspiritbindroot"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "tempkarma_w_cas.troy"
    }
  }
}
