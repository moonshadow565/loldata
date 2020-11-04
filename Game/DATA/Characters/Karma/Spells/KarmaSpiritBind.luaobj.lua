BuffTextureName = "Karma_W1.dds"
BuffName = "KarmaSpiritBind"
AutoBuffActivateEffect = "global_Watched.troy"
AutoBuffActivateAttachBoneName = "C_BUFFBONE_GLB_HEAD_LOC"
SpellVOOverrideSkins = {
  "KarmaClassic"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "karmaspiritbind"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "karma_passive_refresh.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "karma_w_heal_01.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "karma_w_heal_02.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "tempkarma_spiritbindtethermantra_beam.troy"
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
