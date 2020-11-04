NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "EliseSpiderQ.dds"
BuffName = "EliseSpiderQCast"
AutoBuffActivateEffect = "Global_Slow.troy"
AutoBuffActivateAttachBoneName2 = "C_BUFFBONE_GLB_HEAD_LOC"
IsDeathRecapSource = true
SpellVOOverrideSkins = {
  "HyenaWarwick"
}
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "elisespiderqslow"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "elisespiderqcast"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "elisespiderlingleap"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "elisespiderlingleapboom"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "elise_spider_q_tar.troy"
    }
  }
}
