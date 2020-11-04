AutoBuffActivateEffect = "EternalThirst_buf.troy"
UpdateSelfBuffStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatPhysicalDamageMod,
      TargetVar = "Owner",
      DeltaVar = "PhysicalDamageBonus",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentLifeStealMod,
      TargetVar = "Owner",
      DeltaVar = "PercentLifeSteal",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
ItemOnKillBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src1Var = "PhysicalDamageBonus",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 1,
      DestVar = "PhysicalDamageBonus",
      DestVarTable = "InstanceVars",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "PercentLifeSteal",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0.0025,
      DestVar = "PercentLifeSteal",
      DestVarTable = "InstanceVars",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "PhysicalDamageBonus",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 40,
      DestVar = "PhysicalDamageBonus",
      DestVarTable = "InstanceVars",
      MathOp = MO_MIN
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "PercentLifeSteal",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0.1,
      DestVar = "PercentLifeSteal",
      DestVarTable = "InstanceVars",
      MathOp = MO_MIN
    }
  }
}
ItemOnDeathBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "PhysicalDamageBonus",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "PercentLifeSteal",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  }
}
OnActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "PhysicalDamageBonus",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "PercentLifeSteal",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  }
}
