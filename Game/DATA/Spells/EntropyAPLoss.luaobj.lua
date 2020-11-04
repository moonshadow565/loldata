BuffTextureName = "Permission_Entropy.dds"
BuffName = "EntropyTarget"
PersistsThroughDeath = true
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Owner",
      DestVar = "AbilityPower"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "AbilityPower",
      Src1Value = 0,
      Src2Value = 0.2,
      DestVar = "AbilityPowerToSteal",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBGetLevel,
    Params = {
      TargetVar = "Attacker",
      DestVar = "AttackerLevel"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "AttackerLevel",
      Src1Value = 5,
      Src2Value = 0,
      DestVar = "MaximumStolen",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "AbilityPowerToSteal",
      Src2Var = "MaximumStolen",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "AbilityPowerToSteal",
      MathOp = MO_MIN
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "AbilityPowerToSteal",
      DestVarTable = "InstanceVars",
      SrcVar = "AbilityPowerToSteal"
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatMagicDamageMod,
      TargetVar = "Attacker",
      DeltaVar = "AbilityPowerToSteal",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "AbilityPowerToSteal",
      Src1Value = -1,
      Src2Value = 0,
      DestVar = "NegativeAmount",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatMagicDamageMod,
      TargetVar = "Owner",
      DeltaVar = "NegativeAmount",
      Delta = 0
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "AbilityPowerToSteal",
      Index = 1
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatMagicDamageMod,
      TargetVar = "Owner",
      DeltaVar = "AbilityPowerToSteal",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "AbilityPowerToSteal",
      Src2VarTable = "InstanceVars",
      Src1Value = -1,
      Src2Value = 0,
      DestVar = "NegativeAmount",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatMagicDamageMod,
      TargetVar = "Attacker",
      DeltaVar = "NegativeAmount",
      Delta = 0
    }
  }
}
