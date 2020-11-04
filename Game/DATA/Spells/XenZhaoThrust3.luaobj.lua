NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
SpellDamageRatio = 0.5
TargetExecuteBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "HitResult",
      Value2 = HIT_Dodge,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "HitResult", SrcValue = HIT_Normal}
      }
    }
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
    Function = BBGetTotalAttackDamage,
    Params = {TargetVar = "Owner", DestVar = "AttackDmg"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Combo1DamageLeet",
      SrcValueByLevel = {
        15,
        30,
        45,
        60,
        75
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Combo1DamageLeet",
      Src2Var = "AttackDmg",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "Combo1Damage",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBGetBuffCountFromAll,
    Params = {
      DestVar = "Count",
      TargetVar = "Owner",
      BuffName = "XenZhaoComboCounter"
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Target",
      EffectName = "xenZiou_ChainAttack_03.troy",
      Flags = 0,
      EffectIDVar = "bye",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "HitResult",
      Value2 = HIT_Critical,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "AttackDmg",
          Src1Value = 0,
          Src2Value = 2,
          DestVar = "ComboDamageCrit",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "Combo1DamageLeet",
          Src2Var = "ComboDamageCrit",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "Combo1Damage",
          MathOp = MO_ADD
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
      Damage = 0,
      DamageVar = "Combo1Damage",
      DamageType = PHYSICAL_DAMAGE,
      SourceDamageType = DAMAGESOURCE_ATTACK,
      PercentOfAttack = 1,
      SpellDamageRatio = 0,
      PhysicalDamageRatio = 0,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = true
    }
  },
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Attacker",
      AttackerVar = "Attacker",
      BuffName = "XenZhaoComboAutoFinish"
    }
  },
  {
    Function = BBBreakSpellShields,
    Params = {TargetVar = "Target"}
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Owner",
      BuffName = "XenZhaoKnockup",
      BuffAddType = BUFF_STACKS_AND_OVERLAPS,
      StacksExclusive = true,
      BuffType = BUFF_Stun,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 0.5,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "xenziou_chainattack_03.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "xenzhaocomboautofinish"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "xenzhaoknockup"
    }
  }
}
