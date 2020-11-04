BuffTextureName = "Vladimir_BloodGorged.dds"
BuffName = "VladimirBloodGorged"
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
    Function = BBIncMaxHealth,
    Params = {
      TargetVar = "Owner",
      Delta = 0,
      DeltaVar = "HPMod",
      DeltaVarTable = "InstanceVars",
      IncCurrentHealth = false
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "HPMod",
      ValueVarTable = "InstanceVars",
      Index = 2
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "APMod",
      ValueVarTable = "InstanceVars",
      Index = 1
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
      Src2Value = 0.025,
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
      Src2Value = 1.4,
      DestVar = "HPMod",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  }
}
