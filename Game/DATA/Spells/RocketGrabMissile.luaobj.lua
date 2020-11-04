NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
AutoCooldownByLevel = {
  22,
  20,
  18,
  16,
  14
}
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "ParticleID",
      RequiredVarTable = "NextBuffVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "WillRemove",
      RequiredVarTable = "NextBuffVars"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "ParticleID",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "WillRemove",
      Src1VarTable = "InstanceVars",
      Value2 = true,
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBExecutePeriodically,
        Params = {
          TimeBetweenExecutions = 0.1,
          TrackTimeVar = "LastTimeExecuted",
          TrackTimeVarTable = "InstanceVars",
          ExecuteImmediately = false
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "WillRemove",
              DestVarTable = "InstanceVars",
              SrcValue = true
            }
          }
        }
      }
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetStatus,
    Params = {
      TargetVar = "Target",
      DestVar = "IsStealthed",
      Status = GetStealthed
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "IsStealthed",
      Value2 = false,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBDistanceBetweenObjects,
        Params = {
          DestVar = "Distance",
          ObjectVar1 = "Target",
          ObjectVar2 = "Attacker"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "Distance",
          Src1Value = 0,
          Src2Value = 1350,
          DestVar = "Time",
          MathOp = MO_DIVIDE
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "WillRemove",
          DestVarTable = "NextBuffVars",
          SrcValue = false
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Target",
          EffectName = "FistReturn_mis.troy",
          Flags = 0,
          EffectIDVar = "ParticleID",
          BoneName = "head",
          TargetObjectVar = "Owner",
          TargetBoneName = "R_hand",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = false
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "ParticleID",
          DestVarTable = "NextBuffVars",
          SrcVar = "ParticleID"
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Attacker",
          AttackerVar = "Target",
          BuffAddType = BUFF_REPLACE_EXISTING,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 0,
          BuffVarsTable = "NextBuffVars",
          DurationVar = "Time",
          TickRate = 0
        }
      },
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          TargetVar = "Target",
          DamageByLevel = {
            60,
            120,
            180,
            240,
            300
          },
          Damage = 0,
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELL,
          PercentOfAttack = 1,
          SpellDamageRatio = 0.8,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      },
      {
        Function = BBApplyStun,
        Params = {
          AttackerVar = "Attacker",
          TargetVar = "Target",
          Duration = 0.6
        }
      },
      {
        Function = BBDestroyMissile,
        Params = {
          MissileIDVar = "MissileNetworkID"
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Attacker",
          BuffName = "RocketGrab2",
          BuffAddType = BUFF_REPLACE_EXISTING,
          BuffType = BUFF_Stun,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 0.6,
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
        Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_HERO},
        SubBlocks = {
          {
            Function = BBDistanceBetweenObjects,
            Params = {
              DestVar = "Distance",
              ObjectVar1 = "Target",
              ObjectVar2 = "Attacker"
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "Distance",
              Src1Value = 0,
              Src2Value = 1350,
              DestVar = "Time",
              MathOp = MO_DIVIDE
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "WillRemove",
              DestVarTable = "NextBuffVars",
              SrcValue = false
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Target",
              EffectName = "FistReturn_mis.troy",
              Flags = 0,
              EffectIDVar = "ParticleID",
              BoneName = "head",
              TargetObjectVar = "Owner",
              TargetBoneName = "R_hand",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWVisibilityRadius = 0,
              SendIfOnScreenOrDiscard = false
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "ParticleID",
              DestVarTable = "NextBuffVars",
              SrcVar = "ParticleID"
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Attacker",
              AttackerVar = "Target",
              BuffAddType = BUFF_REPLACE_EXISTING,
              BuffType = BUFF_Internal,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 0,
              BuffVarsTable = "NextBuffVars",
              DurationVar = "Time",
              TickRate = 0
            }
          },
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              TargetVar = "Target",
              DamageByLevel = {
                60,
                120,
                180,
                240,
                300
              },
              Damage = 0,
              DamageType = MAGIC_DAMAGE,
              SourceDamageType = DAMAGESOURCE_SPELL,
              PercentOfAttack = 1,
              SpellDamageRatio = 1,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          },
          {
            Function = BBApplyStun,
            Params = {
              AttackerVar = "Attacker",
              TargetVar = "Target",
              Duration = 0.6
            }
          },
          {
            Function = BBDestroyMissile,
            Params = {
              MissileIDVar = "MissileNetworkID"
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Target",
              AttackerVar = "Attacker",
              BuffName = "RocketGrab2",
              BuffAddType = BUFF_REPLACE_EXISTING,
              BuffType = BUFF_Stun,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 0.6,
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
            Function = BBCanSeeTarget,
            Params = {
              ViewerVar = "Owner",
              TargetVar = "Target",
              ResultVar = "CanSee"
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "CanSee",
              Value2 = true,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBDistanceBetweenObjects,
                Params = {
                  DestVar = "Distance",
                  ObjectVar1 = "Target",
                  ObjectVar2 = "Attacker"
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "Distance",
                  Src1Value = 0,
                  Src2Value = 1350,
                  DestVar = "Time",
                  MathOp = MO_DIVIDE
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "WillRemove",
                  DestVarTable = "NextBuffVars",
                  SrcValue = false
                }
              },
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Target",
                  EffectName = "FistReturn_mis.troy",
                  Flags = 0,
                  EffectIDVar = "ParticleID",
                  BoneName = "head",
                  TargetObjectVar = "Owner",
                  TargetBoneName = "R_hand",
                  SpecificUnitOnlyVar = "Owner",
                  SpecificTeamOnly = TEAM_UNKNOWN,
                  UseSpecificUnit = false,
                  FOWTeam = TEAM_UNKNOWN,
                  FOWVisibilityRadius = 0,
                  SendIfOnScreenOrDiscard = false
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "ParticleID",
                  DestVarTable = "NextBuffVars",
                  SrcVar = "ParticleID"
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Attacker",
                  AttackerVar = "Target",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  BuffType = BUFF_Internal,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 0,
                  BuffVarsTable = "NextBuffVars",
                  DurationVar = "Time",
                  TickRate = 0
                }
              },
              {
                Function = BBApplyDamage,
                Params = {
                  AttackerVar = "Attacker",
                  TargetVar = "Target",
                  DamageByLevel = {
                    60,
                    120,
                    180,
                    240,
                    300
                  },
                  Damage = 0,
                  DamageType = MAGIC_DAMAGE,
                  SourceDamageType = DAMAGESOURCE_SPELL,
                  PercentOfAttack = 1,
                  SpellDamageRatio = 1,
                  IgnoreDamageIncreaseMods = false,
                  IgnoreDamageCrit = false
                }
              },
              {
                Function = BBApplyStun,
                Params = {
                  AttackerVar = "Attacker",
                  TargetVar = "Target",
                  Duration = 0.6
                }
              },
              {
                Function = BBDestroyMissile,
                Params = {
                  MissileIDVar = "MissileNetworkID"
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Target",
                  AttackerVar = "Attacker",
                  BuffName = "RocketGrab2",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  BuffType = BUFF_Stun,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 0.6,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0
                }
              }
            }
          }
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "fistreturn_mis.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rocketgrab2"
    }
  }
}
