UpdateSelfBuffStatsBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Level",
      SrcVar = "TalentLevel"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "HavocDamage",
      SrcValueByLevel = {0.05, 0.01}
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentPhysicalDamageMod,
      TargetVar = "Owner",
      DeltaVar = "HavocDamage",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMagicDamageMod,
      TargetVar = "Owner",
      DeltaVar = "HavocDamage",
      Delta = 0
    }
  }
}
