BuffTextureName = "GragasPassiveHeal.dds"
BuffName = "GragasHappyHour"
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "MaxHP",
      OwnerVar = "Target",
      Function = GetMaxHealth,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "MaxHP",
      Src1Value = 0,
      Src2Value = 0.02,
      DestVar = "HealHP",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "HealHP",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "HealAmount",
      DestVarTable = "InstanceVars",
      MathOp = MO_ROUND
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "HealAmount",
      ValueVarTable = "InstanceVars",
      Index = 1
    }
  }
}
