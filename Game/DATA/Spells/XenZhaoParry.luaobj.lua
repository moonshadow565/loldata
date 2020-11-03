NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "XinZhao_CrescentSweep.dds"
BuffName = "XenZhaoParry"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "xenziou_selfshield_01_magic.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "xenziou_ult_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "xenziou_utl_tar_02.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "xenziou_utl_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "xenziou_utl_tar_03.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "xenzhaosweeparmor"
    }
  }
}
