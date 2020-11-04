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
    Function = BBGetGameTime,
    Params = {
      SecondsVar = "NextAttackTime",
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
        Function = BBGetGameTime,
        Params = {
          SecondsVar = "CurrentTime"
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "FoundTarget",
          SrcValue = false
        }
      },
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
          Value2 = 1,
          CompareOp = CO_GREATER_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "CurrentTime",
              Src1Value = 0,
              Src2Value = 1,
              DestVar = "NextAttackTime",
              DestVarTable = "InstanceVars",
              MathOp = MO_ADD
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "NextAttackTime",
          Src1VarTable = "InstanceVars",
          Src2Var = "CurrentTime",
          CompareOp = CO_LESS_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBForEachUnitInTargetArea,
            Params = {
              AttackerVar = "Owner",
              CenterVar = "Owner",
              Range = 1500,
              Flags = "AffectEnemies AffectNeutral AffectMinions ",
              IteratorVar = "Unit",
              BuffNameFilter = "OdinGuardianBuff",
              InclusiveBuffFilter = true
            },
            SubBlocks = {
              {
                Function = BBIf,
                Params = {
                  Src1Var = "FoundTarget",
                  Value2 = false,
                  CompareOp = CO_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBIf,
                    Params = {
                      Src1Var = "Count",
                      Value2 = 0,
                      CompareOp = CO_LESS_THAN_OR_EQUAL
                    },
                    SubBlocks = {
                      {
                        Function = BBSpellCast,
                        Params = {
                          CasterVar = "Owner",
                          TargetVar = "Unit",
                          OverrideCastPosition = false,
                          SlotNumber = 0,
                          SlotType = SpellSlots,
                          OverrideForceLevel = 1,
                          OverrideForceLevelVar = "1",
                          OverrideCoolDownCheck = true,
                          FireWithoutCasting = false,
                          UseAutoAttackSpell = false,
                          ForceCastingOrChannelling = false,
                          UpdateAutoAttackTimer = false
                        }
                      },
                      {
                        Function = BBMath,
                        Params = {
                          Src1Var = "CurrentTime",
                          Src1Value = 0,
                          Src2Value = 1.25,
                          DestVar = "NextAttackTime",
                          DestVarTable = "InstanceVars",
                          MathOp = MO_ADD
                        }
                      },
                      {
                        Function = BBSetVarInTable,
                        Params = {
                          DestVar = "FoundTarget",
                          SrcValue = true
                        }
                      }
                    }
                  }
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
  }
}
