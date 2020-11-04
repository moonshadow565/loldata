UpdateSelfBuffStatsBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Level",
      SrcVar = "TalentLevel"
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentRespawnTimeMod,
      TargetVar = "Owner",
      Delta = 0,
      DeltaByLevel = {
        -0.033,
        -0.066,
        -0.1
      }
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentGoldLostOnDeathMod,
      TargetVar = "Owner",
      Delta = 0,
      DeltaByLevel = {
        -0.033,
        -0.066,
        -0.01
      }
    }
  }
}
