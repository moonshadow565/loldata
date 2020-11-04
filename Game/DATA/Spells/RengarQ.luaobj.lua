NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = false
BuffTextureName = "Armsmaster_Empower.dds"
BuffName = "RengarQ"
IsDeathRecapSource = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rengarqanimation"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "rengarq_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "rengarqmax_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rengarqbuffbonusmax"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rengarqbuffbonus"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rengarqbuff"
    }
  }
}
