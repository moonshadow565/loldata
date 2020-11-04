NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
AutoBuffActivateEffect = ""
ChainMissileParameters = {
  MaximumHits = {
    2,
    3,
    4,
    5,
    6
  },
  CanHitCaster = 0,
  CanHitSameTarget = 0,
  CanHitSameTargetConsecutively = 0
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BBBaseDamage",
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
    Function = BBGetTotalAttackDamage,
    Params = {
      TargetVar = "Owner",
      DestVar = "TotalDamage"
    }
  },
  {
    Function = BBGetCastInfo,
    Params = {DestVar = "BBCounter", Info = GetCastSpellTargetsHitPlusOne}
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "KillerInstinctBuff"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "KillerInstinctBuff"
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Attacker",
          BuffName = "KillerInstinctBuff2",
          BuffAddType = BUFF_REPLACE_EXISTING,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberStacks = 1,
          Duration = 4,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      }
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "KillerInstinctBuff2"
    },
    SubBlocks = {
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "Level",
          SpellSlotValue = 1,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          OwnerVar = "Owner",
          Function = GetSlotSpellLevel
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "Level",
          DestVarTable = "NextBuffVars",
          SrcVar = "Level"
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Attacker",
          BuffName = "BouncingBladeMS",
          BuffAddType = BUFF_REPLACE_EXISTING,
          BuffType = BUFF_CombatDehancer,
          MaxStack = 1,
          NumberStacks = 1,
          Duration = 7,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "TotalDamage",
          Src2Var = "BBBaseDamage",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "DamageVar",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBGetCastInfo,
        Params = {DestVar = "TargetNum", Info = GetCastSpellTargetsHitPlusOne}
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "TargetNum",
          Value2 = 1,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              TargetVar = "Target",
              Damage = 0,
              DamageVar = "DamageVar",
              DamageType = MAGIC_DAMAGE,
              SourceDamageType = DAMAGESOURCE_SPELL,
              PercentOfAttack = 1,
              SpellDamageRatio = 0,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              TargetVar = "Target",
              Damage = 0,
              DamageVar = "DamageVar",
              DamageType = MAGIC_DAMAGE,
              SourceDamageType = DAMAGESOURCE_SPELLAOE,
              PercentOfAttack = 1,
              SpellDamageRatio = 0,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          }
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Attacker",
          BuffName = "VoracityMarker",
          BuffAddType = BUFF_REPLACE_EXISTING,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberStacks = 1,
          Duration = 15,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "TotalDamage",
          Src2Var = "BBBaseDamage",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "DamageVar",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Attacker",
          BuffName = "VoracityMarker",
          BuffAddType = BUFF_REPLACE_EXISTING,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberStacks = 1,
          Duration = 15,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "BBCounter",
          Value2 = 6,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "DamageVar",
              Src1Value = 0,
              Src2Value = 0.5,
              DestVar = "DamageVar",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              TargetVar = "Target",
              Damage = 0,
              DamageVar = "DamageVar",
              DamageType = MAGIC_DAMAGE,
              SourceDamageType = DAMAGESOURCE_SPELLAOE,
              PercentOfAttack = 1,
              SpellDamageRatio = 0,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "BBCounter",
          Value2 = 5,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "DamageVar",
              Src1Value = 0,
              Src2Value = 0.6,
              DestVar = "DamageVar",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              TargetVar = "Target",
              Damage = 0,
              DamageVar = "DamageVar",
              DamageType = MAGIC_DAMAGE,
              SourceDamageType = DAMAGESOURCE_SPELLAOE,
              PercentOfAttack = 1,
              SpellDamageRatio = 0,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "BBCounter",
          Value2 = 4,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "DamageVar",
              Src1Value = 0,
              Src2Value = 0.7,
              DestVar = "DamageVar",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              TargetVar = "Target",
              Damage = 0,
              DamageVar = "DamageVar",
              DamageType = MAGIC_DAMAGE,
              SourceDamageType = DAMAGESOURCE_SPELLAOE,
              PercentOfAttack = 1,
              SpellDamageRatio = 0,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "BBCounter",
          Value2 = 3,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "DamageVar",
              Src1Value = 0,
              Src2Value = 0.8,
              DestVar = "DamageVar",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              TargetVar = "Target",
              Damage = 0,
              DamageVar = "DamageVar",
              DamageType = MAGIC_DAMAGE,
              SourceDamageType = DAMAGESOURCE_SPELLAOE,
              PercentOfAttack = 1,
              SpellDamageRatio = 0,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "BBCounter",
          Value2 = 2,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "DamageVar",
              Src1Value = 0,
              Src2Value = 0.9,
              DestVar = "DamageVar",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              TargetVar = "Target",
              Damage = 0,
              DamageVar = "DamageVar",
              DamageType = MAGIC_DAMAGE,
              SourceDamageType = DAMAGESOURCE_SPELLAOE,
              PercentOfAttack = 1,
              SpellDamageRatio = 0,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              TargetVar = "Target",
              Damage = 0,
              DamageVar = "DamageVar",
              DamageType = MAGIC_DAMAGE,
              SourceDamageType = DAMAGESOURCE_SPELL,
              PercentOfAttack = 1,
              SpellDamageRatio = 0,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          }
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "killerinstinctbuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "killerinstinctbuff2"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "bouncingbladems"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "voracitymarker"
    }
  }
}
