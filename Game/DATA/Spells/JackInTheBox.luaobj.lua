NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "Jester_DeathWard.dds"
BuffName = "Jack In The Box"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBPushCharacterFade,
    Params = {
      TargetVar = "Owner",
      FadeAmount = 0.2,
      fadeTime = 2,
      IDVar = "ID",
      IDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "FearDuration",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Activated",
      DestVarTable = "InstanceVars",
      SrcValue = false
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetCanAttack
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      PosVar = "TargetPos",
      EffectName = "jackintheboxpoof.troy",
      Flags = 0,
      EffectIDVar = "poofin",
      TargetObjectVar = "Target",
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
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Owner",
      TargetVar = "Owner",
      Damage = 1000,
      DamageType = TRUE_DAMAGE,
      SourceDamageType = DAMAGESOURCE_INTERNALRAW,
      PercentOfAttack = 1,
      SpellDamageRatio = 1,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "Activated",
      Src1VarTable = "InstanceVars",
      Value2 = false,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "LifeTime",
          Value2 = 2,
          CompareOp = CO_GREATER_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetStatus,
            Params = {
              TargetVar = "Owner",
              SrcValue = true,
              Status = SetCanAttack
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "Activated",
              DestVarTable = "InstanceVars",
              SrcValue = true
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "Stealth",
              BuffAddType = BUFF_REPLACE_EXISTING,
              BuffType = BUFF_Internal,
              MaxStack = 1,
              NumberStacks = 1,
              Duration = 60,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0
            }
          }
        }
      }
    }
  },
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 0.5,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "Activated",
          Src1VarTable = "InstanceVars",
          Value2 = true,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBIfNotHasBuff,
            Params = {
              OwnerVar = "Owner",
              CasterVar = "Owner",
              BuffName = "EndKill"
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {DestVar = "unitFound", SrcValue = 0}
              },
              {
                Function = BBForNClosestUnitsInTargetArea,
                Params = {
                  AttackerVar = "Attacker",
                  CenterVar = "Owner",
                  Range = 445,
                  Flags = "AffectEnemies AffectHeroes ",
                  IteratorVar = "Unit",
                  MaximumUnitsToPick = 1
                },
                SubBlocks = {
                  {
                    Function = BBApplyTaunt,
                    Params = {
                      AttackerVar = "Unit",
                      TargetVar = "Owner",
                      Duration = 1
                    }
                  },
                  {
                    Function = BBSetVarInTable,
                    Params = {DestVar = "unitFound", SrcValue = 0}
                  },
                  {
                    Function = BBSpellBuffRemove,
                    Params = {
                      TargetVar = "Owner",
                      AttackerVar = "Owner",
                      BuffName = "Stealth"
                    }
                  }
                }
              },
              {
                Function = BBIf,
                Params = {
                  Src1Var = "unitFound",
                  Value2 = 0,
                  CompareOp = CO_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBForNClosestUnitsInTargetArea,
                    Params = {
                      AttackerVar = "Attacker",
                      CenterVar = "Owner",
                      Range = 445,
                      Flags = "AffectEnemies AffectNeutral AffectBuildings AffectMinions AffectTurrets ",
                      IteratorVar = "Unit",
                      MaximumUnitsToPick = 1
                    },
                    SubBlocks = {
                      {
                        Function = BBApplyTaunt,
                        Params = {
                          AttackerVar = "Unit",
                          TargetVar = "Owner",
                          Duration = 1
                        }
                      },
                      {
                        Function = BBSpellBuffRemove,
                        Params = {
                          TargetVar = "Owner",
                          AttackerVar = "Owner",
                          BuffName = "Stealth"
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
BuffOnPreAttackBuildingBlocks = {
  {
    Function = BBIfNotHasBuff,
    Params = {
      OwnerVar = "Owner",
      CasterVar = "Owner",
      BuffName = "EndKill"
    },
    SubBlocks = {
      {
        Function = BBPushCharacterFade,
        Params = {
          TargetVar = "Owner",
          FadeAmount = 1,
          fadeTime = 0.5,
          IDVar = "ID",
          IDVarTable = "InstanceVars"
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "EndKill",
          BuffAddType = BUFF_RENEW_EXISTING,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberStacks = 1,
          Duration = 5,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      },
      {
        Function = BBForEachUnitInTargetArea,
        Params = {
          AttackerVar = "Attacker",
          CenterVar = "Owner",
          Range = 450,
          Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
          IteratorVar = "Unit"
        },
        SubBlocks = {
          {
            Function = BBBreakSpellShields,
            Params = {TargetVar = "Unit"}
          },
          {
            Function = BBApplyFear,
            Params = {
              AttackerVar = "Attacker",
              TargetVar = "Unit",
              Duration = 0,
              DurationVar = "FearDuration",
              DurationVarTable = "InstanceVars"
            }
          }
        }
      }
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBGetCastSpellTargetPos,
    Params = {DestVar = "TargetPos"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "TargetPos",
      DestVarTable = "NextBuffVars",
      SrcVar = "TargetPos"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BonusHealth",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        0,
        100,
        200,
        300,
        400
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "FearDuration",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        0.5,
        0.75,
        1,
        1.25,
        1.5
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Attacker",
      BuffName = "JackInTheBoxInternal",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 0.1,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "jackintheboxpoof.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "stealth"}
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "endkill"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jackintheboxinternal"
    }
  }
}
