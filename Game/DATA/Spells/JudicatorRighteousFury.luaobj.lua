NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Judicator_RighteousFury.dds"
BuffName = "JudicatorRighteousFury"
AutoBuffActivateEffect = "Flamesword.troy"
AutoBuffActivateAttachBoneName = "weapon"
AutoBuffActivateEffect2 = "RighteousFuryHalo_buf.troy"
AutoBuffActivateAttachBoneName2 = "head"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBOverrideAutoAttack,
    Params = {
      SpellSlot = 0,
      SlotType = ExtraSlots,
      OwnerVar = "Owner",
      AutoAttackSpellLevel = 1,
      CancelAttack = true
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "AttackRangeIncrease",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatAttackRangeMod,
      TargetVar = "Owner",
      DeltaVar = "AttackRangeIncrease",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src2Var = "AttackRangeIncrease",
      Src2VarTable = "InstanceVars",
      Src1Value = -1,
      Src2Value = 0,
      DestVar = "AttackRangeIncrease",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatAttackRangeMod,
      TargetVar = "Owner",
      DeltaVar = "AttackRangeIncrease",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBRemoveOverrideAutoAttack,
    Params = {OwnerVar = "Owner", CancelAttack = true}
  },
  {
    Function = BBCancelAutoAttack,
    Params = {TargetVar = "Owner", Reset = false}
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatAttackRangeMod,
      TargetVar = "Owner",
      DeltaVar = "AttackRangeIncrease",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "AttackRangeIncrease",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        425,
        425,
        425,
        425,
        425
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Attacker",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 10,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  }
}
