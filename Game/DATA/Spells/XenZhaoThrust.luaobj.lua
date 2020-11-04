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
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "xenZiou_ChainAttack_cas_01.troy",
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
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Target",
      EffectName = "xenZiou_ChainAttack_01.troy",
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
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "XenZhaoComboTarget"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Attacker",
      AttackerVar = "Attacker",
      BuffName = "XenZhaoComboAuto",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 5,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
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
    Function = BBIssueOrder,
    Params = {
      WhomToOrderVar = "Attacker",
      TargetOfOrderVar = "Target",
      Order = AI_ATTACKTO
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "xenziou_chainattack_cas_01.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "xenziou_chainattack_01.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "xenzhaocombotarget"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "xenzhaocomboauto"
    }
  }
}
