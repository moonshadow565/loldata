NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "2038_Potion_of_Elusiveness.dds"
BuffName = "Elixer of Elusiveness"
AutoBuffActivateEffect = "PotionofElusiveness_itm.troy"
AutoBuffActivateAttachBoneName = ""
PersistsThroughDeath = true
NonDispellable = true
TargetExecuteBuildingBlocks = {
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffAddType = BUFF_RENEW_EXISTING,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 240,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  }
}
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
      Src2Value = 0.005,
      DestVar = "BonusCrit",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BonusCrit",
      Src1Value = 0,
      Src2Value = 0.12,
      DestVar = "BonusCrit",
      DestVarTable = "InstanceVars",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatCritChanceMod,
      TargetVar = "Owner",
      DeltaVar = "BonusCrit",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentPercentAttackSpeedMod,
      TargetVar = "Owner",
      Delta = 0.35
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src2Var = "BonusCrit",
      Src2VarTable = "InstanceVars",
      Src1Value = -1,
      Src2Value = 0,
      DestVar = "BonusCrit",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatCritChanceMod,
      TargetVar = "Owner",
      DeltaVar = "BonusCrit",
      Delta = 0
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentPercentAttackSpeedMod,
      TargetVar = "Owner",
      Delta = -0.35
    }
  }
}
