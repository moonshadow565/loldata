BuffTextureName = "3005_Atmas_Impaler.dds"
BuffName = "Atma's Impaler"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetManaOrHealth,
    Params = {
      DestVar = "OwnerHealth",
      DestVarTable = "InstanceVars",
      OwnerVar = "Owner",
      Function = GetMaxHealth
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src1Var = "OwnerHealth",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0.02,
      DestVar = "LessOwnerHealth",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatPhysicalDamageMod,
      TargetVar = "Owner",
      DeltaVar = "LessOwnerHealth",
      Delta = 0
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBGetManaOrHealth,
    Params = {
      DestVar = "OwnerHealth",
      DestVarTable = "InstanceVars",
      OwnerVar = "Owner",
      Function = GetMaxHealth
    }
  }
}
