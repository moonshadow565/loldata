NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = false
IsDamagingSpell = false
BuffTextureName = "VeigarEntropy.dds"
BuffName = "VeigarEquilibrium"
PersistsThroughDeath = true
NonDispellable = true
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "PercentMana",
      OwnerVar = "Owner",
      Function = GetPARPercent,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "PercentMana",
      Src1Value = 1,
      Src2Value = 0,
      DestVar = "PercentMissing",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "PercentMissing",
      Src1Value = 0.75,
      Src2Value = 0,
      DestVar = "PercentMissing",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncPercentPARRegenMod,
    Params = {
      PARType = PAR_MANA,
      TargetVar = "Owner",
      DeltaVar = "PercentMissing",
      Delta = 0
    }
  }
}
