NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "ZiggsE.dds"
IsDeathRecapSource = true
PersistsThroughDeath = true
SpellFXOverrideSkins = {
  "ZiggsSnowday"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "ziggse_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "ziggseslow"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "ziggsesubsequent"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "ziggsemine_pool.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "ziggssnowdayemine.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "ziggsemine.troy"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "testcuberenderwcollision"
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
      Name = "nightmarebotziggse_mis_small.troy"
    }
  }
}
