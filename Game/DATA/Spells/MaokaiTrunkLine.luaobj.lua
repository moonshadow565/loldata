NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "GemKnight_Shatter.dds"
BuffName = "MaokaiTrunkSmash"
AutoBuffActivateEffect = ""
AutoBuffActivateEffect2 = ""
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "maoki_trunksmash_cas.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "maokaitrunkline"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "powerballhit.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "slow"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "maokaitrunklinestun"
    }
  }
}
