NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "2039_Potion_of_Brilliance.dds"
BuffName = "Elixer of Brilliance"
AutoBuffActivateEffect = "PotionofBrilliance_itm.troy"
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
      Src2Value = 2,
      DestVar = "BonusAP",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BonusAP",
      Src1Value = 0,
      Src2Value = 29,
      DestVar = "BonusAP",
      DestVarTable = "InstanceVars",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatMagicDamageMod,
      TargetVar = "Owner",
      DeltaVar = "BonusAP",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentPercentCooldownMod,
      TargetVar = "Owner",
      Delta = -0.1
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src2Var = "BonusAP",
      Src2VarTable = "InstanceVars",
      Src1Value = -1,
      Src2Value = 0,
      DestVar = "BonusAP",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatMagicDamageMod,
      TargetVar = "Owner",
      DeltaVar = "BonusAP",
      Delta = 0
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentPercentCooldownMod,
      TargetVar = "Owner",
      Delta = 0.1
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
      BuffType = BUFF_Aura,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 240,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  }
}
