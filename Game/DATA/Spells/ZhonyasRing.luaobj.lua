DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src2Var = "abilityPower",
      Src2VarTable = "InstanceVars",
      Src1Value = 0.3,
      Src2Value = 0,
      DestVar = "newAPMod",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatMagicDamageMod,
      TargetVar = "Owner",
      DeltaVar = "newAPMod",
      Delta = 0
    }
  }
}
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Owner",
      DestVar = "abilityPower",
      DestVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Owner",
      DestVar = "abilityPower",
      DestVarTable = "InstanceVars"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "abilityPower",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 1.3,
      DestVar = "abilityPower",
      DestVarTable = "InstanceVars",
      MathOp = MO_DIVIDE
    }
  }
}
