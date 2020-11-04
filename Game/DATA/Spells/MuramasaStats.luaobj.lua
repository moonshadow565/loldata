PersistsThroughDeath = true
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatPhysicalDamageMod,
      TargetVar = "Owner",
      Delta = 4
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatCritDamageMod,
      TargetVar = "Owner",
      Delta = 0.04
    }
  },
  {
    Function = BBIfNotHasBuff,
    Params = {
      OwnerVar = "Owner",
      CasterVar = "Owner",
      BuffName = "MuramasaCheck"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemoveCurrent,
        Params = {TargetVar = "Owner"}
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "muramasacheck"
    }
  }
}
