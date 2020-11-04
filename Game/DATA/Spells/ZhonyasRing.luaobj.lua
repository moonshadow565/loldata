BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src1Var = "MagicDamage",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0.2,
      DestVar = "MagicDamageBoost",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatMagicDamageMod,
      TargetVar = "Owner",
      DeltaVar = "MagicDamageBoost",
      Delta = 0
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Owner",
      DestVar = "MagicDamage",
      DestVarTable = "InstanceVars"
    }
  }
}
