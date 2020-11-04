NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
IsDamagingSpell = true
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetBuffCasterUnit,
    Params = {CasterVar = "Attacker"}
  },
  {
    Function = BBIf,
    Params = {Src1Var = "Owner", CompareOp = CO_IS_DEAD}
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBGetStat,
        Params = {
          Stat = GetBaseAttackDamage,
          TargetVar = "Attacker",
          DestVar = "TotalAttackDamage"
        }
      },
      {
        Function = BBGetStat,
        Params = {
          Stat = GetFlatCritChanceMod,
          TargetVar = "Attacker",
          DestVar = "CritChance"
        }
      },
      {
        Function = BBGetStat,
        Params = {
          Stat = GetFlatCritDamageMod,
          TargetVar = "Attacker",
          DestVar = "CritDamage"
        }
      },
      {
        Function = BBGetStat,
        Params = {
          Stat = GetPercentLifeStealMod,
          TargetVar = "Attacker",
          DestVar = "LifestealPercent"
        }
      },
      {
        Function = BBGetTotalAttackDamage,
        Params = {TargetVar = "Attacker", DestVar = "TAD"}
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "CritDamage",
          Src1Value = 2,
          Src2Value = 0,
          DestVar = "CritDamage",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "LifestealPercent",
          Src2Var = "TAD",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "LifestealHeal",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "LifestealHeal",
          Src1Value = 0.33,
          Src2Value = 0,
          DestVar = "LifestealHeal",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "CritDamage",
          Src2Var = "LifestealHeal",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "CritLifestealHeal",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "CritDamage",
          Src1Value = 0.33,
          Src2Value = 0,
          DestVar = "CritDamage",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBIf,
        Params = {Src1Var = "CritChance", CompareOp = CO_RANDOM_CHANCE_LESS_THAN},
        SubBlocks = {
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              TargetVar = "Owner",
              Damage = 0,
              DamageVar = "TotalAttackDamage",
              DamageType = PHYSICAL_DAMAGE,
              SourceDamageType = DAMAGESOURCE_PROC,
              PercentOfAttack = 0,
              PercentOfAttackVar = "CritDamage",
              SpellDamageRatio = 0,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          },
          {
            Function = BBIncHealth,
            Params = {
              TargetVar = "Attacker",
              Delta = 0,
              DeltaVar = "CritLifestealHeal",
              HealerVar = "Attacker"
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
              TargetVar = "Owner",
              Damage = 0,
              DamageVar = "TotalAttackDamage",
              DamageType = PHYSICAL_DAMAGE,
              SourceDamageType = DAMAGESOURCE_PROC,
              PercentOfAttack = 0.33,
              SpellDamageRatio = 0,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          },
          {
            Function = BBIncHealth,
            Params = {
              TargetVar = "Attacker",
              Delta = 0,
              DeltaVar = "LifestealHeal",
              HealerVar = "Attacker"
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {Src1Var = "CritChance", CompareOp = CO_RANDOM_CHANCE_LESS_THAN},
        SubBlocks = {
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              TargetVar = "Owner",
              Damage = 0,
              DamageVar = "TotalAttackDamage",
              DamageType = PHYSICAL_DAMAGE,
              SourceDamageType = DAMAGESOURCE_PROC,
              PercentOfAttack = 0,
              PercentOfAttackVar = "CritDamage",
              SpellDamageRatio = 0,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          },
          {
            Function = BBIncHealth,
            Params = {
              TargetVar = "Attacker",
              Delta = 0,
              DeltaVar = "CritLifestealHeal",
              HealerVar = "Attacker"
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
              TargetVar = "Owner",
              Damage = 0,
              DamageVar = "TotalAttackDamage",
              DamageType = PHYSICAL_DAMAGE,
              SourceDamageType = DAMAGESOURCE_PROC,
              PercentOfAttack = 0.33,
              SpellDamageRatio = 0,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          },
          {
            Function = BBIncHealth,
            Params = {
              TargetVar = "Attacker",
              Delta = 0,
              DeltaVar = "LifestealHeal",
              HealerVar = "Attacker"
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
      Stat = GetBaseAttackDamage,
      TargetVar = "Owner",
      DestVar = "BaseDamage"
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatCritChanceMod,
      TargetVar = "Owner",
      DestVar = "CritChance"
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatCritDamageMod,
      TargetVar = "Owner",
      DestVar = "CritDamage"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "CritDamage",
      Src1Value = 2,
      Src2Value = 0,
      DestVar = "CritDamage",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "CritDamage",
      Src1Value = 0.33,
      Src2Value = 0,
      DestVar = "CritDamage",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Attacker",
          BuffAddType = BUFF_REPLACE_EXISTING,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberStacks = 1,
          Duration = 0.05,
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
        Function = BBIf,
        Params = {Src1Var = "CritChance", CompareOp = CO_RANDOM_CHANCE_LESS_THAN},
        SubBlocks = {
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              TargetVar = "Target",
              Damage = 0,
              DamageVar = "BaseDamage",
              DamageType = PHYSICAL_DAMAGE,
              SourceDamageType = DAMAGESOURCE_PROC,
              PercentOfAttack = 0,
              PercentOfAttackVar = "CritDamage",
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
              DamageVar = "BaseDamage",
              DamageType = PHYSICAL_DAMAGE,
              SourceDamageType = DAMAGESOURCE_PROC,
              PercentOfAttack = 0.33,
              SpellDamageRatio = 0,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {Src1Var = "CritChance", CompareOp = CO_RANDOM_CHANCE_LESS_THAN},
        SubBlocks = {
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              TargetVar = "Target",
              Damage = 0,
              DamageVar = "BaseDamage",
              DamageType = PHYSICAL_DAMAGE,
              SourceDamageType = DAMAGESOURCE_PROC,
              PercentOfAttack = 0,
              PercentOfAttackVar = "CritDamage",
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
              DamageVar = "BaseDamage",
              DamageType = PHYSICAL_DAMAGE,
              SourceDamageType = DAMAGESOURCE_PROC,
              PercentOfAttack = 0.33,
              SpellDamageRatio = 0,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          }
        }
      }
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      TargetVar = "Target",
      Damage = 0,
      DamageVar = "BaseDamage",
      DamageType = PHYSICAL_DAMAGE,
      SourceDamageType = DAMAGESOURCE_ATTACK,
      PercentOfAttack = 0.33,
      SpellDamageRatio = 0,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  }
}
