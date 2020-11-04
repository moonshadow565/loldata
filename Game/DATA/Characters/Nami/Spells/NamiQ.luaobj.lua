AutoBuffActivateEffect = "maokai_sapling_activated_indicator.troy"
AutoBuffActivateAttachBoneName = "C_BUFFBONE_GLB_CHEST_LOC"
IsDeathRecapSource = true
SpellFXOverrideSkins = {"NamiKoi"}
SpellVOOverrideSkins = {"NamiSkin02"}
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
    Function = BBPreloadSpell,
    Params = {
      Name = "namiqmissile"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nami_base_q_indicator_green.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nami_base_q_indicator_red.troy"
    }
  }
}
