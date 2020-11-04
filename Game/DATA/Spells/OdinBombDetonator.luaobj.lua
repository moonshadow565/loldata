NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Minotaur_FerociousHowl.dds"
BuffName = "Ferocious Howl"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = "pelvis"
AutoCooldownByLevel = {
  120,
  100,
  80,
  10,
  10
}
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "TimePassed",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  },
  {
    Function = BBGetGameTime,
    Params = {
      SecondsVar = "PreviousGameTime",
      SecondsVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 0.25,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBGetBuffCountFromAll,
        Params = {
          DestVar = "Count",
          TargetVar = "Owner",
          BuffName = "OdinGuardianSuppression"
        }
      },
      {
        Function = BBGetGameTime,
        Params = {
          SecondsVar = "CurrentGameTime"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Count",
          Value2 = 0,
          CompareOp = CO_LESS_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "CurrentGameTime",
              Src2Var = "PreviousGameTime",
              Src2VarTable = "InstanceVars",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "CurrentTimePassed",
              MathOp = MO_SUBTRACT
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "TimePassed",
              Src1VarTable = "InstanceVars",
              Src2Var = "CurrentTimePassed",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "TimePassed",
              DestVarTable = "InstanceVars",
              MathOp = MO_ADD
            }
          }
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "PreviousGameTime",
          DestVarTable = "InstanceVars",
          SrcVar = "CurrentGameTime"
        }
      }
    }
  },
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 1,
      TrackTimeVar = "LastTimeExecuted2",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = true
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src2Var = "TimePassed",
          Src2VarTable = "InstanceVars",
          Src1Value = 10,
          Src2Value = 0,
          DestVar = "TimeRemaining",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "TimeRemaining",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "ToPrint",
          MathOp = MO_ROUND
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "TimeRemaining",
          Value2 = 0,
          CompareOp = CO_LESS_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSay,
            Params = {OwnerVar = "Owner", ToSay = "KaBoom"}
          },
          {
            Function = BBForEachUnitInTargetArea,
            Params = {
              AttackerVar = "Owner",
              CenterVar = "Owner",
              Range = 1500,
              Flags = "AffectEnemies AffectFriends AffectNeutral AffectMinions ",
              IteratorVar = "Unit",
              BuffNameFilter = "OdinGuardianBuff",
              InclusiveBuffFilter = true
            },
            SubBlocks = {
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Attacker",
                  BuffName = "OdinBombDetonation",
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
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Attacker",
              BuffName = "OdinBombDetonation",
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
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Owner",
              EffectName = "CrashBoom.troy",
              Flags = 0,
              BoneName = "root",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWVisibilityRadius = 0,
              SendIfOnScreenOrDiscard = false,
              FollowsGroundTilt = false
            }
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBGetBuffCountFromAll,
            Params = {
              DestVar = "Count",
              TargetVar = "Owner",
              BuffName = "OdinGuardianSuppression"
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "Count",
              Value2 = 0,
              CompareOp = CO_GREATER_THAN
            },
            SubBlocks = {
              {
                Function = BBSay,
                Params = {
                  OwnerVar = "Owner",
                  ToSay = "Defusing - ",
                  SrcVar = "ToPrint"
                }
              }
            }
          },
          {
            Function = BBElse,
            Params = {},
            SubBlocks = {
              {
                Function = BBSay,
                Params = {
                  OwnerVar = "Owner",
                  ToSay = "  ",
                  SrcVar = "ToPrint"
                }
              }
            }
          }
        }
      }
    }
  }
}
BuffOnBeingHitBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Attacker", CompareOp = CO_IS_NOT_HERO},
    SubBlocks = {
      {
        Function = BBGetPAROrHealth,
        Params = {
          DestVar = "MyMaxHealth",
          OwnerVar = "Owner",
          Function = GetMaxHealth,
          PARType = PAR_MANA
        }
      },
      {
        Function = BBGetTeamID,
        Params = {TargetVar = "Owner", DestVar = "MyTeamID"}
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "MyTeamID",
          Value2 = TEAM_NEUTRAL,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src2Var = "MyMaxHealth",
              Src1Value = 0.015,
              Src2Value = 0,
              DestVar = "HealthToDecreaseBy",
              MathOp = MO_MULTIPLY
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
              Src2Var = "MyMaxHealth",
              Src1Value = 0.02,
              Src2Value = 0,
              DestVar = "HealthToDecreaseBy",
              MathOp = MO_MULTIPLY
            }
          }
        }
      },
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          CallForHelpAttackerVar = "Owner",
          TargetVar = "Owner",
          Damage = 0,
          DamageVar = "HealthToDecreaseBy",
          DamageType = TRUE_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELL,
          PercentOfAttack = 1,
          SpellDamageRatio = 0,
          PhysicalDamageRatio = 0,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {Src1Var = "Attacker", CompareOp = CO_IS_NOT_HERO},
    SubBlocks = {
      {
        Function = BBGetTeamID,
        Params = {TargetVar = "Owner", DestVar = "MyTeamID"}
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "MyTeamID",
          Value2 = TEAM_NEUTRAL,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBGetPAROrHealth,
            Params = {
              DestVar = "HealthPercent",
              OwnerVar = "Owner",
              Function = GetHealthPercent,
              PARType = PAR_MANA
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "HealthPercent",
              Value2 = 0.99,
              CompareOp = CO_GREATER_THAN
            },
            SubBlocks = {
              {
                Function = BBApplyDamage,
                Params = {
                  AttackerVar = "Attacker",
                  CallForHelpAttackerVar = "Attacker",
                  TargetVar = "Owner",
                  Damage = 10000000,
                  DamageType = TRUE_DAMAGE,
                  SourceDamageType = DAMAGESOURCE_INTERNALRAW,
                  PercentOfAttack = 1,
                  SpellDamageRatio = 0,
                  PhysicalDamageRatio = 0,
                  IgnoreDamageIncreaseMods = false,
                  IgnoreDamageCrit = false
                }
              }
            }
          },
          {
            Function = BBGetPAROrHealth,
            Params = {
              DestVar = "AttackerMaxHealth",
              OwnerVar = "Attacker",
              Function = GetMaxHealth,
              PARType = PAR_MANA
            }
          },
          {
            Function = BBMath,
            Params = {
              Src2Var = "AttackerMaxHealth",
              Src1Value = 0.151,
              Src2Value = 0,
              DestVar = "DamageReturn",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Owner",
              CallForHelpAttackerVar = "Owner",
              TargetVar = "Attacker",
              Damage = 0,
              DamageVar = "DamageReturn",
              DamageType = TRUE_DAMAGE,
              SourceDamageType = DAMAGESOURCE_RAW,
              PercentOfAttack = 1,
              SpellDamageRatio = 0,
              PhysicalDamageRatio = 0,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          }
        }
      }
    }
  }
}
BuffOnPreDamageBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src1Var = "DamageAmount",
      Src1Value = 0,
      Src2Value = 0.75,
      DestVar = "DamageAmount",
      MathOp = MO_MULTIPLY
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinguardiansuppression"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinguardianbuff"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "crashboom.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  }
}
