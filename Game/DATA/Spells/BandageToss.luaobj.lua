NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
AutoCooldownByLevel = {
  18,
  16,
  14,
  12,
  10
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
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Bandage_beam.troy",
      Flags = 0,
      EffectIDVar = "ParticleID",
      EffectIDVarTable = "InstanceVars",
      BoneName = "spine",
      TargetObjectVar = "Attacker",
      TargetBoneName = "R_hand",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBStopCurrentOverrideAnimation,
    Params = {AnimationName = "Spell2", TargetVar = "Attacker"}
  },
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
            Function = BBPlayAnimation,
            Params = {
              AnimationName = "Spell2",
              ScaleTime = 0,
              TargetVar = "Attacker",
              Loop = false
            }
          },
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
CanCastBuildingBlocks = {
  {
    Function = BBGetStatus,
    Params = {
      TargetVar = "Owner",
      DestVar = "CanMove",
      Status = GetCanMove
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "CanMove",
      Value2 = false,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetReturnValue,
        Params = {SrcValue = false}
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSetReturnValue,
        Params = {SrcValue = true}
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
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Attacker",
          BuffName = "BandageToss",
          BuffAddType = BUFF_REPLACE_EXISTING,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberStacks = 1,
          Duration = 0,
          BuffVarsTable = "NextBuffVars",
          DurationVar = "Time",
          TickRate = 0
        }
      },
      {
        Function = BBMove,
        Params = {
          UnitVar = "Attacker",
          TargetVar = "Target",
          Speed = 1350,
          Gravity = 5,
          MoveBackBy = 80
        }
      },
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          TargetVar = "Target",
          DamageByLevel = {
            75,
            140,
            205,
            275,
            350
          },
          Damage = 0,
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELL,
          PercentOfAttack = 1,
          SpellDamageRatio = 1
        }
      },
      {
        Function = BBApplyStun,
        Params = {
          AttackerVar = "Attacker",
          TargetVar = "Target",
          Duration = 1
        }
      },
      {
        Function = BBDestroyMissile,
        Params = {
          MissileIDVar = "MissileNetworkID"
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
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Target",
              AttackerVar = "Attacker",
              BuffName = "BandageToss",
              BuffAddType = BUFF_REPLACE_EXISTING,
              BuffType = BUFF_Internal,
              MaxStack = 1,
              NumberStacks = 1,
              Duration = 0,
              BuffVarsTable = "NextBuffVars",
              DurationVar = "Time",
              TickRate = 0
            }
          },
          {
            Function = BBMove,
            Params = {
              UnitVar = "Attacker",
              TargetVar = "Target",
              Speed = 1350,
              Gravity = 5,
              MoveBackBy = 80
            }
          },
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              TargetVar = "Target",
              DamageByLevel = {
                75,
                140,
                205,
                275,
                350
              },
              Damage = 0,
              DamageType = MAGIC_DAMAGE,
              SourceDamageType = DAMAGESOURCE_SPELL,
              PercentOfAttack = 1,
              SpellDamageRatio = 1
            }
          },
          {
            Function = BBApplyStun,
            Params = {
              AttackerVar = "Attacker",
              TargetVar = "Target",
              Duration = 1
            }
          },
          {
            Function = BBDestroyMissile,
            Params = {
              MissileIDVar = "MissileNetworkID"
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
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Target",
                  AttackerVar = "Attacker",
                  BuffName = "BandageToss",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  BuffType = BUFF_Internal,
                  MaxStack = 1,
                  NumberStacks = 1,
                  Duration = 0,
                  BuffVarsTable = "NextBuffVars",
                  DurationVar = "Time",
                  TickRate = 0
                }
              },
              {
                Function = BBMove,
                Params = {
                  UnitVar = "Attacker",
                  TargetVar = "Target",
                  Speed = 1350,
                  Gravity = 5,
                  MoveBackBy = 80
                }
              },
              {
                Function = BBApplyDamage,
                Params = {
                  AttackerVar = "Attacker",
                  TargetVar = "Target",
                  DamageByLevel = {
                    80,
                    140,
                    200,
                    260,
                    320
                  },
                  Damage = 0,
                  DamageType = MAGIC_DAMAGE,
                  SourceDamageType = DAMAGESOURCE_SPELL,
                  PercentOfAttack = 1,
                  SpellDamageRatio = 1
                }
              },
              {
                Function = BBApplyStun,
                Params = {
                  AttackerVar = "Attacker",
                  TargetVar = "Target",
                  Duration = 1
                }
              },
              {
                Function = BBDestroyMissile,
                Params = {
                  MissileIDVar = "MissileNetworkID"
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
      Name = "bandage_beam.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "bandagetoss"
    }
  }
}
