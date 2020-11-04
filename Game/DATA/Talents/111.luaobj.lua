UpdateSelfBuffStatsBuildingBlocks = {
  {
    Function = BBGetLevel,
    Params = {TargetVar = "Owner", DestVar = "OwnerLevel"}
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Owner",
      DestVar = "AbilityPowerStart"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "OwnerLevel",
      Src2Var = "TalentLevel",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "AbilityPowerMod",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "AbilityPowerMod",
      Src1Value = 0,
      Src2Value = 3.7E-4,
      DestVar = "AbilityPowerMod",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "AbilityPowerMod",
      Src2Var = "AbilityPowerStart",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "AbilityPowerBonus",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "AbilityPowerStart",
      Src1Value = 0.02,
      Src2Value = 0,
      DestVar = "AbilityPowerBonus2",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "AbilityPowerBonus",
      Src2Var = "AbilityPowerBonus2",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "AbilityPowerBonus",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatMagicDamageMod,
      TargetVar = "Owner",
      DeltaVar = "AbilityPowerBonus",
      Delta = 0
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetPercentAttackSpeedMod,
      TargetVar = "Owner",
      DestVar = "AttackSpeedStart"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "OwnerLevel",
      Src2Var = "TalentLevel",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "AttackSpeedMod",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "AttackSpeedMod",
      Src1Value = 0,
      Src2Value = 3.7E-4,
      DestVar = "AttackSpeedMod",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "AttackSpeedMod",
      Src2Var = "AttackSpeedStart",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "AttackSpeedBonus",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "AttackSpeedStart",
      Src1Value = 0.02,
      Src2Value = 0,
      DestVar = "AttackSpeedBonus2",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "AttackSpeedBonus",
      Src2Var = "AttackSpeedBonus2",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "AttackSpeedBonus",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentAttackSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "AttackSpeedBonus",
      Delta = 0
    }
  }
}
