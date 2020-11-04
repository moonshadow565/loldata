OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "MaxMana",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src2Var = "MaxMana",
      Src2VarTable = "InstanceVars",
      Src1Value = 0.025,
      Src2Value = 0,
      DestVar = "BonusAbilityPower",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatMagicDamageMod,
      TargetVar = "Owner",
      DeltaVar = "BonusAbilityPower",
      Delta = 0
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBGetManaOrHealth,
    Params = {
      DestVar = "MaxMana",
      DestVarTable = "InstanceVars",
      OwnerVar = "Owner",
      Function = GetMaxMana
    }
  }
}
