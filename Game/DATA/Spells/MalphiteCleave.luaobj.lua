DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Malphite_BrutalStrikes.dds"
BuffName = "MalphiteCleave"
PersistsThroughDeath = true
NonDispellable = true
BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_NOT_TURRET},
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
          DestVar = "CleavePerc",
          SrcValueByLevel = {
            0.3,
            0.38,
            0.46,
            0.54,
            0.62
          }
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "DamageAmount",
          Src2Var = "CleavePerc",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "DamageAmount2",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Attacker",
          AttackerVar = "Attacker",
          BuffName = "ObduracyBuff"
        },
        SubBlocks = {
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Target",
              EffectName = "MalphiteCleaveEnragedHit.troy",
              Flags = 0,
              EffectIDVar = "a",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWVisibilityRadius = 0,
              SendIfOnScreenOrDiscard = true,
              PersistsThroughReconnect = false,
              BindFlexToOwnerPAR = false,
              FollowsGroundTilt = false,
              FacesTarget = false
            }
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Target",
              EffectName = "MalphiteCleaveHit.troy",
              Flags = 0,
              EffectIDVar = "a",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWVisibilityRadius = 0,
              SendIfOnScreenOrDiscard = true,
              PersistsThroughReconnect = false,
              BindFlexToOwnerPAR = false,
              FollowsGroundTilt = false,
              FacesTarget = false
            }
          }
        }
      },
      {
        Function = BBForEachUnitInTargetArea,
        Params = {
          AttackerVar = "Owner",
          CenterVar = "Target",
          Range = 325,
          Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
          IteratorVar = "Unit",
          InclusiveBuffFilter = true
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "Unit",
              Src2Var = "Target",
              CompareOp = CO_NOT_EQUAL
            },
            SubBlocks = {
              {
                Function = BBDistanceBetweenObjects,
                Params = {
                  DestVar = "Distance",
                  ObjectVar1 = "Attacker",
                  ObjectVar2 = "Unit"
                }
              },
              {
                Function = BBIf,
                Params = {
                  Src1Var = "Distance",
                  Value2 = 200,
                  CompareOp = CO_LESS_THAN
                },
                SubBlocks = {
                  {
                    Function = BBIf,
                    Params = {
                      Src1Var = "Owner",
                      Src2Var = "Unit",
                      CompareOp = CO_IS_TARGET_IN_FRONT_OF_ME
                    },
                    SubBlocks = {
                      {
                        Function = BBIf,
                        Params = {
                          Src1Var = "DamageType",
                          Value2 = MAGIC_DAMAGE,
                          CompareOp = CO_EQUAL
                        },
                        SubBlocks = {
                          {
                            Function = BBApplyDamage,
                            Params = {
                              AttackerVar = "Attacker",
                              CallForHelpAttackerVar = "Attacker",
                              TargetVar = "Unit",
                              Damage = 0,
                              DamageVar = "DamageAmount2",
                              DamageType = MAGIC_DAMAGE,
                              SourceDamageType = DAMAGESOURCE_PROC,
                              PercentOfAttack = 1,
                              SpellDamageRatio = 0,
                              PhysicalDamageRatio = 1,
                              IgnoreDamageIncreaseMods = false,
                              IgnoreDamageCrit = false
                            }
                          },
                          {
                            Function = BBSpellEffectCreate,
                            Params = {
                              BindObjectVar = "Unit",
                              EffectName = "globalhit_physical.troy",
                              Flags = 0,
                              EffectIDVar = "a",
                              TargetObjectVar = "Unit",
                              SpecificUnitOnlyVar = "Owner",
                              SpecificTeamOnly = TEAM_UNKNOWN,
                              UseSpecificUnit = false,
                              FOWTeam = TEAM_UNKNOWN,
                              FOWVisibilityRadius = 0,
                              SendIfOnScreenOrDiscard = true,
                              PersistsThroughReconnect = false,
                              BindFlexToOwnerPAR = false,
                              FollowsGroundTilt = false,
                              FacesTarget = false
                            }
                          },
                          {
                            Function = BBIfHasBuff,
                            Params = {
                              OwnerVar = "Attacker",
                              AttackerVar = "Attacker",
                              BuffName = "ObduracyBuff"
                            },
                            SubBlocks = {
                              {
                                Function = BBSpellEffectCreate,
                                Params = {
                                  BindObjectVar = "Unit",
                                  EffectName = "MalphiteCleaveEnragedHit.troy",
                                  Flags = 0,
                                  EffectIDVar = "a",
                                  TargetObjectVar = "Unit",
                                  SpecificUnitOnlyVar = "Owner",
                                  SpecificTeamOnly = TEAM_UNKNOWN,
                                  UseSpecificUnit = false,
                                  FOWTeam = TEAM_UNKNOWN,
                                  FOWVisibilityRadius = 0,
                                  SendIfOnScreenOrDiscard = true,
                                  PersistsThroughReconnect = false,
                                  BindFlexToOwnerPAR = false,
                                  FollowsGroundTilt = false,
                                  FacesTarget = false
                                }
                              }
                            }
                          },
                          {
                            Function = BBElse,
                            Params = {},
                            SubBlocks = {
                              {
                                Function = BBSpellEffectCreate,
                                Params = {
                                  BindObjectVar = "Unit",
                                  EffectName = "MalphiteCleaveHit.troy",
                                  Flags = 0,
                                  EffectIDVar = "a",
                                  TargetObjectVar = "Unit",
                                  SpecificUnitOnlyVar = "Owner",
                                  SpecificTeamOnly = TEAM_UNKNOWN,
                                  UseSpecificUnit = false,
                                  FOWTeam = TEAM_UNKNOWN,
                                  FOWVisibilityRadius = 0,
                                  SendIfOnScreenOrDiscard = true,
                                  PersistsThroughReconnect = false,
                                  BindFlexToOwnerPAR = false,
                                  FollowsGroundTilt = false,
                                  FacesTarget = false
                                }
                              }
                            }
                          }
                        }
                      },
                      {
                        Function = BBElseIf,
                        Params = {
                          Src1Var = "DamageType",
                          Value2 = PHYSICAL_DAMAGE,
                          CompareOp = CO_EQUAL
                        },
                        SubBlocks = {
                          {
                            Function = BBApplyDamage,
                            Params = {
                              AttackerVar = "Attacker",
                              CallForHelpAttackerVar = "Attacker",
                              TargetVar = "Unit",
                              Damage = 0,
                              DamageVar = "DamageAmount2",
                              DamageType = PHYSICAL_DAMAGE,
                              SourceDamageType = DAMAGESOURCE_PROC,
                              PercentOfAttack = 1,
                              SpellDamageRatio = 0,
                              PhysicalDamageRatio = 0,
                              IgnoreDamageIncreaseMods = false,
                              IgnoreDamageCrit = false
                            }
                          },
                          {
                            Function = BBSpellEffectCreate,
                            Params = {
                              BindObjectVar = "Unit",
                              EffectName = "globalhit_physical.troy",
                              Flags = 0,
                              EffectIDVar = "a",
                              TargetObjectVar = "Unit",
                              SpecificUnitOnlyVar = "Owner",
                              SpecificTeamOnly = TEAM_UNKNOWN,
                              UseSpecificUnit = false,
                              FOWTeam = TEAM_UNKNOWN,
                              FOWVisibilityRadius = 0,
                              SendIfOnScreenOrDiscard = true,
                              PersistsThroughReconnect = false,
                              BindFlexToOwnerPAR = false,
                              FollowsGroundTilt = false,
                              FacesTarget = false
                            }
                          },
                          {
                            Function = BBIfHasBuff,
                            Params = {
                              OwnerVar = "Attacker",
                              AttackerVar = "Attacker",
                              BuffName = "ObduracyBuff"
                            },
                            SubBlocks = {
                              {
                                Function = BBSpellEffectCreate,
                                Params = {
                                  BindObjectVar = "Unit",
                                  EffectName = "MalphiteCleaveEnragedHit.troy",
                                  Flags = 0,
                                  EffectIDVar = "a",
                                  TargetObjectVar = "Unit",
                                  SpecificUnitOnlyVar = "Owner",
                                  SpecificTeamOnly = TEAM_UNKNOWN,
                                  UseSpecificUnit = false,
                                  FOWTeam = TEAM_UNKNOWN,
                                  FOWVisibilityRadius = 0,
                                  SendIfOnScreenOrDiscard = true,
                                  PersistsThroughReconnect = false,
                                  BindFlexToOwnerPAR = false,
                                  FollowsGroundTilt = false,
                                  FacesTarget = false
                                }
                              }
                            }
                          },
                          {
                            Function = BBElse,
                            Params = {},
                            SubBlocks = {
                              {
                                Function = BBSpellEffectCreate,
                                Params = {
                                  BindObjectVar = "Unit",
                                  EffectName = "MalphiteCleaveHit.troy",
                                  Flags = 0,
                                  EffectIDVar = "a",
                                  TargetObjectVar = "Unit",
                                  SpecificUnitOnlyVar = "Owner",
                                  SpecificTeamOnly = TEAM_UNKNOWN,
                                  UseSpecificUnit = false,
                                  FOWTeam = TEAM_UNKNOWN,
                                  FOWVisibilityRadius = 0,
                                  SendIfOnScreenOrDiscard = true,
                                  PersistsThroughReconnect = false,
                                  BindFlexToOwnerPAR = false,
                                  FollowsGroundTilt = false,
                                  FacesTarget = false
                                }
                              }
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
                              CallForHelpAttackerVar = "Attacker",
                              TargetVar = "Unit",
                              Damage = 0,
                              DamageVar = "DamageAmount2",
                              DamageType = TRUE_DAMAGE,
                              SourceDamageType = DAMAGESOURCE_PROC,
                              PercentOfAttack = 1,
                              SpellDamageRatio = 0,
                              PhysicalDamageRatio = 1,
                              IgnoreDamageIncreaseMods = false,
                              IgnoreDamageCrit = false
                            }
                          },
                          {
                            Function = BBSpellEffectCreate,
                            Params = {
                              BindObjectVar = "Unit",
                              EffectName = "globalhit_physical.troy",
                              Flags = 0,
                              EffectIDVar = "a",
                              TargetObjectVar = "Unit",
                              SpecificUnitOnlyVar = "Owner",
                              SpecificTeamOnly = TEAM_UNKNOWN,
                              UseSpecificUnit = false,
                              FOWTeam = TEAM_UNKNOWN,
                              FOWVisibilityRadius = 0,
                              SendIfOnScreenOrDiscard = true,
                              PersistsThroughReconnect = false,
                              BindFlexToOwnerPAR = false,
                              FollowsGroundTilt = false,
                              FacesTarget = false
                            }
                          },
                          {
                            Function = BBIfHasBuff,
                            Params = {
                              OwnerVar = "Attacker",
                              AttackerVar = "Attacker",
                              BuffName = "ObduracyBuff"
                            },
                            SubBlocks = {
                              {
                                Function = BBSpellEffectCreate,
                                Params = {
                                  BindObjectVar = "Unit",
                                  EffectName = "MalphiteCleaveEnragedHit.troy",
                                  Flags = 0,
                                  EffectIDVar = "a",
                                  TargetObjectVar = "Unit",
                                  SpecificUnitOnlyVar = "Owner",
                                  SpecificTeamOnly = TEAM_UNKNOWN,
                                  UseSpecificUnit = false,
                                  FOWTeam = TEAM_UNKNOWN,
                                  FOWVisibilityRadius = 0,
                                  SendIfOnScreenOrDiscard = true,
                                  PersistsThroughReconnect = false,
                                  BindFlexToOwnerPAR = false,
                                  FollowsGroundTilt = false,
                                  FacesTarget = false
                                }
                              }
                            }
                          },
                          {
                            Function = BBElse,
                            Params = {},
                            SubBlocks = {
                              {
                                Function = BBSpellEffectCreate,
                                Params = {
                                  BindObjectVar = "Unit",
                                  EffectName = "MalphiteCleaveHit.troy",
                                  Flags = 0,
                                  EffectIDVar = "a",
                                  TargetObjectVar = "Unit",
                                  SpecificUnitOnlyVar = "Owner",
                                  SpecificTeamOnly = TEAM_UNKNOWN,
                                  UseSpecificUnit = false,
                                  FOWTeam = TEAM_UNKNOWN,
                                  FOWVisibilityRadius = 0,
                                  SendIfOnScreenOrDiscard = true,
                                  PersistsThroughReconnect = false,
                                  BindFlexToOwnerPAR = false,
                                  FollowsGroundTilt = false,
                                  FacesTarget = false
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
      Name = "malphitecleaveenragedhit.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "malphitecleavehit.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "globalhit_physical.troy"
    }
  }
}
