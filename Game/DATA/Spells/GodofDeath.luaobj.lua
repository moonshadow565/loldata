NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Nasus_AvatarOfDeath.dds"
BuffName = "GodofDeath"
AutoBuffActivateEffect = "nassus_godofDeath_sword.troy"
AutoBuffActivateAttachBoneName = "weapon"
AutoBuffActivateEffect2 = "nassus_godofDeath_overhead.troy"
AutoBuffActivateAttachBoneName2 = "R_hand"
AutoBuffActivateEffect3 = "nassus_godofDeath_overhead.troy"
AutoBuffActivateAttachBoneName3 = "L_hand"
AutoBuffActivateEffect4 = "nassus_godofDeath_aura.troy"
Nondispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "DamageCap",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "DamagePerc",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "CurrentDamageTotal",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "BonusHealth",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetScaleSkinCoef,
    Params = {Scale = 1.3, OwnerVar = "Owner"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DamageCap",
      SrcVar = "DamageCap",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DamagePerc",
      SrcVar = "DamagePerc",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 375,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit"
    },
    SubBlocks = {
      {
        Function = BBGetManaOrHealth,
        Params = {
          DestVar = "Temp1",
          OwnerVar = "Unit",
          Function = GetMaxHealth
        }
      },
      {
        Function = BBGetStat,
        Params = {
          Stat = GetFlatMagicDamageMod,
          TargetVar = "Owner",
          DestVar = "AbilityPowerMod"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "AbilityPowerMod",
          Src1Value = 0,
          Src2Value = 1.0E-4,
          DestVar = "AbilityPowerBonus",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "DamagePerc",
          Src2Var = "AbilityPowerBonus",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "DamagePerc",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "DamagePerc",
          Src2Var = "Temp1",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "HToDamage",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "HToDamage",
          Src1Value = 0,
          Src2Value = 240,
          DestVar = "HToDamage",
          MathOp = MO_MIN
        }
      },
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          TargetVar = "Unit",
          Damage = 0,
          DamageVar = "HToDamage",
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELLAOE,
          PercentOfAttack = 1,
          SpellDamageRatio = 0,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "HToDamage",
          Src1Value = 0.05,
          Src2Value = 0,
          DestVar = "HToDamage",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "CurrentDamageTotal",
          Src1VarTable = "InstanceVars",
          Src2Var = "HToDamage",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "CurrentDamageTotal",
          DestVarTable = "InstanceVars",
          MathOp = MO_ADD
        }
      }
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "nassus_godofDeath_transform.troy",
      Flags = 0,
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false
    }
  },
  {
    Function = BBSetScaleSkinCoef,
    Params = {Scale = 1, OwnerVar = "Owner"}
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBSetScaleSkinCoef,
    Params = {Scale = 1.3, OwnerVar = "Owner"}
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatHPPoolMod,
      TargetVar = "Owner",
      DeltaVar = "BonusHealth",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DamageCap",
      SrcVar = "DamageCap",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DamagePerc",
      SrcVar = "DamagePerc",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 1,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBForEachUnitInTargetArea,
        Params = {
          AttackerVar = "Owner",
          CenterVar = "Owner",
          Range = 375,
          Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
          IteratorVar = "Unit"
        },
        SubBlocks = {
          {
            Function = BBGetManaOrHealth,
            Params = {
              DestVar = "Temp1",
              OwnerVar = "Unit",
              Function = GetMaxHealth
            }
          },
          {
            Function = BBGetStat,
            Params = {
              Stat = GetFlatMagicDamageMod,
              TargetVar = "Owner",
              DestVar = "AbilityPowerMod"
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "AbilityPowerMod",
              Src1Value = 0,
              Src2Value = 1.0E-4,
              DestVar = "AbilityPowerBonus",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "DamagePerc",
              Src2Var = "AbilityPowerBonus",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "DamagePerc",
              MathOp = MO_ADD
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "DamagePerc",
              Src2Var = "Temp1",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "HToDamage",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "HToDamage",
              Src1Value = 0,
              Src2Value = 240,
              DestVar = "HToDamage",
              MathOp = MO_MIN
            }
          },
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              TargetVar = "Unit",
              Damage = 0,
              DamageVar = "HToDamage",
              DamageType = MAGIC_DAMAGE,
              SourceDamageType = DAMAGESOURCE_SPELLAOE,
              PercentOfAttack = 1,
              SpellDamageRatio = 0,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          },
          {
            Function = BBMath,
            Params = {
              Src2Var = "HToDamage",
              Src1Value = 0.05,
              Src2Value = 0,
              DestVar = "HToDamage",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "CurrentDamageTotal",
              Src1VarTable = "InstanceVars",
              Src2Var = "HToDamage",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "CurrentDamageTotal",
              DestVarTable = "InstanceVars",
              MathOp = MO_ADD
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "CurrentDamageTotal",
          Src1VarTable = "InstanceVars",
          Src2Var = "DamageCap",
          CompareOp = CO_GREATER_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "CurrentDamageTotal",
              Src1VarTable = "InstanceVars",
              Src2Var = "DamageCap",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "CurrentDamageTotal",
              DestVarTable = "InstanceVars",
              MathOp = MO_MIN
            }
          }
        }
      }
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatPhysicalDamageMod,
      TargetVar = "Owner",
      DeltaVar = "CurrentDamageTotal",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DamageCap",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        300,
        300,
        300,
        0,
        0
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DamagePerc",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        0.03,
        0.04,
        0.05,
        0,
        0
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "CurrentDamageTotal",
      DestVarTable = "NextBuffVars",
      SrcValue = 0
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BonusHealth",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        300,
        450,
        600,
        0,
        0
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Attacker",
      BuffAddType = BUFF_RENEW_EXISTING,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 0,
      BuffVarsTable = "NextBuffVars",
      DurationByLevel = {
        15,
        15,
        15
      },
      TickRate = 0
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nassus_godofdeath_transform.troy"
    }
  }
}
