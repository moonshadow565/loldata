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
      Name = "rengarqbuffbonusmaxinternal"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rengarqbuffbonusinternal"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rengarqanimation"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "Rengar_Base_Q_Tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "Rengar_Base_Q_Max_Tar.troy"
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
