NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "Summoner_PromoteSR.dds"
BuffName = "SummonerPromoteSR"
AutoBuffActivateEffect = "bloodboil_buf.troy"
AutoBuffActivateAttachBoneName = "l_hand"
AutoBuffActivateEffect2 = "bloodboil_buf.troy"
AutoBuffActivateAttachBoneName2 = "r_hand"
AutoBuffActivateAttachBoneName3 = ""
AutoBuffActivateAttachBoneName4 = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "PromoteMeBuff"
    },
    SubBlocks = {
      {
        Function = BBRequireVar,
        Params = {
          RequiredVar = "TotalMR",
          RequiredVarTable = "InstanceVars"
        }
      },
      {
        Function = BBRequireVar,
        Params = {
          RequiredVar = "BonusArmor",
          RequiredVarTable = "InstanceVars"
        }
      },
      {
        Function = BBRedirectGold,
        Params = {RedirectSourceVar = "Owner", RedirectTargetVar = "Attacker"}
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          PosVar = "Owner",
          EffectName = "Summoner_Flash.troy",
          Flags = 0,
          EffectIDVar = "aras",
          TargetObjectVar = "Target",
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
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "Summoner_Cast.troy",
          Flags = 0,
          EffectIDVar = "CastParticle",
          TargetObjectVar = "Target",
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
        Function = BBRequireVar,
        Params = {
          RequiredVar = "BonusHealth",
          RequiredVarTable = "InstanceVars"
        }
      },
      {
        Function = BBIncPermanentStat,
        Params = {
          Stat = IncPermanentPercentAttackSpeedMod,
          TargetVar = "Owner",
          Delta = 0.5
        }
      },
      {
        Function = BBIncPermanentStat,
        Params = {
          Stat = IncPermanentFlatAttackRangeMod,
          TargetVar = "Owner",
          Delta = 75
        }
      },
      {
        Function = BBIncPermanentStat,
        Params = {
          Stat = IncPermanentFlatSpellBlockMod,
          TargetVar = "Owner",
          DeltaVar = "TotalMR",
          DeltaVarTable = "InstanceVars",
          Delta = 0
        }
      },
      {
        Function = BBIncPermanentStat,
        Params = {
          Stat = IncPermanentFlatArmorMod,
          TargetVar = "Owner",
          DeltaVar = "BonusArmor",
          DeltaVarTable = "InstanceVars",
          Delta = 0
        }
      },
      {
        Function = BBIncScaleSkinCoef,
        Params = {Scale = 0.4, OwnerVar = "Owner"}
      }
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "OdinSuperMinion"
    },
    SubBlocks = {
      {
        Function = BBRedirectGold,
        Params = {RedirectSourceVar = "Owner", RedirectTargetVar = "Attacker"}
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          PosVar = "Owner",
          EffectName = "Summoner_Flash.troy",
          Flags = 0,
          EffectIDVar = "aras",
          TargetObjectVar = "Target",
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
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "Summoner_Cast.troy",
          Flags = 0,
          EffectIDVar = "CastParticle",
          TargetObjectVar = "Target",
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
        Function = BBRequireVar,
        Params = {
          RequiredVar = "BonusHealth",
          RequiredVarTable = "InstanceVars"
        }
      },
      {
        Function = BBGetTeamID,
        Params = {
          TargetVar = "Attacker",
          DestVar = "OwnerTeamID"
        }
      },
      {
        Function = BBIncPermanentStat,
        Params = {
          Stat = IncPermanentPercentAttackSpeedMod,
          TargetVar = "Owner",
          Delta = 0.8
        }
      },
      {
        Function = BBIncPermanentStat,
        Params = {
          Stat = IncPermanentFlatAttackRangeMod,
          TargetVar = "Owner",
          Delta = 75
        }
      },
      {
        Function = BBIncPermanentStat,
        Params = {
          Stat = IncPermanentPercentCooldownMod,
          TargetVar = "Owner",
          Delta = -1
        }
      },
      {
        Function = BBIncPermanentStat,
        Params = {
          Stat = IncPermanentFlatSpellBlockMod,
          TargetVar = "Owner",
          Delta = -10
        }
      },
      {
        Function = BBIncScaleSkinCoef,
        Params = {Scale = 0.7, OwnerVar = "Owner"}
      }
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "PromoteMeBuff"
    },
    SubBlocks = {
      {
        Function = BBIncStat,
        Params = {
          Stat = IncFlatHPPoolMod,
          TargetVar = "Owner",
          DeltaVar = "BonusHealth",
          DeltaVarTable = "InstanceVars",
          Delta = 0
        }
      },
      {
        Function = BBIncScaleSkinCoef,
        Params = {Scale = 0.4, OwnerVar = "Owner"}
      }
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "OdinSuperMinion"
    },
    SubBlocks = {
      {
        Function = BBIncStat,
        Params = {
          Stat = IncFlatHPPoolMod,
          TargetVar = "Owner",
          DeltaVar = "BonusHealth",
          DeltaVarTable = "InstanceVars",
          Delta = 0
        }
      },
      {
        Function = BBIncScaleSkinCoef,
        Params = {Scale = 0.7, OwnerVar = "Owner"}
      }
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "PromoteMeBuff"
    },
    SubBlocks = {
      {
        Function = BBExecutePeriodically,
        Params = {
          TimeBetweenExecutions = 5,
          TrackTimeVar = "LastTimeExecuted",
          TrackTimeVarTable = "InstanceVars",
          ExecuteImmediately = false
        },
        SubBlocks = {
          {
            Function = BBForNClosestUnitsInTargetArea,
            Params = {
              AttackerVar = "Owner",
              CenterVar = "Owner",
              Range = 850,
              Flags = "AffectEnemies AffectTurrets ",
              IteratorVar = "Unit",
              MaximumUnitsToPick = 1,
              BuffNameFilter = "Taunt",
              InclusiveBuffFilter = false
            },
            SubBlocks = {
              {
                Function = BBApplyTaunt,
                Params = {
                  AttackerVar = "Unit",
                  TargetVar = "Owner",
                  Duration = 10
                }
              }
            }
          }
        }
      }
    }
  }
}
BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "PromoteMeBuff"
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Target",
          EffectName = "GemKnightBasicAttack_tar.troy",
          Flags = 0,
          EffectIDVar = "Gemhit",
          TargetObjectVar = "Target",
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
      }
    }
  }
}
CanCastBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "OdinPlayerBuff"
    },
    SubBlocks = {
      {
        Function = BBExecutePeriodically,
        Params = {
          TimeBetweenExecutions = 0.25,
          TrackTimeVar = "LastTimeExecutedPromote",
          TrackTimeVarTable = "AvatarVars",
          ExecuteImmediately = true
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "CanCastPromote",
              DestVarTable = "AvatarVars",
              SrcValue = false
            }
          },
          {
            Function = BBForEachUnitInTargetArea,
            Params = {
              AttackerVar = "Owner",
              CenterVar = "Owner",
              Range = 1000,
              Flags = "AffectFriends AffectMinions NotAffectSelf ",
              IteratorVar = "Unit",
              BuffNameFilter = "OdinSuperMinion",
              InclusiveBuffFilter = true
            },
            SubBlocks = {
              {
                Function = BBIfNotHasBuff,
                Params = {
                  OwnerVar = "Unit",
                  CasterVar = "Nothing",
                  BuffName = "SummonerOdinPromote"
                },
                SubBlocks = {
                  {
                    Function = BBIfHasBuff,
                    Params = {
                      OwnerVar = "Unit",
                      AttackerVar = "Nothing",
                      BuffName = "OdinSuperMinion"
                    },
                    SubBlocks = {
                      {
                        Function = BBSetVarInTable,
                        Params = {
                          DestVar = "CanCastPromote",
                          DestVarTable = "AvatarVars",
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
  },
  {
    Function = BBSetReturnValue,
    Params = {
      SrcVar = "CanCastPromote",
      SrcVarTable = "AvatarVars"
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBExecutePeriodically,
        Params = {
          TimeBetweenExecutions = 0.25,
          TrackTimeVar = "LastTimeExecutedPromote",
          TrackTimeVarTable = "AvatarVars",
          ExecuteImmediately = true
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "CanCastPromote",
              DestVarTable = "AvatarVars",
              SrcValue = false
            }
          },
          {
            Function = BBForEachUnitInTargetArea,
            Params = {
              AttackerVar = "Owner",
              CenterVar = "Owner",
              Range = 1000,
              Flags = "AffectFriends AffectMinions NotAffectSelf ",
              IteratorVar = "Unit",
              BuffNameFilter = "PromoteMeBuff",
              InclusiveBuffFilter = true
            },
            SubBlocks = {
              {
                Function = BBIfNotHasBuff,
                Params = {
                  OwnerVar = "Unit",
                  CasterVar = "Nothing",
                  BuffName = "SummonerPromoteSR"
                },
                SubBlocks = {
                  {
                    Function = BBIfHasBuff,
                    Params = {
                      OwnerVar = "Unit",
                      AttackerVar = "Nothing",
                      BuffName = "PromoteMeBuff"
                    },
                    SubBlocks = {
                      {
                        Function = BBSetVarInTable,
                        Params = {
                          DestVar = "CanCastPromote",
                          DestVarTable = "AvatarVars",
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
  },
  {
    Function = BBSetReturnValue,
    Params = {
      SrcVar = "CanCastPromote",
      SrcVarTable = "AvatarVars"
    }
  }
}
AdjustCooldownBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BaseCooldown",
      SrcValue = 180
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "SummonerCooldownBonus",
      Src1VarTable = "AvatarVars",
      Value2 = 0,
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src2Var = "SummonerCooldownBonus",
          Src2VarTable = "AvatarVars",
          Src1Value = 1,
          Src2Value = 0,
          DestVar = "CooldownMultiplier",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "BaseCooldown",
          Src2Var = "CooldownMultiplier",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "BaseCooldown",
          MathOp = MO_MULTIPLY
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "PromoteCooldownBonus",
      Src1VarTable = "AvatarVars",
      Value2 = 0,
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "BaseCooldown",
          Src2Var = "PromoteCooldownBonus",
          Src2VarTable = "AvatarVars",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "BaseCooldown",
          MathOp = MO_SUBTRACT
        }
      }
    }
  },
  {
    Function = BBSetReturnValue,
    Params = {
      SrcVar = "BaseCooldown"
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "OdinPlayerBuff"
    },
    SubBlocks = {
      {
        Function = BBGetLevel,
        Params = {TargetVar = "Owner", DestVar = "OwnerLevel"}
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "OwnerLevel",
          Src1Value = 0,
          Src2Value = 75,
          DestVar = "BonusHealth",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "BonusHealth",
          Src1Value = 0,
          Src2Value = 200,
          DestVar = "BonusHealth",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "BonusHealth",
          DestVarTable = "NextBuffVars",
          SrcVar = "BonusHealth"
        }
      },
      {
        Function = BBForNClosestUnitsInTargetArea,
        Params = {
          AttackerVar = "Owner",
          CenterVar = "Owner",
          Range = 1000,
          Flags = "AffectFriends AffectMinions NotAffectSelf ",
          IteratorVar = "Unit",
          MaximumUnitsToPick = 1,
          BuffNameFilter = "OdinSuperMinion",
          InclusiveBuffFilter = true
        },
        SubBlocks = {
          {
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Unit",
              AttackerVar = "Nothing",
              BuffName = "SummonerOdinPromote"
            },
            SubBlocks = {
              {
                Function = BBForNClosestUnitsInTargetArea,
                Params = {
                  AttackerVar = "Owner",
                  CenterVar = "Owner",
                  Range = 1000,
                  Flags = "AffectFriends AffectMinions NotAffectSelf ",
                  IteratorVar = "Unit",
                  MaximumUnitsToPick = 2,
                  BuffNameFilter = "OdinSuperMinion",
                  InclusiveBuffFilter = true
                },
                SubBlocks = {
                  {
                    Function = BBIfHasBuff,
                    Params = {
                      OwnerVar = "Unit",
                      AttackerVar = "Nothing",
                      BuffName = "SummonerOdinPromote"
                    },
                    SubBlocks = {
                      {
                        Function = BBMath,
                        Params = {
                          Src1Var = "Count",
                          Src1Value = 0,
                          Src2Value = 1,
                          DestVar = "Count",
                          MathOp = MO_ADD
                        }
                      },
                      {
                        Function = BBIf,
                        Params = {
                          Src1Var = "Count",
                          Value2 = 2,
                          CompareOp = CO_GREATER_THAN_OR_EQUAL
                        },
                        SubBlocks = {
                          {
                            Function = BBForNClosestUnitsInTargetArea,
                            Params = {
                              AttackerVar = "Owner",
                              CenterVar = "Owner",
                              Range = 1000,
                              Flags = "AffectFriends AffectMinions NotAffectSelf ",
                              IteratorVar = "Unit",
                              MaximumUnitsToPick = 3,
                              BuffNameFilter = "OdinSuperMinion",
                              InclusiveBuffFilter = true
                            },
                            SubBlocks = {
                              {
                                Function = BBIfHasBuff,
                                Params = {
                                  OwnerVar = "Unit",
                                  AttackerVar = "Nothing",
                                  BuffName = "SummonerOdinPromote"
                                },
                                SubBlocks = {
                                  {
                                    Function = BBMath,
                                    Params = {
                                      Src1Var = "Count",
                                      Src1Value = 0,
                                      Src2Value = 0,
                                      DestVar = "Count",
                                      MathOp = MO_MAX
                                    }
                                  },
                                  {
                                    Function = BBMath,
                                    Params = {
                                      Src1Var = "Count",
                                      Src1Value = 0,
                                      Src2Value = 1,
                                      DestVar = "Count",
                                      MathOp = MO_ADD
                                    }
                                  },
                                  {
                                    Function = BBIf,
                                    Params = {
                                      Src1Var = "Count",
                                      Value2 = 3,
                                      CompareOp = CO_GREATER_THAN_OR_EQUAL
                                    },
                                    SubBlocks = {
                                      {
                                        Function = BBForNClosestUnitsInTargetArea,
                                        Params = {
                                          AttackerVar = "Owner",
                                          CenterVar = "Owner",
                                          Range = 1000,
                                          Flags = "AffectFriends AffectMinions NotAffectSelf ",
                                          IteratorVar = "Unit",
                                          MaximumUnitsToPick = 4,
                                          BuffNameFilter = "OdinSuperMinion",
                                          InclusiveBuffFilter = true
                                        },
                                        SubBlocks = {
                                          {
                                            Function = BBIfNotHasBuff,
                                            Params = {
                                              OwnerVar = "Unit",
                                              CasterVar = "Nothing",
                                              BuffName = "SummonerOdinPromote"
                                            },
                                            SubBlocks = {
                                              {
                                                Function = BBGetUnitSkinName,
                                                Params = {TargetVar = "Unit", DestVar = "SkinName"}
                                              },
                                              {
                                                Function = BBIf,
                                                Params = {
                                                  Src1Var = "SkinName",
                                                  Value2 = "OdinBlueSuperminion",
                                                  CompareOp = CO_EQUAL
                                                },
                                                SubBlocks = {
                                                  {
                                                    Function = BBSpellEffectCreate,
                                                    Params = {
                                                      BindObjectVar = "Owner",
                                                      EffectName = "Summoner_Cast.troy",
                                                      Flags = 0,
                                                      EffectIDVar = "CastParticle",
                                                      TargetObjectVar = "Unit",
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
                                                    Function = BBSpellBuffAdd,
                                                    Params = {
                                                      TargetVar = "Unit",
                                                      AttackerVar = "Attacker",
                                                      BuffAddType = BUFF_REPLACE_EXISTING,
                                                      StacksExclusive = true,
                                                      BuffType = BUFF_Aura,
                                                      MaxStack = 1,
                                                      NumberOfStacks = 1,
                                                      Duration = 3600,
                                                      BuffVarsTable = "NextBuffVars",
                                                      TickRate = 0,
                                                      CanMitigateDuration = false,
                                                      IsHiddenOnClient = false
                                                    }
                                                  },
                                                  {
                                                    Function = BBIncHealth,
                                                    Params = {
                                                      TargetVar = "Unit",
                                                      Delta = 10000,
                                                      HealerVar = "Unit"
                                                    }
                                                  }
                                                }
                                              },
                                              {
                                                Function = BBElseIf,
                                                Params = {
                                                  Src1Var = "SkinName",
                                                  Value2 = "OdinRedSuperminion",
                                                  CompareOp = CO_EQUAL
                                                },
                                                SubBlocks = {
                                                  {
                                                    Function = BBSpellEffectCreate,
                                                    Params = {
                                                      BindObjectVar = "Owner",
                                                      EffectName = "Summoner_Cast.troy",
                                                      Flags = 0,
                                                      EffectIDVar = "CastParticle",
                                                      TargetObjectVar = "Unit",
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
                                                    Function = BBSpellBuffAdd,
                                                    Params = {
                                                      TargetVar = "Unit",
                                                      AttackerVar = "Attacker",
                                                      BuffAddType = BUFF_REPLACE_EXISTING,
                                                      StacksExclusive = true,
                                                      BuffType = BUFF_Aura,
                                                      MaxStack = 1,
                                                      NumberOfStacks = 1,
                                                      Duration = 3600,
                                                      BuffVarsTable = "NextBuffVars",
                                                      TickRate = 0,
                                                      CanMitigateDuration = false,
                                                      IsHiddenOnClient = false
                                                    }
                                                  },
                                                  {
                                                    Function = BBIncHealth,
                                                    Params = {
                                                      TargetVar = "Unit",
                                                      Delta = 10000,
                                                      HealerVar = "Unit"
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
                              },
                              {
                                Function = BBIfNotHasBuff,
                                Params = {
                                  OwnerVar = "Unit",
                                  CasterVar = "Nothing",
                                  BuffName = "SummonerOdinPromote"
                                },
                                SubBlocks = {
                                  {
                                    Function = BBGetUnitSkinName,
                                    Params = {TargetVar = "Unit", DestVar = "SkinName"}
                                  },
                                  {
                                    Function = BBIf,
                                    Params = {
                                      Src1Var = "SkinName",
                                      Value2 = "OdinBlueSuperminion",
                                      CompareOp = CO_EQUAL
                                    },
                                    SubBlocks = {
                                      {
                                        Function = BBSpellEffectCreate,
                                        Params = {
                                          BindObjectVar = "Owner",
                                          EffectName = "Summoner_Cast.troy",
                                          Flags = 0,
                                          EffectIDVar = "CastParticle",
                                          TargetObjectVar = "Unit",
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
                                        Function = BBSpellBuffAdd,
                                        Params = {
                                          TargetVar = "Unit",
                                          AttackerVar = "Attacker",
                                          BuffAddType = BUFF_REPLACE_EXISTING,
                                          StacksExclusive = true,
                                          BuffType = BUFF_Aura,
                                          MaxStack = 1,
                                          NumberOfStacks = 1,
                                          Duration = 3600,
                                          BuffVarsTable = "NextBuffVars",
                                          TickRate = 0,
                                          CanMitigateDuration = false,
                                          IsHiddenOnClient = false
                                        }
                                      },
                                      {
                                        Function = BBIncHealth,
                                        Params = {
                                          TargetVar = "Unit",
                                          Delta = 10000,
                                          HealerVar = "Unit"
                                        }
                                      }
                                    }
                                  },
                                  {
                                    Function = BBElseIf,
                                    Params = {
                                      Src1Var = "SkinName",
                                      Value2 = "OdinRedSuperminion",
                                      CompareOp = CO_EQUAL
                                    },
                                    SubBlocks = {
                                      {
                                        Function = BBSpellEffectCreate,
                                        Params = {
                                          BindObjectVar = "Owner",
                                          EffectName = "Summoner_Cast.troy",
                                          Flags = 0,
                                          EffectIDVar = "CastParticle",
                                          TargetObjectVar = "Unit",
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
                                        Function = BBSpellBuffAdd,
                                        Params = {
                                          TargetVar = "Unit",
                                          AttackerVar = "Attacker",
                                          BuffAddType = BUFF_REPLACE_EXISTING,
                                          StacksExclusive = true,
                                          BuffType = BUFF_Aura,
                                          MaxStack = 1,
                                          NumberOfStacks = 1,
                                          Duration = 3600,
                                          BuffVarsTable = "NextBuffVars",
                                          TickRate = 0,
                                          CanMitigateDuration = false,
                                          IsHiddenOnClient = false
                                        }
                                      },
                                      {
                                        Function = BBIncHealth,
                                        Params = {
                                          TargetVar = "Unit",
                                          Delta = 10000,
                                          HealerVar = "Unit"
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
                  },
                  {
                    Function = BBIfNotHasBuff,
                    Params = {
                      OwnerVar = "Unit",
                      CasterVar = "Nothing",
                      BuffName = "SummonerOdinPromote"
                    },
                    SubBlocks = {
                      {
                        Function = BBGetUnitSkinName,
                        Params = {TargetVar = "Unit", DestVar = "SkinName"}
                      },
                      {
                        Function = BBIf,
                        Params = {
                          Src1Var = "SkinName",
                          Value2 = "OdinBlueSuperminion",
                          CompareOp = CO_EQUAL
                        },
                        SubBlocks = {
                          {
                            Function = BBSpellEffectCreate,
                            Params = {
                              BindObjectVar = "Owner",
                              EffectName = "Summoner_Cast.troy",
                              Flags = 0,
                              EffectIDVar = "CastParticle",
                              TargetObjectVar = "Unit",
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
                            Function = BBSpellBuffAdd,
                            Params = {
                              TargetVar = "Unit",
                              AttackerVar = "Attacker",
                              BuffAddType = BUFF_REPLACE_EXISTING,
                              StacksExclusive = true,
                              BuffType = BUFF_Aura,
                              MaxStack = 1,
                              NumberOfStacks = 1,
                              Duration = 3600,
                              BuffVarsTable = "NextBuffVars",
                              TickRate = 0,
                              CanMitigateDuration = false,
                              IsHiddenOnClient = false
                            }
                          },
                          {
                            Function = BBIncHealth,
                            Params = {
                              TargetVar = "Unit",
                              Delta = 10000,
                              HealerVar = "Unit"
                            }
                          }
                        }
                      },
                      {
                        Function = BBElseIf,
                        Params = {
                          Src1Var = "SkinName",
                          Value2 = "OdinRedSuperminion",
                          CompareOp = CO_EQUAL
                        },
                        SubBlocks = {
                          {
                            Function = BBSpellEffectCreate,
                            Params = {
                              BindObjectVar = "Owner",
                              EffectName = "Summoner_Cast.troy",
                              Flags = 0,
                              EffectIDVar = "CastParticle",
                              TargetObjectVar = "Unit",
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
                            Function = BBSpellBuffAdd,
                            Params = {
                              TargetVar = "Unit",
                              AttackerVar = "Attacker",
                              BuffAddType = BUFF_REPLACE_EXISTING,
                              StacksExclusive = true,
                              BuffType = BUFF_Aura,
                              MaxStack = 1,
                              NumberOfStacks = 1,
                              Duration = 3600,
                              BuffVarsTable = "NextBuffVars",
                              TickRate = 0,
                              CanMitigateDuration = false,
                              IsHiddenOnClient = false
                            }
                          },
                          {
                            Function = BBIncHealth,
                            Params = {
                              TargetVar = "Unit",
                              Delta = 10000,
                              HealerVar = "Unit"
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          },
          {
            Function = BBIfNotHasBuff,
            Params = {
              OwnerVar = "Unit",
              CasterVar = "Nothing",
              BuffName = "SummonerOdinPromote"
            },
            SubBlocks = {
              {
                Function = BBGetUnitSkinName,
                Params = {TargetVar = "Unit", DestVar = "SkinName"}
              },
              {
                Function = BBIf,
                Params = {
                  Src1Var = "SkinName",
                  Value2 = "OdinBlueSuperminion",
                  CompareOp = CO_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBSpellEffectCreate,
                    Params = {
                      BindObjectVar = "Owner",
                      EffectName = "Summoner_Cast.troy",
                      Flags = 0,
                      EffectIDVar = "CastParticle",
                      TargetObjectVar = "Unit",
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
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Unit",
                      AttackerVar = "Attacker",
                      BuffAddType = BUFF_REPLACE_EXISTING,
                      StacksExclusive = true,
                      BuffType = BUFF_Aura,
                      MaxStack = 1,
                      NumberOfStacks = 1,
                      Duration = 3600,
                      BuffVarsTable = "NextBuffVars",
                      TickRate = 0,
                      CanMitigateDuration = false,
                      IsHiddenOnClient = false
                    }
                  },
                  {
                    Function = BBIncHealth,
                    Params = {
                      TargetVar = "Unit",
                      Delta = 10000,
                      HealerVar = "Unit"
                    }
                  }
                }
              },
              {
                Function = BBElseIf,
                Params = {
                  Src1Var = "SkinName",
                  Value2 = "OdinRedSuperminion",
                  CompareOp = CO_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBSpellEffectCreate,
                    Params = {
                      BindObjectVar = "Owner",
                      EffectName = "Summoner_Cast.troy",
                      Flags = 0,
                      EffectIDVar = "CastParticle",
                      TargetObjectVar = "Unit",
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
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Unit",
                      AttackerVar = "Attacker",
                      BuffAddType = BUFF_REPLACE_EXISTING,
                      StacksExclusive = true,
                      BuffType = BUFF_Aura,
                      MaxStack = 1,
                      NumberOfStacks = 1,
                      Duration = 3600,
                      BuffVarsTable = "NextBuffVars",
                      TickRate = 0,
                      CanMitigateDuration = false,
                      IsHiddenOnClient = false
                    }
                  },
                  {
                    Function = BBIncHealth,
                    Params = {
                      TargetVar = "Unit",
                      Delta = 10000,
                      HealerVar = "Unit"
                    }
                  }
                }
              }
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
        Function = BBGetLevel,
        Params = {TargetVar = "Owner", DestVar = "OwnerLevel"}
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "OwnerLevel",
          Src1Value = 0,
          Src2Value = 100,
          DestVar = "BonusHealth",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "BonusHealth",
          Src1Value = 0,
          Src2Value = 100,
          DestVar = "BonusHealth",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "BonusHealth",
          DestVarTable = "NextBuffVars",
          SrcVar = "BonusHealth"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "OwnerLevel",
          Src1Value = 5,
          Src2Value = 0,
          DestVar = "BonusArmor",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "BonusArmor",
          Src1Value = 0,
          Src2Value = 20,
          DestVar = "BonusArmor",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "BonusArmor",
          DestVarTable = "NextBuffVars",
          SrcVar = "BonusArmor"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "OwnerLevel",
          Src1Value = 0.75,
          Src2Value = 0,
          DestVar = "TotalMR",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "TotalMR",
          Src1Value = 0,
          Src2Value = 10,
          DestVar = "TotalMR",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "TotalMR",
          DestVarTable = "NextBuffVars",
          SrcVar = "TotalMR"
        }
      },
      {
        Function = BBForNClosestUnitsInTargetArea,
        Params = {
          AttackerVar = "Attacker",
          CenterVar = "Attacker",
          Range = 1000,
          Flags = "AffectFriends AffectMinions AlwaysSelf ",
          IteratorVar = "Unit",
          MaximumUnitsToPick = 1,
          BuffNameFilter = "PromoteMeBuff",
          InclusiveBuffFilter = true
        },
        SubBlocks = {
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Unit",
              AttackerVar = "Attacker",
              BuffName = "SummonerPromoteSR",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_CombatEnchancer,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 25000,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          },
          {
            Function = BBSpellBuffRemove,
            Params = {
              TargetVar = "Unit",
              AttackerVar = "Owner",
              BuffName = "PromoteBuff",
              ResetDuration = 0
            }
          }
        }
      }
    }
  }
}
SpellUpdateTooltipBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BaseCooldown",
      SrcValue = 180
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "SummonerCooldownBonus",
      Src1VarTable = "AvatarVars",
      Value2 = 0,
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src2Var = "SummonerCooldownBonus",
          Src2VarTable = "AvatarVars",
          Src1Value = 1,
          Src2Value = 0,
          DestVar = "CooldownMultiplier",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "BaseCooldown",
          Src2Var = "CooldownMultiplier",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "BaseCooldown",
          MathOp = MO_MULTIPLY
        }
      }
    }
  },
  {
    Function = BBSetSpellToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "BaseCooldown",
      Index = 1,
      SlotNumber = 0,
      SlotNumberVar = "SpellSlot",
      SlotType = SpellSlots,
      SlotBook = SPELLBOOK_SUMMONER,
      TargetVar = "Attacker"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "summoner_flash.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "summoner_cast.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "gemknightbasicattack_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "summonerpromotesr"
    }
  }
}
