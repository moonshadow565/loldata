BuffTextureName = "ChemicalMan_EmpoweredBulwark.dds"
BuffName = "Empowered Bulwark"
PersistsThroughDeath = true
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "HPMod",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "APMod",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatMagicDamageMod,
      TargetVar = "Owner",
      DeltaVar = "APMod",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatHPPoolMod,
      TargetVar = "Owner",
      DeltaVar = "HPMod",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatHPPoolMod,
      TargetVar = "Owner",
      DestVar = "CurrentHP"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "CurrentHP",
      Src2Var = "HPMod",
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "CurrentHP",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Owner",
      DestVar = "CurrentAP"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "CurrentAP",
      Src2Var = "APMod",
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "CurrentAP",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "CurrentHP",
      Src1Value = 0,
      Src2Value = 0.0555,
      DestVar = "APMod",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "CurrentAP",
      Src1Value = 0,
      Src2Value = 3,
      DestVar = "HPMod",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  }
}
