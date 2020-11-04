NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "MasterYi_R.dds"
AutoBuffActivateEffect = "MasterYi_Base_R_Cas.troy"
AutoCooldownByLevel = {
  75,
  75,
  75,
  18,
  14
}
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "masteryi_base_r_buf_lvl3.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "masteryi_base_r_buf_lvl2.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "masteryi_base_r_buf.troy"
    }
  }
}
