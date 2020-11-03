BuffTextureName = "MaokaiSapMagic.dds"
BuffName = "MaokaiSapMagicPass"
PersistsThroughDeath = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "HealAmount",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
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
      Src2Value = 0.07,
      DestVar = "HealAmount",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "HealAmount",
      Src1VarTable = "InstanceVars",
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
