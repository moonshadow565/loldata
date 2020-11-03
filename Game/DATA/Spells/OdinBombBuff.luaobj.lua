NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "DrMundo_BurningAgony.dds"
BuffName = "OdinShrineBombBuff"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
AutoCooldownByLevel = {
  120,
  100,
  80,
  10,
  10
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "odin_relic_buf_red.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "odin_relic_buf_green.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "odin_prism_red.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "odin_prism_green.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinbombsuppression"
    }
  }
}
