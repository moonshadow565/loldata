NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "KarmaSpiritBond.dds"
BuffName = "KarmaSpiritBondEnemySelf"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "MantraBoolean",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "MoveSpeedMod",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "DamageToDeal",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBGetTeamID,
    Params = {
      TargetVar = "Attacker",
      DestVar = "TeamOfOwner"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "MoveSpeedMod",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = -1,
      DestVar = "NegMoveSpeed",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMovementSpeedMod,
      TargetVar = "Attacker",
      DeltaVar = "NegMoveSpeed",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Attacker",
      EffectName = "karma_spiritBond_speed_buf.troy",
      Flags = 0,
      EffectIDVar = "MoveSpeedPart1",
      EffectIDVarTable = "InstanceVars",
      BoneName = "root",
      TargetObjectVar = "Attacker",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false,
      FollowsGroundTilt = false
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Attacker",
      EffectName = "leBlanc_shackle_self_idle.troy",
      Flags = 0,
      EffectIDVar = "SBIdle1",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Attacker",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false,
      FollowsGroundTilt = false
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "leBlanc_shackle_self_idle.troy",
      Flags = 0,
      EffectIDVar = "SBIdle2",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false,
      FollowsGroundTilt = false
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Attacker",
      EffectName = "karma_spiritBond_indicator_target_blank.troy",
      Flags = 0,
      EffectIDVar = "SoulShackleTarget_blood",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Attacker",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false,
      FollowsGroundTilt = false
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "MantraBoolean",
      Src1VarTable = "InstanceVars",
      Value2 = 1,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "karma_spiritBond_indicator_target_enemy.troy",
          Flags = 0,
          EffectIDVar = "SoulShackleTarget",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = false,
          FollowsGroundTilt = false
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "karma_spiritBond_indicator_impact_01.troy",
          Flags = 0,
          EffectIDVar = "SoulShackleTarget2",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = false,
          FollowsGroundTilt = false
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "TeamOfOwner",
          Value2 = TEAM_ORDER,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Attacker",
              EffectName = "karma_spiritBond_ult_beam_teamID_ally_green.troy",
              Flags = 0,
              EffectIDVar = "ParticleID",
              EffectIDVarTable = "InstanceVars",
              BoneName = "root",
              TargetObjectVar = "Owner",
              TargetBoneName = "root",
              SpecificUnitOnlyVar = "Attacker",
              SpecificTeamOnly = TEAM_ORDER,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWVisibilityRadius = 0,
              SendIfOnScreenOrDiscard = false,
              FollowsGroundTilt = false
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Owner",
              EffectName = "karma_spiritBond_ult_beam_teamID_enemy_red.troy",
              Flags = 0,
              EffectIDVar = "SoulShackleIdle",
              EffectIDVarTable = "InstanceVars",
              BoneName = "root",
              TargetObjectVar = "Attacker",
              TargetBoneName = "root",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_CHAOS,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWVisibilityRadius = 0,
              SendIfOnScreenOrDiscard = false,
              FollowsGroundTilt = false
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Attacker",
              EffectName = "KarmaSpiritBondSoundGreen.troy",
              Flags = 0,
              EffectIDVar = "SoundOne",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_ORDER,
              UseSpecificUnit = false,
              FOWTeam = TEAM_ORDER,
              FOWVisibilityRadius = 10,
              SendIfOnScreenOrDiscard = false,
              FollowsGroundTilt = false
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Attacker",
              EffectName = "KarmaSpiritBondSoundRed.troy",
              Flags = 0,
              EffectIDVar = "SoundTwo",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_CHAOS,
              UseSpecificUnit = false,
              FOWTeam = TEAM_CHAOS,
              FOWVisibilityRadius = 10,
              SendIfOnScreenOrDiscard = false,
              FollowsGroundTilt = false
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "TeamOfOwner",
          Value2 = TEAM_CHAOS,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Attacker",
              EffectName = "karma_spiritBond_ult_beam_teamID_ally_green.troy",
              Flags = 0,
              EffectIDVar = "ParticleID",
              EffectIDVarTable = "InstanceVars",
              BoneName = "root",
              TargetObjectVar = "Owner",
              TargetBoneName = "root",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_CHAOS,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWVisibilityRadius = 0,
              SendIfOnScreenOrDiscard = false,
              FollowsGroundTilt = false
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Owner",
              EffectName = "karma_spiritBond_ult_beam_teamID_enemy_red.troy",
              Flags = 0,
              EffectIDVar = "SoulShackleIdle",
              EffectIDVarTable = "InstanceVars",
              BoneName = "root",
              TargetObjectVar = "Attacker",
              TargetBoneName = "root",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_ORDER,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWVisibilityRadius = 0,
              SendIfOnScreenOrDiscard = false,
              FollowsGroundTilt = false
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Attacker",
              EffectName = "KarmaSpiritBondSoundGreen.troy",
              Flags = 0,
              EffectIDVar = "SoundOne",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_CHAOS,
              UseSpecificUnit = false,
              FOWTeam = TEAM_CHAOS,
              FOWVisibilityRadius = 10,
              SendIfOnScreenOrDiscard = false,
              FollowsGroundTilt = false
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Attacker",
              EffectName = "KarmaSpiritBondSoundRed.troy",
              Flags = 0,
              EffectIDVar = "SoundTwo",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_ORDER,
              UseSpecificUnit = false,
              FOWTeam = TEAM_ORDER,
              FOWVisibilityRadius = 0,
              SendIfOnScreenOrDiscard = false,
              FollowsGroundTilt = false
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
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "karma_spiritBond_indicator_impact.troy",
          Flags = 0,
          EffectIDVar = "SoulShackleTarget",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = false,
          FollowsGroundTilt = false
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "TeamOfOwner",
          Value2 = TEAM_ORDER,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Attacker",
              EffectName = "karma_spiritBond_beam_teamID_ally_green.troy",
              Flags = 0,
              EffectIDVar = "ParticleID",
              EffectIDVarTable = "InstanceVars",
              BoneName = "root",
              TargetObjectVar = "Owner",
              TargetBoneName = "root",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_ORDER,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWVisibilityRadius = 0,
              SendIfOnScreenOrDiscard = false,
              FollowsGroundTilt = false
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Owner",
              EffectName = "karma_spiritBond_beam_teamID_enemy_red.troy",
              Flags = 0,
              EffectIDVar = "SoulShackleIdle",
              EffectIDVarTable = "InstanceVars",
              BoneName = "root",
              TargetObjectVar = "Attacker",
              TargetBoneName = "root",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_CHAOS,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWVisibilityRadius = 0,
              SendIfOnScreenOrDiscard = false,
              FollowsGroundTilt = false
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Attacker",
              EffectName = "KarmaSpiritBondSoundGreen.troy",
              Flags = 0,
              EffectIDVar = "SoundOne",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_ORDER,
              UseSpecificUnit = false,
              FOWTeam = TEAM_ORDER,
              FOWVisibilityRadius = 10,
              SendIfOnScreenOrDiscard = false,
              FollowsGroundTilt = false
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Attacker",
              EffectName = "KarmaSpiritBondSoundRed.troy",
              Flags = 0,
              EffectIDVar = "SoundTwo",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_CHAOS,
              UseSpecificUnit = false,
              FOWTeam = TEAM_CHAOS,
              FOWVisibilityRadius = 10,
              SendIfOnScreenOrDiscard = false,
              FollowsGroundTilt = false
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "TeamOfOwner",
          Value2 = TEAM_CHAOS,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Attacker",
              EffectName = "karma_spiritBond_beam_teamID_ally_green.troy",
              Flags = 0,
              EffectIDVar = "ParticleID",
              EffectIDVarTable = "InstanceVars",
              BoneName = "root",
              TargetObjectVar = "Owner",
              TargetBoneName = "root",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_CHAOS,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWVisibilityRadius = 0,
              SendIfOnScreenOrDiscard = false,
              FollowsGroundTilt = false
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Owner",
              EffectName = "karma_spiritBond_beam_teamID_enemy_red.troy",
              Flags = 0,
              EffectIDVar = "SoulShackleIdle",
              EffectIDVarTable = "InstanceVars",
              BoneName = "root",
              TargetObjectVar = "Attacker",
              TargetBoneName = "root",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_ORDER,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWVisibilityRadius = 0,
              SendIfOnScreenOrDiscard = false,
              FollowsGroundTilt = false
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Attacker",
              EffectName = "KarmaSpiritBondSoundGreen.troy",
              Flags = 0,
              EffectIDVar = "SoundOne",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_CHAOS,
              UseSpecificUnit = false,
              FOWTeam = TEAM_CHAOS,
              FOWVisibilityRadius = 10,
              SendIfOnScreenOrDiscard = false,
              FollowsGroundTilt = false
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Attacker",
              EffectName = "KarmaSpiritBondSoundRed.troy",
              Flags = 0,
              EffectIDVar = "SoundTwo",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_ORDER,
              UseSpecificUnit = false,
              FOWTeam = TEAM_ORDER,
              FOWVisibilityRadius = 0,
              SendIfOnScreenOrDiscard = false,
              FollowsGroundTilt = false
            }
          }
        }
      }
    }
  },
  {
    Function = BBDistanceBetweenObjects,
    Params = {
      DestVar = "Distance",
      ObjectVar1 = "Owner",
      ObjectVar2 = "Attacker"
    }
  },
  {
    Function = BBGetOffsetAngle,
    Params = {
      UnitVar = "Attacker",
      OffsetPointVar = "Owner",
      OutputAngleVar = "OffsetAngle"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Distance",
      Src1Value = 0,
      Src2Value = 2,
      DestVar = "HalfDistance",
      MathOp = MO_DIVIDE
    }
  },
  {
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Attacker",
      Distance = 0,
      DistanceVar = "HalfDistance",
      OffsetAngle = 0,
      OffsetAngleVar = "OffsetAngle",
      PositionVar = "CenterPoint"
    }
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Attacker", DestVar = "TeamID"}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "TeamID",
      Value2 = TEAM_ORDER,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBForEachUnitInTargetRectangle,
        Params = {
          AttackerVar = "Attacker",
          CenterVar = "CenterPoint",
          HalfWidth = 25,
          HalfLength = 0,
          HalfLengthVar = "HalfDistance",
          Flags = "AffectEnemies AffectFriends AffectNeutral AffectMinions AffectHeroes ",
          IteratorVar = "Unit",
          BuffNameFilter = "KarmaLinkDmgCDOrder",
          InclusiveBuffFilter = false
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "Unit",
              Src2Var = "Attacker",
              CompareOp = CO_NOT_EQUAL
            },
            SubBlocks = {
              {
                Function = BBIf,
                Params = {
                  Src1Var = "Unit",
                  Src2Var = "Owner",
                  CompareOp = CO_NOT_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Unit",
                      AttackerVar = "Attacker",
                      BuffName = "KarmaLinkDmgCDOrder",
                      BuffAddType = BUFF_REPLACE_EXISTING,
                      StacksExclusive = true,
                      BuffType = BUFF_Internal,
                      MaxStack = 1,
                      NumberOfStacks = 1,
                      Duration = 5,
                      BuffVarsTable = "NextBuffVars",
                      TickRate = 0,
                      CanMitigateDuration = false,
                      IsHiddenOnClient = false
                    }
                  },
                  {
                    Function = BBIf,
                    Params = {
                      Src1Var = "MantraBoolean",
                      Src1VarTable = "InstanceVars",
                      Value2 = 1,
                      CompareOp = CO_EQUAL
                    },
                    SubBlocks = {
                      {
                        Function = BBIf,
                        Params = {
                          Src1Var = "Unit",
                          Src2Var = "Attacker",
                          CompareOp = CO_SAME_TEAM
                        },
                        SubBlocks = {
                          {
                            Function = BBIf,
                            Params = {Src1Var = "Unit", CompareOp = CO_IS_TYPE_HERO},
                            SubBlocks = {
                              {
                                Function = BBSetVarInTable,
                                Params = {
                                  DestVar = "MoveSpeedMod",
                                  DestVarTable = "NextBuffVars",
                                  SrcVar = "NegMoveSpeed",
                                  SrcVarTable = "InstanceVars",
                                  SrcValue = 0
                                }
                              },
                              {
                                Function = BBSpellBuffAdd,
                                Params = {
                                  TargetVar = "Unit",
                                  AttackerVar = "Attacker",
                                  BuffName = "KarmaMantraSBHaste",
                                  BuffAddType = BUFF_REPLACE_EXISTING,
                                  StacksExclusive = true,
                                  BuffType = BUFF_CombatEnchancer,
                                  MaxStack = 1,
                                  NumberOfStacks = 1,
                                  Duration = 3,
                                  BuffVarsTable = "NextBuffVars",
                                  TickRate = 0,
                                  CanMitigateDuration = false,
                                  IsHiddenOnClient = false
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
                            Function = BBSpellEffectCreate,
                            Params = {
                              BindObjectVar = "Unit",
                              EffectName = "karma_spiritBond_damage_tar.troy",
                              Flags = 0,
                              EffectIDVar = "hit",
                              TargetObjectVar = "Unit",
                              SpecificUnitOnlyVar = "Owner",
                              SpecificTeamOnly = TEAM_UNKNOWN,
                              UseSpecificUnit = false,
                              FOWTeam = TEAM_UNKNOWN,
                              FOWTeamOverrideVar = "TeamID",
                              FOWVisibilityRadius = 10,
                              SendIfOnScreenOrDiscard = true,
                              FollowsGroundTilt = false
                            }
                          },
                          {
                            Function = BBBreakSpellShields,
                            Params = {TargetVar = "Unit"}
                          },
                          {
                            Function = BBApplyDamage,
                            Params = {
                              AttackerVar = "Attacker",
                              CallForHelpAttackerVar = "Attacker",
                              TargetVar = "Unit",
                              Damage = 0,
                              DamageVar = "DamageToDeal",
                              DamageVarTable = "InstanceVars",
                              DamageType = MAGIC_DAMAGE,
                              SourceDamageType = DAMAGESOURCE_SPELLAOE,
                              PercentOfAttack = 1,
                              SpellDamageRatio = 0.7,
                              PhysicalDamageRatio = 0,
                              IgnoreDamageIncreaseMods = false,
                              IgnoreDamageCrit = false
                            }
                          },
                          {
                            Function = BBIf,
                            Params = {Src1Var = "Unit", CompareOp = CO_IS_TYPE_HERO},
                            SubBlocks = {
                              {
                                Function = BBSetVarInTable,
                                Params = {
                                  DestVar = "MoveSpeedMod",
                                  DestVarTable = "NextBuffVars",
                                  SrcVar = "MoveSpeedMod",
                                  SrcVarTable = "InstanceVars",
                                  SrcValue = 0
                                }
                              },
                              {
                                Function = BBSpellBuffAdd,
                                Params = {
                                  TargetVar = "Unit",
                                  AttackerVar = "Attacker",
                                  BuffName = "KarmaMantraSBSlow",
                                  BuffAddType = BUFF_REPLACE_EXISTING,
                                  StacksExclusive = true,
                                  BuffType = BUFF_Slow,
                                  MaxStack = 1,
                                  NumberOfStacks = 1,
                                  Duration = 3,
                                  BuffVarsTable = "NextBuffVars",
                                  TickRate = 0,
                                  CanMitigateDuration = false,
                                  IsHiddenOnClient = false
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
                        Function = BBIf,
                        Params = {
                          Src1Var = "Unit",
                          Src2Var = "Attacker",
                          CompareOp = CO_SAME_TEAM
                        },
                        SubBlocks = {
                          {
                            Function = BBIf,
                            Params = {Src1Var = "Unit", CompareOp = CO_IS_TYPE_HERO},
                            SubBlocks = {
                              {
                                Function = BBSetVarInTable,
                                Params = {
                                  DestVar = "MoveSpeedMod",
                                  DestVarTable = "NextBuffVars",
                                  SrcVar = "NegMoveSpeed",
                                  SrcVarTable = "InstanceVars",
                                  SrcValue = 0
                                }
                              },
                              {
                                Function = BBSpellBuffAdd,
                                Params = {
                                  TargetVar = "Unit",
                                  AttackerVar = "Attacker",
                                  BuffName = "KarmaMantraSBHaste",
                                  BuffAddType = BUFF_REPLACE_EXISTING,
                                  StacksExclusive = true,
                                  BuffType = BUFF_CombatEnchancer,
                                  MaxStack = 1,
                                  NumberOfStacks = 1,
                                  Duration = 3,
                                  BuffVarsTable = "NextBuffVars",
                                  TickRate = 0,
                                  CanMitigateDuration = false,
                                  IsHiddenOnClient = false
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
                            Function = BBSpellEffectCreate,
                            Params = {
                              BindObjectVar = "Unit",
                              EffectName = "karma_spiritBond_damage_tar.troy",
                              Flags = 0,
                              EffectIDVar = "hit",
                              TargetObjectVar = "Unit",
                              SpecificUnitOnlyVar = "Owner",
                              SpecificTeamOnly = TEAM_UNKNOWN,
                              UseSpecificUnit = false,
                              FOWTeam = TEAM_UNKNOWN,
                              FOWTeamOverrideVar = "TeamID",
                              FOWVisibilityRadius = 10,
                              SendIfOnScreenOrDiscard = true,
                              FollowsGroundTilt = false
                            }
                          },
                          {
                            Function = BBBreakSpellShields,
                            Params = {TargetVar = "Unit"}
                          },
                          {
                            Function = BBApplyDamage,
                            Params = {
                              AttackerVar = "Attacker",
                              CallForHelpAttackerVar = "Attacker",
                              TargetVar = "Unit",
                              Damage = 0,
                              DamageVar = "DamageToDeal",
                              DamageVarTable = "InstanceVars",
                              DamageType = MAGIC_DAMAGE,
                              SourceDamageType = DAMAGESOURCE_SPELLAOE,
                              PercentOfAttack = 1,
                              SpellDamageRatio = 0.7,
                              PhysicalDamageRatio = 0,
                              IgnoreDamageIncreaseMods = false,
                              IgnoreDamageCrit = false
                            }
                          },
                          {
                            Function = BBIf,
                            Params = {Src1Var = "Unit", CompareOp = CO_IS_TYPE_HERO},
                            SubBlocks = {
                              {
                                Function = BBSetVarInTable,
                                Params = {
                                  DestVar = "MoveSpeedMod",
                                  DestVarTable = "NextBuffVars",
                                  SrcVar = "MoveSpeedMod",
                                  SrcVarTable = "InstanceVars",
                                  SrcValue = 0
                                }
                              },
                              {
                                Function = BBSpellBuffAdd,
                                Params = {
                                  TargetVar = "Unit",
                                  AttackerVar = "Attacker",
                                  BuffName = "KarmaMantraSBSlow",
                                  BuffAddType = BUFF_REPLACE_EXISTING,
                                  StacksExclusive = true,
                                  BuffType = BUFF_Slow,
                                  MaxStack = 1,
                                  NumberOfStacks = 1,
                                  Duration = 3,
                                  BuffVarsTable = "NextBuffVars",
                                  TickRate = 0,
                                  CanMitigateDuration = false,
                                  IsHiddenOnClient = false
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
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBForEachUnitInTargetRectangle,
        Params = {
          AttackerVar = "Attacker",
          CenterVar = "CenterPoint",
          HalfWidth = 25,
          HalfLength = 0,
          HalfLengthVar = "HalfDistance",
          Flags = "AffectEnemies AffectFriends AffectNeutral AffectMinions AffectHeroes ",
          IteratorVar = "Unit",
          BuffNameFilter = "KarmaLinkDmgCDChaos",
          InclusiveBuffFilter = false
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "Unit",
              Src2Var = "Owner",
              CompareOp = CO_NOT_EQUAL
            },
            SubBlocks = {
              {
                Function = BBIf,
                Params = {
                  Src1Var = "Unit",
                  Src2Var = "Attacker",
                  CompareOp = CO_NOT_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Unit",
                      AttackerVar = "Attacker",
                      BuffName = "KarmaLinkDmgCDChaos",
                      BuffAddType = BUFF_REPLACE_EXISTING,
                      StacksExclusive = true,
                      BuffType = BUFF_Internal,
                      MaxStack = 1,
                      NumberOfStacks = 1,
                      Duration = 5,
                      BuffVarsTable = "NextBuffVars",
                      TickRate = 0,
                      CanMitigateDuration = false,
                      IsHiddenOnClient = false
                    }
                  },
                  {
                    Function = BBIf,
                    Params = {
                      Src1Var = "MantraBoolean",
                      Src1VarTable = "InstanceVars",
                      Value2 = 1,
                      CompareOp = CO_EQUAL
                    },
                    SubBlocks = {
                      {
                        Function = BBIf,
                        Params = {
                          Src1Var = "Unit",
                          Src2Var = "Attacker",
                          CompareOp = CO_SAME_TEAM
                        },
                        SubBlocks = {
                          {
                            Function = BBIf,
                            Params = {Src1Var = "Unit", CompareOp = CO_IS_TYPE_HERO},
                            SubBlocks = {
                              {
                                Function = BBSetVarInTable,
                                Params = {
                                  DestVar = "MoveSpeedMod",
                                  DestVarTable = "NextBuffVars",
                                  SrcVar = "NegMoveSpeed",
                                  SrcVarTable = "InstanceVars",
                                  SrcValue = 0
                                }
                              },
                              {
                                Function = BBSpellBuffAdd,
                                Params = {
                                  TargetVar = "Unit",
                                  AttackerVar = "Attacker",
                                  BuffName = "KarmaMantraSBHaste",
                                  BuffAddType = BUFF_REPLACE_EXISTING,
                                  StacksExclusive = true,
                                  BuffType = BUFF_CombatEnchancer,
                                  MaxStack = 1,
                                  NumberOfStacks = 1,
                                  Duration = 3,
                                  BuffVarsTable = "NextBuffVars",
                                  TickRate = 0,
                                  CanMitigateDuration = false,
                                  IsHiddenOnClient = false
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
                            Function = BBSpellEffectCreate,
                            Params = {
                              BindObjectVar = "Unit",
                              EffectName = "karma_spiritBond_damage_tar.troy",
                              Flags = 0,
                              EffectIDVar = "hit",
                              TargetObjectVar = "Unit",
                              SpecificUnitOnlyVar = "Owner",
                              SpecificTeamOnly = TEAM_UNKNOWN,
                              UseSpecificUnit = false,
                              FOWTeam = TEAM_UNKNOWN,
                              FOWTeamOverrideVar = "TeamID",
                              FOWVisibilityRadius = 10,
                              SendIfOnScreenOrDiscard = true,
                              FollowsGroundTilt = false
                            }
                          },
                          {
                            Function = BBBreakSpellShields,
                            Params = {TargetVar = "Unit"}
                          },
                          {
                            Function = BBApplyDamage,
                            Params = {
                              AttackerVar = "Attacker",
                              CallForHelpAttackerVar = "Attacker",
                              TargetVar = "Unit",
                              Damage = 0,
                              DamageVar = "DamageToDeal",
                              DamageVarTable = "InstanceVars",
                              DamageType = MAGIC_DAMAGE,
                              SourceDamageType = DAMAGESOURCE_SPELLAOE,
                              PercentOfAttack = 1,
                              SpellDamageRatio = 0.7,
                              PhysicalDamageRatio = 0,
                              IgnoreDamageIncreaseMods = false,
                              IgnoreDamageCrit = false
                            }
                          },
                          {
                            Function = BBIf,
                            Params = {Src1Var = "Unit", CompareOp = CO_IS_TYPE_HERO},
                            SubBlocks = {
                              {
                                Function = BBSetVarInTable,
                                Params = {
                                  DestVar = "MoveSpeedMod",
                                  DestVarTable = "NextBuffVars",
                                  SrcVar = "MoveSpeedMod",
                                  SrcVarTable = "InstanceVars",
                                  SrcValue = 0
                                }
                              },
                              {
                                Function = BBSpellBuffAdd,
                                Params = {
                                  TargetVar = "Unit",
                                  AttackerVar = "Attacker",
                                  BuffName = "KarmaMantraSBSlow",
                                  BuffAddType = BUFF_REPLACE_EXISTING,
                                  StacksExclusive = true,
                                  BuffType = BUFF_Slow,
                                  MaxStack = 1,
                                  NumberOfStacks = 1,
                                  Duration = 3,
                                  BuffVarsTable = "NextBuffVars",
                                  TickRate = 0,
                                  CanMitigateDuration = false,
                                  IsHiddenOnClient = false
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
                        Function = BBIf,
                        Params = {
                          Src1Var = "Unit",
                          Src2Var = "Attacker",
                          CompareOp = CO_SAME_TEAM
                        },
                        SubBlocks = {
                          {
                            Function = BBIf,
                            Params = {Src1Var = "Unit", CompareOp = CO_IS_TYPE_HERO},
                            SubBlocks = {
                              {
                                Function = BBSetVarInTable,
                                Params = {
                                  DestVar = "MoveSpeedMod",
                                  DestVarTable = "NextBuffVars",
                                  SrcVar = "NegMoveSpeed",
                                  SrcVarTable = "InstanceVars",
                                  SrcValue = 0
                                }
                              },
                              {
                                Function = BBSpellBuffAdd,
                                Params = {
                                  TargetVar = "Unit",
                                  AttackerVar = "Attacker",
                                  BuffName = "KarmaMantraSBHaste",
                                  BuffAddType = BUFF_REPLACE_EXISTING,
                                  StacksExclusive = true,
                                  BuffType = BUFF_CombatEnchancer,
                                  MaxStack = 1,
                                  NumberOfStacks = 1,
                                  Duration = 3,
                                  BuffVarsTable = "NextBuffVars",
                                  TickRate = 0,
                                  CanMitigateDuration = false,
                                  IsHiddenOnClient = false
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
                            Function = BBSpellEffectCreate,
                            Params = {
                              BindObjectVar = "Unit",
                              EffectName = "karma_spiritBond_damage_tar.troy",
                              Flags = 0,
                              EffectIDVar = "hit",
                              TargetObjectVar = "Unit",
                              SpecificUnitOnlyVar = "Owner",
                              SpecificTeamOnly = TEAM_UNKNOWN,
                              UseSpecificUnit = false,
                              FOWTeam = TEAM_UNKNOWN,
                              FOWTeamOverrideVar = "TeamID",
                              FOWVisibilityRadius = 10,
                              SendIfOnScreenOrDiscard = true,
                              FollowsGroundTilt = false
                            }
                          },
                          {
                            Function = BBBreakSpellShields,
                            Params = {TargetVar = "Unit"}
                          },
                          {
                            Function = BBApplyDamage,
                            Params = {
                              AttackerVar = "Attacker",
                              CallForHelpAttackerVar = "Attacker",
                              TargetVar = "Unit",
                              Damage = 0,
                              DamageVar = "DamageToDeal",
                              DamageVarTable = "InstanceVars",
                              DamageType = MAGIC_DAMAGE,
                              SourceDamageType = DAMAGESOURCE_SPELLAOE,
                              PercentOfAttack = 1,
                              SpellDamageRatio = 0.7,
                              PhysicalDamageRatio = 0,
                              IgnoreDamageIncreaseMods = false,
                              IgnoreDamageCrit = false
                            }
                          },
                          {
                            Function = BBIf,
                            Params = {Src1Var = "Unit", CompareOp = CO_IS_TYPE_HERO},
                            SubBlocks = {
                              {
                                Function = BBSetVarInTable,
                                Params = {
                                  DestVar = "MoveSpeedMod",
                                  DestVarTable = "NextBuffVars",
                                  SrcVar = "MoveSpeedMod",
                                  SrcVarTable = "InstanceVars",
                                  SrcValue = 0
                                }
                              },
                              {
                                Function = BBSpellBuffAdd,
                                Params = {
                                  TargetVar = "Unit",
                                  AttackerVar = "Attacker",
                                  BuffName = "KarmaMantraSBSlow",
                                  BuffAddType = BUFF_REPLACE_EXISTING,
                                  StacksExclusive = true,
                                  BuffType = BUFF_Slow,
                                  MaxStack = 1,
                                  NumberOfStacks = 1,
                                  Duration = 3,
                                  BuffVarsTable = "NextBuffVars",
                                  TickRate = 0,
                                  CanMitigateDuration = false,
                                  IsHiddenOnClient = false
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
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "SoundOne",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "SoundTwo",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "MoveSpeedPart1",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "SBIdle1",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "SBIdle2",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "ParticleID",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Attacker",
      BuffName = "KarmaMantraSBSlow"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Attacker",
          BuffName = "KarmaMantraSBSlow"
        }
      }
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Attacker",
      AttackerVar = "Attacker",
      BuffName = "KarmaSpiritBondEnemyTooltip"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Attacker",
          AttackerVar = "Attacker",
          BuffName = "KarmaSpiritBondEnemyTooltip"
        }
      }
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "SoulShackleIdle",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "SoulShackleTarget",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "SoulShackleTarget_blood",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "MantraBoolean",
      Src1VarTable = "InstanceVars",
      Value2 = 1,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectRemove,
        Params = {
          EffectIDVar = "SoulShackleTarget2",
          EffectIDVarTable = "InstanceVars"
        }
      }
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMovementSpeedMod,
      TargetVar = "Attacker",
      DeltaVar = "NegMoveSpeed",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBDistanceBetweenObjects,
    Params = {
      DestVar = "Distance",
      ObjectVar1 = "Owner",
      ObjectVar2 = "Attacker"
    }
  },
  {
    Function = BBGetOffsetAngle,
    Params = {
      UnitVar = "Attacker",
      OffsetPointVar = "Owner",
      OutputAngleVar = "OffsetAngle"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Distance",
      Src1Value = 0,
      Src2Value = 2,
      DestVar = "HalfDistance",
      MathOp = MO_DIVIDE
    }
  },
  {
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Attacker",
      Distance = 0,
      DistanceVar = "HalfDistance",
      OffsetAngle = 0,
      OffsetAngleVar = "OffsetAngle",
      PositionVar = "CenterPoint"
    }
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Attacker", DestVar = "TeamID"}
  },
  {
    Function = BBIf,
    Params = {Src1Var = "Owner", CompareOp = CO_IS_DEAD},
    SubBlocks = {
      {
        Function = BBSpellBuffRemoveCurrent,
        Params = {TargetVar = "Owner"}
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Attacker", CompareOp = CO_IS_DEAD},
        SubBlocks = {
          {
            Function = BBSpellBuffRemoveCurrent,
            Params = {TargetVar = "Owner"}
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBDistanceBetweenObjects,
            Params = {
              DestVar = "Distance",
              ObjectVar1 = "Owner",
              ObjectVar2 = "Attacker"
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "Distance",
              Value2 = 900,
              CompareOp = CO_GREATER_THAN
            },
            SubBlocks = {
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Attacker",
                  EffectName = "karma_spiritBond_break_overhead.troy",
                  Flags = 0,
                  EffectIDVar = "DistanceBreak1",
                  TargetObjectVar = "Attacker",
                  SpecificUnitOnlyVar = "Owner",
                  SpecificTeamOnly = TEAM_UNKNOWN,
                  UseSpecificUnit = false,
                  FOWTeam = TEAM_UNKNOWN,
                  FOWTeamOverrideVar = "TeamID",
                  FOWVisibilityRadius = 10,
                  SendIfOnScreenOrDiscard = true,
                  FollowsGroundTilt = false
                }
              },
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Owner",
                  EffectName = "karma_spiritBond_break_overhead.troy",
                  Flags = 0,
                  EffectIDVar = "DistanceBreak2",
                  TargetObjectVar = "Owner",
                  SpecificUnitOnlyVar = "Owner",
                  SpecificTeamOnly = TEAM_UNKNOWN,
                  UseSpecificUnit = false,
                  FOWTeam = TEAM_UNKNOWN,
                  FOWTeamOverrideVar = "TeamID",
                  FOWVisibilityRadius = 10,
                  SendIfOnScreenOrDiscard = true,
                  FollowsGroundTilt = false
                }
              },
              {
                Function = BBSpellBuffRemoveCurrent,
                Params = {TargetVar = "Owner"}
              }
            }
          }
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "TeamID",
      Value2 = TEAM_ORDER,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBForEachUnitInTargetRectangle,
        Params = {
          AttackerVar = "Attacker",
          CenterVar = "CenterPoint",
          HalfWidth = 25,
          HalfLength = 0,
          HalfLengthVar = "HalfDistance",
          Flags = "AffectEnemies AffectFriends AffectNeutral AffectMinions AffectHeroes ",
          IteratorVar = "Unit",
          BuffNameFilter = "KarmaLinkDmgCDOrder",
          InclusiveBuffFilter = false
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "Unit",
              Src2Var = "Owner",
              CompareOp = CO_NOT_EQUAL
            },
            SubBlocks = {
              {
                Function = BBIf,
                Params = {
                  Src1Var = "Unit",
                  Src2Var = "Attacker",
                  CompareOp = CO_NOT_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Unit",
                      AttackerVar = "Attacker",
                      BuffName = "KarmaLinkDmgCDOrder",
                      BuffAddType = BUFF_REPLACE_EXISTING,
                      StacksExclusive = true,
                      BuffType = BUFF_Internal,
                      MaxStack = 1,
                      NumberOfStacks = 1,
                      Duration = 5,
                      BuffVarsTable = "NextBuffVars",
                      TickRate = 0,
                      CanMitigateDuration = false,
                      IsHiddenOnClient = false
                    }
                  },
                  {
                    Function = BBIf,
                    Params = {
                      Src1Var = "MantraBoolean",
                      Src1VarTable = "InstanceVars",
                      Value2 = 1,
                      CompareOp = CO_EQUAL
                    },
                    SubBlocks = {
                      {
                        Function = BBIf,
                        Params = {
                          Src1Var = "Unit",
                          Src2Var = "Attacker",
                          CompareOp = CO_SAME_TEAM
                        },
                        SubBlocks = {
                          {
                            Function = BBIf,
                            Params = {Src1Var = "Unit", CompareOp = CO_IS_TYPE_HERO},
                            SubBlocks = {
                              {
                                Function = BBSetVarInTable,
                                Params = {
                                  DestVar = "MoveSpeedMod",
                                  DestVarTable = "NextBuffVars",
                                  SrcVar = "NegMoveSpeed",
                                  SrcVarTable = "InstanceVars",
                                  SrcValue = 0
                                }
                              },
                              {
                                Function = BBSpellBuffAdd,
                                Params = {
                                  TargetVar = "Unit",
                                  AttackerVar = "Attacker",
                                  BuffName = "KarmaMantraSBHaste",
                                  BuffAddType = BUFF_REPLACE_EXISTING,
                                  StacksExclusive = true,
                                  BuffType = BUFF_CombatEnchancer,
                                  MaxStack = 1,
                                  NumberOfStacks = 1,
                                  Duration = 3,
                                  BuffVarsTable = "NextBuffVars",
                                  TickRate = 0,
                                  CanMitigateDuration = false,
                                  IsHiddenOnClient = false
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
                            Function = BBSpellEffectCreate,
                            Params = {
                              BindObjectVar = "Unit",
                              EffectName = "karma_spiritBond_damage_tar.troy",
                              Flags = 0,
                              EffectIDVar = "hit",
                              TargetObjectVar = "Unit",
                              SpecificUnitOnlyVar = "Owner",
                              SpecificTeamOnly = TEAM_UNKNOWN,
                              UseSpecificUnit = false,
                              FOWTeam = TEAM_UNKNOWN,
                              FOWTeamOverrideVar = "TeamID",
                              FOWVisibilityRadius = 10,
                              SendIfOnScreenOrDiscard = true,
                              FollowsGroundTilt = false
                            }
                          },
                          {
                            Function = BBBreakSpellShields,
                            Params = {TargetVar = "Unit"}
                          },
                          {
                            Function = BBApplyDamage,
                            Params = {
                              AttackerVar = "Attacker",
                              CallForHelpAttackerVar = "Attacker",
                              TargetVar = "Unit",
                              Damage = 0,
                              DamageVar = "DamageToDeal",
                              DamageVarTable = "InstanceVars",
                              DamageType = MAGIC_DAMAGE,
                              SourceDamageType = DAMAGESOURCE_SPELLAOE,
                              PercentOfAttack = 1,
                              SpellDamageRatio = 0.7,
                              PhysicalDamageRatio = 0,
                              IgnoreDamageIncreaseMods = false,
                              IgnoreDamageCrit = false
                            }
                          },
                          {
                            Function = BBIf,
                            Params = {Src1Var = "Unit", CompareOp = CO_IS_TYPE_HERO},
                            SubBlocks = {
                              {
                                Function = BBSetVarInTable,
                                Params = {
                                  DestVar = "MoveSpeedMod",
                                  DestVarTable = "NextBuffVars",
                                  SrcVar = "MoveSpeedMod",
                                  SrcVarTable = "InstanceVars",
                                  SrcValue = 0
                                }
                              },
                              {
                                Function = BBSpellBuffAdd,
                                Params = {
                                  TargetVar = "Unit",
                                  AttackerVar = "Attacker",
                                  BuffName = "KarmaMantraSBSlow",
                                  BuffAddType = BUFF_REPLACE_EXISTING,
                                  StacksExclusive = true,
                                  BuffType = BUFF_Slow,
                                  MaxStack = 1,
                                  NumberOfStacks = 1,
                                  Duration = 3,
                                  BuffVarsTable = "NextBuffVars",
                                  TickRate = 0,
                                  CanMitigateDuration = false,
                                  IsHiddenOnClient = false
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
                        Function = BBIf,
                        Params = {
                          Src1Var = "Unit",
                          Src2Var = "Attacker",
                          CompareOp = CO_SAME_TEAM
                        },
                        SubBlocks = {
                          {
                            Function = BBIf,
                            Params = {Src1Var = "Unit", CompareOp = CO_IS_TYPE_HERO},
                            SubBlocks = {
                              {
                                Function = BBSetVarInTable,
                                Params = {
                                  DestVar = "MoveSpeedMod",
                                  DestVarTable = "NextBuffVars",
                                  SrcVar = "NegMoveSpeed",
                                  SrcVarTable = "InstanceVars",
                                  SrcValue = 0
                                }
                              },
                              {
                                Function = BBSpellBuffAdd,
                                Params = {
                                  TargetVar = "Unit",
                                  AttackerVar = "Attacker",
                                  BuffName = "KarmaMantraSBHaste",
                                  BuffAddType = BUFF_REPLACE_EXISTING,
                                  StacksExclusive = true,
                                  BuffType = BUFF_CombatEnchancer,
                                  MaxStack = 1,
                                  NumberOfStacks = 1,
                                  Duration = 3,
                                  BuffVarsTable = "NextBuffVars",
                                  TickRate = 0,
                                  CanMitigateDuration = false,
                                  IsHiddenOnClient = false
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
                            Function = BBSpellEffectCreate,
                            Params = {
                              BindObjectVar = "Unit",
                              EffectName = "karma_spiritBond_damage_tar.troy",
                              Flags = 0,
                              EffectIDVar = "hit",
                              TargetObjectVar = "Unit",
                              SpecificUnitOnlyVar = "Owner",
                              SpecificTeamOnly = TEAM_UNKNOWN,
                              UseSpecificUnit = false,
                              FOWTeam = TEAM_UNKNOWN,
                              FOWTeamOverrideVar = "TeamID",
                              FOWVisibilityRadius = 10,
                              SendIfOnScreenOrDiscard = true,
                              FollowsGroundTilt = false
                            }
                          },
                          {
                            Function = BBBreakSpellShields,
                            Params = {TargetVar = "Unit"}
                          },
                          {
                            Function = BBApplyDamage,
                            Params = {
                              AttackerVar = "Attacker",
                              CallForHelpAttackerVar = "Attacker",
                              TargetVar = "Unit",
                              Damage = 0,
                              DamageVar = "DamageToDeal",
                              DamageVarTable = "InstanceVars",
                              DamageType = MAGIC_DAMAGE,
                              SourceDamageType = DAMAGESOURCE_SPELLAOE,
                              PercentOfAttack = 1,
                              SpellDamageRatio = 0.7,
                              PhysicalDamageRatio = 0,
                              IgnoreDamageIncreaseMods = false,
                              IgnoreDamageCrit = false
                            }
                          },
                          {
                            Function = BBIf,
                            Params = {Src1Var = "Unit", CompareOp = CO_IS_TYPE_HERO},
                            SubBlocks = {
                              {
                                Function = BBSetVarInTable,
                                Params = {
                                  DestVar = "MoveSpeedMod",
                                  DestVarTable = "NextBuffVars",
                                  SrcVar = "MoveSpeedMod",
                                  SrcVarTable = "InstanceVars",
                                  SrcValue = 0
                                }
                              },
                              {
                                Function = BBSpellBuffAdd,
                                Params = {
                                  TargetVar = "Unit",
                                  AttackerVar = "Attacker",
                                  BuffName = "KarmaMantraSBSlow",
                                  BuffAddType = BUFF_REPLACE_EXISTING,
                                  StacksExclusive = true,
                                  BuffType = BUFF_Slow,
                                  MaxStack = 1,
                                  NumberOfStacks = 1,
                                  Duration = 3,
                                  BuffVarsTable = "NextBuffVars",
                                  TickRate = 0,
                                  CanMitigateDuration = false,
                                  IsHiddenOnClient = false
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
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBForEachUnitInTargetRectangle,
        Params = {
          AttackerVar = "Attacker",
          CenterVar = "CenterPoint",
          HalfWidth = 25,
          HalfLength = 0,
          HalfLengthVar = "HalfDistance",
          Flags = "AffectEnemies AffectFriends AffectNeutral AffectMinions AffectHeroes ",
          IteratorVar = "Unit",
          BuffNameFilter = "KarmaLinkDmgCDChaos",
          InclusiveBuffFilter = false
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "Unit",
              Src2Var = "Attacker",
              CompareOp = CO_NOT_EQUAL
            },
            SubBlocks = {
              {
                Function = BBIf,
                Params = {
                  Src1Var = "Unit",
                  Src2Var = "Owner",
                  CompareOp = CO_NOT_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Unit",
                      AttackerVar = "Attacker",
                      BuffName = "KarmaLinkDmgCDChaos",
                      BuffAddType = BUFF_REPLACE_EXISTING,
                      StacksExclusive = true,
                      BuffType = BUFF_Internal,
                      MaxStack = 1,
                      NumberOfStacks = 1,
                      Duration = 5,
                      BuffVarsTable = "NextBuffVars",
                      TickRate = 0,
                      CanMitigateDuration = false,
                      IsHiddenOnClient = false
                    }
                  },
                  {
                    Function = BBIf,
                    Params = {
                      Src1Var = "MantraBoolean",
                      Src1VarTable = "InstanceVars",
                      Value2 = 1,
                      CompareOp = CO_EQUAL
                    },
                    SubBlocks = {
                      {
                        Function = BBIf,
                        Params = {
                          Src1Var = "Unit",
                          Src2Var = "Attacker",
                          CompareOp = CO_SAME_TEAM
                        },
                        SubBlocks = {
                          {
                            Function = BBIf,
                            Params = {Src1Var = "Unit", CompareOp = CO_IS_TYPE_HERO},
                            SubBlocks = {
                              {
                                Function = BBSetVarInTable,
                                Params = {
                                  DestVar = "MoveSpeedMod",
                                  DestVarTable = "NextBuffVars",
                                  SrcVar = "NegMoveSpeed",
                                  SrcVarTable = "InstanceVars",
                                  SrcValue = 0
                                }
                              },
                              {
                                Function = BBSpellBuffAdd,
                                Params = {
                                  TargetVar = "Unit",
                                  AttackerVar = "Attacker",
                                  BuffName = "KarmaMantraSBHaste",
                                  BuffAddType = BUFF_REPLACE_EXISTING,
                                  StacksExclusive = true,
                                  BuffType = BUFF_CombatEnchancer,
                                  MaxStack = 1,
                                  NumberOfStacks = 1,
                                  Duration = 3,
                                  BuffVarsTable = "NextBuffVars",
                                  TickRate = 0,
                                  CanMitigateDuration = false,
                                  IsHiddenOnClient = false
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
                            Function = BBSpellEffectCreate,
                            Params = {
                              BindObjectVar = "Unit",
                              EffectName = "karma_spiritBond_damage_tar.troy",
                              Flags = 0,
                              EffectIDVar = "hit",
                              TargetObjectVar = "Unit",
                              SpecificUnitOnlyVar = "Owner",
                              SpecificTeamOnly = TEAM_UNKNOWN,
                              UseSpecificUnit = false,
                              FOWTeam = TEAM_UNKNOWN,
                              FOWTeamOverrideVar = "TeamID",
                              FOWVisibilityRadius = 10,
                              SendIfOnScreenOrDiscard = true,
                              FollowsGroundTilt = false
                            }
                          },
                          {
                            Function = BBBreakSpellShields,
                            Params = {TargetVar = "Unit"}
                          },
                          {
                            Function = BBApplyDamage,
                            Params = {
                              AttackerVar = "Attacker",
                              CallForHelpAttackerVar = "Attacker",
                              TargetVar = "Unit",
                              Damage = 0,
                              DamageVar = "DamageToDeal",
                              DamageVarTable = "InstanceVars",
                              DamageType = MAGIC_DAMAGE,
                              SourceDamageType = DAMAGESOURCE_SPELLAOE,
                              PercentOfAttack = 1,
                              SpellDamageRatio = 0.7,
                              PhysicalDamageRatio = 0,
                              IgnoreDamageIncreaseMods = false,
                              IgnoreDamageCrit = false
                            }
                          },
                          {
                            Function = BBIf,
                            Params = {Src1Var = "Unit", CompareOp = CO_IS_TYPE_HERO},
                            SubBlocks = {
                              {
                                Function = BBSetVarInTable,
                                Params = {
                                  DestVar = "MoveSpeedMod",
                                  DestVarTable = "NextBuffVars",
                                  SrcVar = "MoveSpeedMod",
                                  SrcVarTable = "InstanceVars",
                                  SrcValue = 0
                                }
                              },
                              {
                                Function = BBSpellBuffAdd,
                                Params = {
                                  TargetVar = "Unit",
                                  AttackerVar = "Attacker",
                                  BuffName = "KarmaMantraSBSlow",
                                  BuffAddType = BUFF_REPLACE_EXISTING,
                                  StacksExclusive = true,
                                  BuffType = BUFF_Slow,
                                  MaxStack = 1,
                                  NumberOfStacks = 1,
                                  Duration = 3,
                                  BuffVarsTable = "NextBuffVars",
                                  TickRate = 0,
                                  CanMitigateDuration = false,
                                  IsHiddenOnClient = false
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
                        Function = BBIf,
                        Params = {
                          Src1Var = "Unit",
                          Src2Var = "Attacker",
                          CompareOp = CO_SAME_TEAM
                        },
                        SubBlocks = {
                          {
                            Function = BBIf,
                            Params = {Src1Var = "Unit", CompareOp = CO_IS_TYPE_HERO},
                            SubBlocks = {
                              {
                                Function = BBSetVarInTable,
                                Params = {
                                  DestVar = "MoveSpeedMod",
                                  DestVarTable = "NextBuffVars",
                                  SrcVar = "NegMoveSpeed",
                                  SrcVarTable = "InstanceVars",
                                  SrcValue = 0
                                }
                              },
                              {
                                Function = BBSpellBuffAdd,
                                Params = {
                                  TargetVar = "Unit",
                                  AttackerVar = "Attacker",
                                  BuffName = "KarmaMantraSBHaste",
                                  BuffAddType = BUFF_REPLACE_EXISTING,
                                  StacksExclusive = true,
                                  BuffType = BUFF_CombatEnchancer,
                                  MaxStack = 1,
                                  NumberOfStacks = 1,
                                  Duration = 3,
                                  BuffVarsTable = "NextBuffVars",
                                  TickRate = 0,
                                  CanMitigateDuration = false,
                                  IsHiddenOnClient = false
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
                            Function = BBSpellEffectCreate,
                            Params = {
                              BindObjectVar = "Unit",
                              EffectName = "karma_spiritBond_damage_tar.troy",
                              Flags = 0,
                              EffectIDVar = "hit",
                              TargetObjectVar = "Unit",
                              SpecificUnitOnlyVar = "Owner",
                              SpecificTeamOnly = TEAM_UNKNOWN,
                              UseSpecificUnit = false,
                              FOWTeam = TEAM_UNKNOWN,
                              FOWTeamOverrideVar = "TeamID",
                              FOWVisibilityRadius = 10,
                              SendIfOnScreenOrDiscard = true,
                              FollowsGroundTilt = false
                            }
                          },
                          {
                            Function = BBBreakSpellShields,
                            Params = {TargetVar = "Unit"}
                          },
                          {
                            Function = BBApplyDamage,
                            Params = {
                              AttackerVar = "Attacker",
                              CallForHelpAttackerVar = "Attacker",
                              TargetVar = "Unit",
                              Damage = 0,
                              DamageVar = "DamageToDeal",
                              DamageVarTable = "InstanceVars",
                              DamageType = MAGIC_DAMAGE,
                              SourceDamageType = DAMAGESOURCE_SPELLAOE,
                              PercentOfAttack = 1,
                              SpellDamageRatio = 0.7,
                              PhysicalDamageRatio = 0,
                              IgnoreDamageIncreaseMods = false,
                              IgnoreDamageCrit = false
                            }
                          },
                          {
                            Function = BBIf,
                            Params = {Src1Var = "Unit", CompareOp = CO_IS_TYPE_HERO},
                            SubBlocks = {
                              {
                                Function = BBSetVarInTable,
                                Params = {
                                  DestVar = "MoveSpeedMod",
                                  DestVarTable = "NextBuffVars",
                                  SrcVar = "MoveSpeedMod",
                                  SrcVarTable = "InstanceVars",
                                  SrcValue = 0
                                }
                              },
                              {
                                Function = BBSpellBuffAdd,
                                Params = {
                                  TargetVar = "Unit",
                                  AttackerVar = "Attacker",
                                  BuffName = "KarmaMantraSBSlow",
                                  BuffAddType = BUFF_REPLACE_EXISTING,
                                  StacksExclusive = true,
                                  BuffType = BUFF_Slow,
                                  MaxStack = 1,
                                  NumberOfStacks = 1,
                                  Duration = 3,
                                  BuffVarsTable = "NextBuffVars",
                                  TickRate = 0,
                                  CanMitigateDuration = false,
                                  IsHiddenOnClient = false
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
  },
  {
    Function = BBGetStatus,
    Params = {
      TargetVar = "Owner",
      DestVar = "IsStealthed",
      Status = GetStealthed
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "IsStealthed",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "karma_spiritBond_break_overhead.troy",
          Flags = 0,
          EffectIDVar = "DistanceBreak2",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWTeamOverrideVar = "TeamID",
          FOWVisibilityRadius = 10,
          SendIfOnScreenOrDiscard = true,
          FollowsGroundTilt = false
        }
      },
      {
        Function = BBSpellBuffRemoveCurrent,
        Params = {TargetVar = "Owner"}
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
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetTeamID,
        Params = {TargetVar = "Owner", DestVar = "TeamID"}
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "karma_spiritBond_break_overhead.troy",
          Flags = 0,
          EffectIDVar = "DistanceBreak2",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWTeamOverrideVar = "TeamID",
          FOWVisibilityRadius = 10,
          SendIfOnScreenOrDiscard = true,
          FollowsGroundTilt = false
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "CooldownToRestore",
          DestVarTable = "NextBuffVars",
          SrcValueByLevel = {
            7.5,
            7,
            6.5,
            6,
            5.5,
            5
          }
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "ManaToRestore",
          SrcValueByLevel = {
            35,
            37.5,
            40,
            42.5,
            45,
            47.5
          }
        }
      },
      {
        Function = BBIncPAR,
        Params = {
          TargetVar = "Owner",
          Delta = 0,
          PARType = PAR_MANA,
          DeltaVar = "ManaToRestore"
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "KarmaSBStealthBreak",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 0.25,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "MantraBoolean",
          DestVarTable = "NextBuffVars",
          SrcValue = 1
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "DamageToDeal",
          DestVarTable = "NextBuffVars",
          SrcValueByLevel = {
            80,
            125,
            170,
            215,
            260,
            305
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Target",
          Src2Var = "Attacker",
          CompareOp = CO_SAME_TEAM
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "MoveSpeedMod",
              DestVarTable = "NextBuffVars",
              SrcValue = 0,
              SrcValueByLevel = {
                0.2,
                0.24,
                0.28,
                0.32,
                0.36,
                0.4
              }
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Target",
              AttackerVar = "Attacker",
              BuffName = "KarmaSpiritBond",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_CombatEnchancer,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 0,
              BuffVarsTable = "NextBuffVars",
              DurationByLevel = {
                5,
                5,
                5,
                5,
                5,
                5
              },
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Attacker",
              AttackerVar = "Attacker",
              BuffName = "KarmaSpiritBondAllySelfTooltip",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_CombatEnchancer,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 0,
              BuffVarsTable = "NextBuffVars",
              DurationByLevel = {
                5,
                5,
                5,
                5,
                5,
                5
              },
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "MoveSpeedMod",
              DestVarTable = "NextBuffVars",
              SrcValue = 0,
              SrcValueByLevel = {
                -0.2,
                -0.24,
                -0.28,
                -0.32,
                -0.36,
                -0.4
              }
            }
          },
          {
            Function = BBBreakSpellShields,
            Params = {TargetVar = "Target"}
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Target",
              AttackerVar = "Owner",
              BuffName = "KarmaSpiritBondC",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_CombatDehancer,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 0,
              BuffVarsTable = "NextBuffVars",
              DurationByLevel = {
                5,
                5,
                5,
                5,
                5,
                5
              },
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Target",
              BuffName = "KarmaSpiritBondEnemyTooltip",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_CombatEnchancer,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 0,
              BuffVarsTable = "NextBuffVars",
              DurationByLevel = {
                5,
                5,
                5,
                5,
                5,
                5
              },
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Target",
              AttackerVar = "Owner",
              BuffName = "KarmaMantraSBSlow",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Slow,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 5,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
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
      Name = "karma_spiritbond_speed_buf.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "leblanc_shackle_self_idle.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "karma_spiritbond_indicator_target_blank.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "karma_spiritbond_indicator_target_enemy.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "karma_spiritbond_indicator_impact_01.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "karma_spiritbond_ult_beam_teamid_ally_green.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "karma_spiritbond_ult_beam_teamid_enemy_red.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "karmaspiritbondsoundgreen.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "karmaspiritbondsoundred.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "karma_spiritbond_indicator_impact.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "karma_spiritbond_beam_teamid_ally_green.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "karma_spiritbond_beam_teamid_enemy_red.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "karmalinkdmgcdorder"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "karmamantrasbhaste"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "karma_spiritbond_damage_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "karmamantrasbslow"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "karmalinkdmgcdchaos"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "karmaspiritbondenemytooltip"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "karma_spiritbond_break_overhead.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "karmasbstealthbreak"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "karmaspiritbond"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "karmaspiritbondallyselftooltip"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "karmaspiritbondc"
    }
  }
}
