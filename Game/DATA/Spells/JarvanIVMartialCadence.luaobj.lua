BuffTextureName = "JarvanIV_MartialCadence.dds"
BuffName = "JarvanIVMartialCadence"
PersistsThroughDeath = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetBuffToolTipVar,
    Params = {Value = 6, Index = 1}
  }
}
BuffOnLevelUpBuildingBlocks = {
  {
    Function = BBGetLevel,
    Params = {TargetVar = "Owner", DestVar = "Level"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "HealthPerc",
      SrcValueByLevel = {
        6,
        6,
        6,
        6,
        6,
        6,
        8,
        8,
        8,
        8,
        8,
        8,
        10,
        10,
        10,
        10,
        10,
        10
      }
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "HealthPerc",
      Index = 1
    }
  }
}
