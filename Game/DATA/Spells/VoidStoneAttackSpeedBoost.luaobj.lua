BuffTextureName = "Voidwalker_Netherburn.dds"
BuffName = "VoidStoneEmpowered"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "AttackSpeedBoost",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "AttackSpeedBoost",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentAttackSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "AttackSpeedBoost",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "AttackSpeedBoost",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 100,
      DestVar = "TooltipAttackSpeed",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "TooltipAttackSpeed",
      Index = 1
    }
  }
}
BuffOnPreDamageBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src1Var = "DamageAmount",
      Src1Value = 0,
      Src2Value = 0.0015,
      DestVar = "AttackSpeedIncrement",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "AttackSpeedIncrement",
      Src2Var = "AttackSpeedBoost",
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "AttackSpeedBoost",
      DestVarTable = "InstanceVars",
      MathOp = MO_ADD
    }
  }
}
