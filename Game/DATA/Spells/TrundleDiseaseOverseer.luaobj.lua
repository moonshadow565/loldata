NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = false
IsDamagingSpell = false
BuffTextureName = "Trundle_Decompose.dds"
BuffName = "TrundleDiseaseOverseer"
PersistsThroughDeath = true
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src1Var = "RegenValue",
      Src1VarTable = "CharVars",
      Src1Value = 0,
      Src2Value = 100,
      DestVar = "TTVar2",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "TTVar2",
      Index = 2
    }
  }
}
