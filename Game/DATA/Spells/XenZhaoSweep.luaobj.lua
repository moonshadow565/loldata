NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffName = "XenZhaoSweep"
SpellFXOverrideSkins = {
  "ZhaoYunXinZhao"
}
SpellVOOverrideSkins = {
  "ZhaoYunXinZhao"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "xenziou_audaciouscharge_self_trail_01.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "xenziou_audaciouscharge_tar_unit_instant.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "xenzhaosweep"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "xenzhaointimidate"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "slow"}
  }
}
