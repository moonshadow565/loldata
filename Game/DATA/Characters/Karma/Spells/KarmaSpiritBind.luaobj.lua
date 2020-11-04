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
      Name = "karma_base_p_refresh.troy"
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
      Name = "karma_base_w_beam_r.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "karma_base_w_beam.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "karmaspiritbindroot"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "karmaspiritbindcheck"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "karma_base_w_cas.troy"
    }
  }
}
