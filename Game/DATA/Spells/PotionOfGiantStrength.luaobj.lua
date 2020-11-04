NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "2037_Potion_of_Giant_Strength.dds"
BuffName = "Elixer of Fortitude"
AutoBuffActivateEffect = "PotionofGiantStrength_itm.troy"
PersistsThroughDeath = true
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetLevel,
    Params = {TargetVar = "Owner", DestVar = "Level"}
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Level",
      Src1Value = 0,
      Src2Value = 5.59,
      DestVar = "BonusHealth",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BonusHealth",
      Src1Value = 0,
      Src2Value = 134.41,
      DestVar = "BonusHealth",
      DestVarTable = "InstanceVars",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatHPPoolMod,
      TargetVar = "Owner",
      DeltaVar = "BonusHealth",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatPhysicalDamageMod,
      TargetVar = "Owner",
      Delta = 10
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src2Var = "BonusHealth",
      Src2VarTable = "InstanceVars",
      Src1Value = -1,
      Src2Value = 0,
      DestVar = "BonusHealth",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatHPPoolMod,
      TargetVar = "Owner",
      DeltaVar = "BonusHealth",
      Delta = 0
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatPhysicalDamageMod,
      TargetVar = "Owner",
      Delta = -10
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 240,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  }
}
