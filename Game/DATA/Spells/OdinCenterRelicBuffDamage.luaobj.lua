BuffTextureName = "StormShield.dds"
BuffName = "OdinCenterRelicDamage"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetLevel,
    Params = {TargetVar = "Owner", DestVar = "Level"}
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Level",
      Src1Value = 0,
      Src2Value = 13,
      DestVar = "BonusDamage",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BonusDamage",
      Src1Value = 0,
      Src2Value = 36,
      DestVar = "TotalDamage",
      DestVarTable = "InstanceVars",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "TotalDamage",
      ValueVarTable = "InstanceVars",
      Index = 1
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "odin_relic_buf_light_blue.troy",
      Flags = 0,
      EffectIDVar = "buffParticle",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false,
      PersistsThroughReconnect = false,
      BindFlexToOwnerPAR = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "PrevSpellTrigger",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  },
  {
    Function = BBIncScaleSkinCoef,
    Params = {Scale = 0.3, OwnerVar = "Owner"}
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "buffParticle",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncScaleSkinCoef,
    Params = {Scale = 0.3, OwnerVar = "Owner"}
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 4,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = true
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Owner", CompareOp = CO_IS_DEAD},
        SubBlocks = {
          {
            Function = BBSpellBuffRemoveCurrent,
            Params = {TargetVar = "Owner"}
          }
        }
      }
    }
  }
}
BuffOnDealDamageBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBGetGameTime,
    Params = {
      SecondsVar = "CurrentTime"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "CurrentTime",
      Src2Var = "PrevSpellTrigger",
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "TimeDiff",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Owner",
      Src2Var = "Target",
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "TimeDiff",
          Value2 = 4,
          CompareOp = CO_GREATER_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {Src1Var = "Target", CompareOp = CO_IS_NOT_TURRET},
            SubBlocks = {
              {
                Function = BBIf,
                Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
                SubBlocks = {
                  {
                    Function = BBIf,
                    Params = {Value1 = DAMAGESOURCE_PERIODIC, CompareOp = CO_DAMAGE_SOURCETYPE_IS_NOT},
                    SubBlocks = {
                      {
                        Function = BBIf,
                        Params = {Value1 = DAMAGESOURCE_PROC, CompareOp = CO_DAMAGE_SOURCETYPE_IS_NOT},
                        SubBlocks = {
                          {
                            Function = BBIf,
                            Params = {Value1 = DAMAGESOURCE_DEFAULT, CompareOp = CO_DAMAGE_SOURCETYPE_IS_NOT},
                            SubBlocks = {
                              {
                                Function = BBDistanceBetweenObjects,
                                Params = {
                                  DestVar = "Distance",
                                  ObjectVar1 = "Owner",
                                  ObjectVar2 = "Target"
                                }
                              },
                              {
                                Function = BBIf,
                                Params = {
                                  Src1Var = "Distance",
                                  Value2 = 1600,
                                  CompareOp = CO_LESS_THAN_OR_EQUAL
                                },
                                SubBlocks = {
                                  {
                                    Function = BBSpellEffectCreate,
                                    Params = {
                                      BindObjectVar = "Attacker",
                                      EffectName = "Odin_CenterbuffBeam.troy",
                                      Flags = 0,
                                      EffectIDVar = "ParticleID",
                                      EffectIDVarTable = "InstanceVars",
                                      BoneName = "head",
                                      TargetObjectVar = "Target",
                                      TargetBoneName = "root",
                                      SpecificUnitOnlyVar = "Target",
                                      SpecificTeamOnly = TEAM_UNKNOWN,
                                      UseSpecificUnit = false,
                                      FOWTeam = TEAM_UNKNOWN,
                                      FOWTeamOverrideVar = "TeamID",
                                      FOWVisibilityRadius = 10,
                                      SendIfOnScreenOrDiscard = true,
                                      PersistsThroughReconnect = false,
                                      BindFlexToOwnerPAR = false,
                                      FollowsGroundTilt = false,
                                      FacesTarget = false
                                    }
                                  },
                                  {
                                    Function = BBSetVarInTable,
                                    Params = {
                                      DestVar = "PrevSpellTrigger",
                                      DestVarTable = "InstanceVars",
                                      SrcVar = "CurrentTime"
                                    }
                                  },
                                  {
                                    Function = BBApplyDamage,
                                    Params = {
                                      AttackerVar = "Owner",
                                      CallForHelpAttackerVar = "Attacker",
                                      TargetVar = "Target",
                                      Damage = 0,
                                      DamageVar = "TotalDamage",
                                      DamageVarTable = "InstanceVars",
                                      DamageType = MAGIC_DAMAGE,
                                      SourceDamageType = DAMAGESOURCE_PROC,
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
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "odin_relic_buf_light_blue.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "odin_centerbuffbeam.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  }
}
