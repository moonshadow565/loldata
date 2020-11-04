AutoBuffActivateEffect = "maokai_sapling_activated_indicator.troy"
AutoBuffActivateAttachBoneName = "C_BUFFBONE_GLB_CHEST_LOC"
IsDeathRecapSource = true
SpellFXOverrideSkins = {
  "SyndraSkin02"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "testcuberender10vision"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "expirationtimer"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "syndra_base_q_lv5_aoe_gather.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "syndra_base_q_lv5_aoe_gather_enemy.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "syndra_base_q_aoe_gather.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "syndra_base_q_aoe_gather_enemy.troy"
    }
  }
}
