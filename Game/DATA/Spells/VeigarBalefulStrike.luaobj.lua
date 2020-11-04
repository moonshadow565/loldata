NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
SpellDamageRatio = 1
AutoCooldownByLevel = {
  8,
  7,
  6,
  5,
  4
}
OnBuffDeactivateBuildingBlocks = {}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBSpellBuffRemoveCurrent,
    Params = {TargetVar = "Owner"}
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_NOT_DEAD},
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Target",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 1,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      }
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      CallForHelpAttackerVar = "Attacker",
      TargetVar = "Target",
      DamageByLevel = {
        80,
        125,
        170,
        215,
        260
      },
      Damage = 0,
      DamageType = MAGIC_DAMAGE,
      SourceDamageType = DAMAGESOURCE_SPELL,
      PercentOfAttack = 1,
      SpellDamageRatio = 0.6,
      PhysicalDamageRatio = 1,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  }
}
BuffOnKillBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "TotalBonus",
      Src1VarTable = "CharVars",
      Src2Var = "MaxBonus",
      Src2VarTable = "CharVars",
      CompareOp = CO_LESS_THAN
    },
    SubBlocks = {
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "Level",
          SpellSlotValue = 0,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          OwnerVar = "Owner",
          Function = GetSlotSpellLevel
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "TotalBonus",
          Src2VarTable = "CharVars",
          Src1Value = 1,
          Src2Value = 0,
          DestVar = "BonusAdd",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "TotalBonus",
          DestVarTable = "CharVars",
          SrcVar = "BonusAdd"
        }
      },
      {
        Function = BBIncPermanentStat,
        Params = {
          Stat = IncPermanentFlatMagicDamageMod,
          TargetVar = "Owner",
          Delta = 1
        }
      }
    }
  }
}
BuffOnLevelUpSpellBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "Slot",
      Value2 = 0,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "Level",
          SpellSlotValue = 0,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          OwnerVar = "Owner",
          Function = GetSlotSpellLevel
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "BonusAP",
          DestVarTable = "NextBuffVars",
          SrcVar = "BonusAP",
          SrcVarTable = "InstanceVars"
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "MaxBonus",
          DestVarTable = "CharVars",
          SrcValueByLevel = {
            9999,
            9999,
            9999,
            9999,
            9999
          }
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "MaxBonus",
          DestVarTable = "NextBuffVars",
          SrcVar = "MaxBonus",
          SrcVarTable = "CharVars"
        }
      }
    }
  }
}
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "BonusAP",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "MaxBonus",
      RequiredVarTable = "InstanceVars"
    }
  }
}
