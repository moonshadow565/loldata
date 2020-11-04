NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
TargetExecuteBuildingBlocks = {
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
      Src2Value = 0.4,
      DestVar = "AbilityPower",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncHealth,
    Params = {
      TargetVar = "Target",
      Delta = 0,
      DeltaVar = "AbilityPower",
      DeltaByLevel = {
        50,
        75,
        100,
        125,
        150
      },
      HealerVar = "Owner"
    }
  }
}
