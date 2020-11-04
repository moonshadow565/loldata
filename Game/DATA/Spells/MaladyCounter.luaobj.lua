NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "3114_Malady.dds"
BuffName = "MaladySpell"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetBuffCountFromAll,
    Params = {
      DestVar = "Count",
      TargetVar = "Owner",
      BuffName = "MaladyCounter"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Count",
      Src1Value = 0,
      Src2Value = 6,
      DestVar = "ResistanceShred",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "ResistanceShred",
      Index = 1
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "maladycounter"
    }
  }
}
