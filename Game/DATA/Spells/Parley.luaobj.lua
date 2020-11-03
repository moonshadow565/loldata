NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
SpellDamageRatio = 1
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "GoldGain",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBSpellBuffRemoveCurrent,
    Params = {TargetVar = "Owner"}
  }
}
BuffOnDeathBuildingBlocks = {
  {
    Function = BBSetBuffCasterUnit,
    Params = {CasterVar = "Caster"}
  },
  {
    Function = BBIf,
    Params = {Src1Var = "Attacker", CompareOp = CO_IS_NOT_DEAD},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "Attacker",
          Src2Var = "Caster",
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBIncGold,
            Params = {
              TargetVar = "Attacker",
              Delta = 0,
              DeltaVar = "GoldGain",
              DeltaVarTable = "InstanceVars"
            }
          }
        }
      }
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatCritChanceMod,
      TargetVar = "Attacker",
      DestVar = "CritChance"
    }
  },
  {
    Function = BBIf,
    Params = {Src1Var = "CritChance", CompareOp = CO_RANDOM_CHANCE_LESS_THAN},
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "HitResult", SrcValue = HIT_Critical}
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "HitResult", SrcValue = HIT_Normal}
      }
    }
  },
  {
    Function = BBBreakSpellShields,
    Params = {TargetVar = "Target"}
  },
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
      DestVar = "GoldGain",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        4,
        6,
        8,
        10,
        12
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 0.01,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ParBaseDamage",
      SrcValueByLevel = {
        20,
        45,
        70,
        95,
        120
      }
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetBaseAttackDamage,
      TargetVar = "Owner",
      DestVar = "BaseDamage"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "BaseDamage",
      Src1Value = 1,
      Src2Value = 0,
      DestVar = "BaseDamage",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "ParBaseDamage",
      Src2Var = "BaseDamage",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "DamageVar",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      CallForHelpAttackerVar = "Attacker",
      TargetVar = "Target",
      Damage = 0,
      DamageVar = "DamageVar",
      DamageType = PHYSICAL_DAMAGE,
      SourceDamageType = DAMAGESOURCE_ATTACK,
      PercentOfAttack = 1,
      SpellDamageRatio = 0,
      PhysicalDamageRatio = 1,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  }
}
