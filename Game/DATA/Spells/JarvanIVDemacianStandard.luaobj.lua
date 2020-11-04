NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = false
CastTime = 0.115
BuffTextureName = "JarvanIV_DemacianStandard.dds"
BuffName = "JarvanIVDemacianStandard"
SpellFXOverrideSkins = {
  "LubuJarvanIV"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "jarvandemacianstandard_buf_green.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "jarvandemacianstandard_buf_red.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "norenderexpirationbuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jarvanivdemacianstandardbuff"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "jarvandemacianstandard_mis.troy"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {Name = "testcube"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jarvanivdemacianstandarddelay"
    }
  }
}
