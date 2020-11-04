BuffTextureName = "MissFortune_ImpureShots.dds"
BuffName = "MissFortuneViciousStrikes"
PersistsThroughDeath = true
NonDispellable = true
SpellFXOverrideSkins = {
  "MissFortuneSkin07"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "missfortune_base_w_buf.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "missfortune_base_w_buf_rweapon.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "missfortune_base_w_buf_lweapon.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "internal_50ms"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "grievouswound"
    }
  }
}
