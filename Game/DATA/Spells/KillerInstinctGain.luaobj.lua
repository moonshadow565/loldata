NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = false
IsDamagingSpell = false
PersistsThroughDeath = true
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "IncrementGain",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "IncrementGain",
      Src1VarTable = "CharVars",
      Src2Var = "IncrementGain",
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "IncrementGain",
      DestVarTable = "CharVars",
      MathOp = MO_ADD
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {}
