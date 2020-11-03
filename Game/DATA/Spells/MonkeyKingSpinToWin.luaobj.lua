NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
BuffTextureName = "MonkeyKingCyclone.dds"
BuffName = "MonkeyKingSpinToWin"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
TriggersSpellCasts = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "SpellCooldown",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "BaseDamage",
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
    Function = BBPlayAnimation,
    Params = {
      AnimationName = "Spell4",
      ScaleTime = 0,
      TargetVar = "Owner",
      Loop = true,
      Blend = true,
      Lock = true
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "monkey_king_ult_spin.troy",
      Flags = 0,
      EffectIDVar = "Particle2",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Nothing",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "garen_weapon_glow_01.troy",
      Flags = 0,
      EffectIDVar = "ParticleID",
      EffectIDVarTable = "InstanceVars",
      BoneName = "BUFFBONE_GLB_WEAPON_1",
      TargetObjectVar = "Owner",
      TargetBoneName = "BUFFBONE_WEAPON_3",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetGhosted
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
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = true
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 1,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = true
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = true
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "MonkeyKingDecoyStealth"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "MonkeyKingDecoyStealth",
          ResetDuration = 0
        }
      }
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetGhosted
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetCanAttack
    }
  },
  {
    Function = BBStopCurrentOverrideAnimation,
    Params = {
      AnimationName = "Spell4",
      TargetVar = "Owner",
      Blend = true
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "Particle2",
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
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = false
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 1,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = false
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = false
    }
  },
  {
    Function = BBSetSpell,
    Params = {
      SlotNumber = 3,
      SlotType = SpellSlots,
      SlotBook = SPELLBOOK_CHAMPION,
      SpellName = "MonkeyKingSpinToWin",
      TargetVar = "Owner"
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetPercentCooldownMod,
      TargetVar = "Owner",
      DestVar = "CooldownStat"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "CooldownStat",
      Src1Value = 1,
      Src2Value = 0,
      DestVar = "Multiplier",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Multiplier",
      Src2Var = "SpellCooldown",
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "NewCooldown",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetSlotSpellCooldownTimeVer2,
    Params = {
      Src = 0,
      SrcVar = "NewCooldown",
      SlotNumber = 3,
      SlotType = SpellSlots,
      SpellbookType = SPELLBOOK_CHAMPION,
      OwnerVar = "Owner",
      BroadcastEvent = false
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMovementSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "MoveSpeedMod",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 0.5,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = true
    },
    SubBlocks = {
      {
        Function = BBGetTeamID,
        Params = {TargetVar = "Owner", DestVar = "TeamID"}
      },
      {
        Function = BBGetTotalAttackDamage,
        Params = {
          TargetVar = "Owner",
          DestVar = "TotalAttackDamage"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "TotalAttackDamage",
          Src1Value = 0,
          Src2Value = 1,
          DestVar = "TotalAttackDamage",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "BaseDamage",
          Src1VarTable = "InstanceVars",
          Src2Var = "TotalAttackDamage",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "DamagePerSecond",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "DamagePerSecond",
          Src1Value = 0,
          Src2Value = 0.5,
          DestVar = "DamageToDeal",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "MoveSpeedMod",
          Src1VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 0.05,
          DestVar = "MoveSpeedMod",
          DestVarTable = "InstanceVars",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBForEachUnitInTargetArea,
        Params = {
          AttackerVar = "Owner",
          CenterVar = "Owner",
          Range = 315,
          Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
          IteratorVar = "Unit",
          InclusiveBuffFilter = true
        },
        SubBlocks = {
          {
            Function = BBGetStatus,
            Params = {
              TargetVar = "Unit",
              DestVar = "IsStealthed",
              Status = GetStealthed
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
                Function = BBIf,
                Params = {
                  Src1Var = "IsStealthed",
                  Value2 = false,
                  CompareOp = CO_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBSpellEffectCreate,
                    Params = {
                      BindObjectVar = "Unit",
                      EffectName = "monkey_king_ult_unit_tar.troy",
                      Flags = 0,
                      EffectIDVar = "SamPH",
                      TargetObjectVar = "Unit",
                      SpecificUnitOnlyVar = "Owner",
                      SpecificTeamOnly = TEAM_UNKNOWN,
                      UseSpecificUnit = false,
                      FOWTeam = TEAM_UNKNOWN,
                      FOWTeamOverrideVar = "TeamID",
                      FOWVisibilityRadius = 10,
                      SendIfOnScreenOrDiscard = true,
                      FollowsGroundTilt = false,
                      FacesTarget = false
                    }
                  },
                  {
                    Function = BBApplyDamage,
                    Params = {
                      AttackerVar = "Attacker",
                      CallForHelpAttackerVar = "Attacker",
                      TargetVar = "Unit",
                      Damage = 0,
                      DamageVar = "DamageToDeal",
                      DamageType = PHYSICAL_DAMAGE,
                      SourceDamageType = DAMAGESOURCE_SPELLAOE,
                      PercentOfAttack = 1,
                      SpellDamageRatio = 0,
                      PhysicalDamageRatio = 0,
                      IgnoreDamageIncreaseMods = false,
                      IgnoreDamageCrit = false
                    }
                  },
                  {
                    Function = BBIfNotHasBuff,
                    Params = {
                      OwnerVar = "Unit",
                      CasterVar = "Unit",
                      BuffName = "MonkeyKingSpinMarkerOrder"
                    },
                    SubBlocks = {
                      {
                        Function = BBIfNotHasBuff,
                        Params = {
                          OwnerVar = "Unit",
                          CasterVar = "Unit",
                          BuffName = "MonkeyKingSpinMarkerChaos"
                        },
                        SubBlocks = {
                          {
                            Function = BBSpellBuffAdd,
                            Params = {
                              TargetVar = "Unit",
                              AttackerVar = "Unit",
                              BuffName = "MonkeyKingSpinMarkerOrder",
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
                            Function = BBBreakSpellShields,
                            Params = {TargetVar = "Unit"}
                          },
                          {
                            Function = BBSpellEffectCreate,
                            Params = {
                              BindObjectVar = "Unit",
                              EffectName = "monkey_king_ult_unit_tar_02.troy",
                              Flags = 0,
                              EffectIDVar = "PH",
                              TargetObjectVar = "Unit",
                              SpecificUnitOnlyVar = "Owner",
                              SpecificTeamOnly = TEAM_UNKNOWN,
                              UseSpecificUnit = false,
                              FOWTeam = TEAM_UNKNOWN,
                              FOWTeamOverrideVar = "TeamID",
                              FOWVisibilityRadius = 10,
                              SendIfOnScreenOrDiscard = true,
                              FollowsGroundTilt = false,
                              FacesTarget = false
                            }
                          },
                          {
                            Function = BBSpellBuffAdd,
                            Params = {
                              TargetVar = "Unit",
                              AttackerVar = "Attacker",
                              BuffName = "MonkeyKingSpinKnockup",
                              BuffAddType = BUFF_RENEW_EXISTING,
                              StacksExclusive = true,
                              BuffType = BUFF_Stun,
                              MaxStack = 1,
                              NumberOfStacks = 1,
                              Duration = 1,
                              BuffVarsTable = "NextBuffVars",
                              TickRate = 0,
                              CanMitigateDuration = false,
                              IsHiddenOnClient = true
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
                    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_HERO},
                    SubBlocks = {
                      {
                        Function = BBApplyDamage,
                        Params = {
                          AttackerVar = "Attacker",
                          CallForHelpAttackerVar = "Attacker",
                          TargetVar = "Unit",
                          Damage = 0,
                          DamageVar = "DamageToDeal",
                          DamageType = PHYSICAL_DAMAGE,
                          SourceDamageType = DAMAGESOURCE_SPELLAOE,
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
                          EffectName = "monkey_king_ult_unit_tar.troy",
                          Flags = 0,
                          EffectIDVar = "SamPH",
                          TargetObjectVar = "Unit",
                          SpecificUnitOnlyVar = "Owner",
                          SpecificTeamOnly = TEAM_UNKNOWN,
                          UseSpecificUnit = false,
                          FOWTeam = TEAM_UNKNOWN,
                          FOWTeamOverrideVar = "TeamID",
                          FOWVisibilityRadius = 10,
                          SendIfOnScreenOrDiscard = true,
                          FollowsGroundTilt = false,
                          FacesTarget = false
                        }
                      },
                      {
                        Function = BBIfNotHasBuff,
                        Params = {
                          OwnerVar = "Unit",
                          CasterVar = "Unit",
                          BuffName = "MonkeyKingSpinMarkerOrder"
                        },
                        SubBlocks = {
                          {
                            Function = BBIfNotHasBuff,
                            Params = {
                              OwnerVar = "Unit",
                              CasterVar = "Unit",
                              BuffName = "MonkeyKingSpinMarkerChaos"
                            },
                            SubBlocks = {
                              {
                                Function = BBSpellBuffAdd,
                                Params = {
                                  TargetVar = "Unit",
                                  AttackerVar = "Unit",
                                  BuffName = "MonkeyKingSpinMarkerOrder",
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
                                Function = BBBreakSpellShields,
                                Params = {TargetVar = "Unit"}
                              },
                              {
                                Function = BBSpellEffectCreate,
                                Params = {
                                  BindObjectVar = "Unit",
                                  EffectName = "monkey_king_ult_unit_tar_02.troy",
                                  Flags = 0,
                                  EffectIDVar = "PH",
                                  TargetObjectVar = "Unit",
                                  SpecificUnitOnlyVar = "Owner",
                                  SpecificTeamOnly = TEAM_UNKNOWN,
                                  UseSpecificUnit = false,
                                  FOWTeam = TEAM_UNKNOWN,
                                  FOWTeamOverrideVar = "TeamID",
                                  FOWVisibilityRadius = 10,
                                  SendIfOnScreenOrDiscard = true,
                                  FollowsGroundTilt = false,
                                  FacesTarget = false
                                }
                              },
                              {
                                Function = BBSpellBuffAdd,
                                Params = {
                                  TargetVar = "Unit",
                                  AttackerVar = "Attacker",
                                  BuffName = "MonkeyKingSpinKnockup",
                                  BuffAddType = BUFF_RENEW_EXISTING,
                                  StacksExclusive = true,
                                  BuffType = BUFF_Stun,
                                  MaxStack = 1,
                                  NumberOfStacks = 1,
                                  Duration = 1,
                                  BuffVarsTable = "NextBuffVars",
                                  TickRate = 0,
                                  CanMitigateDuration = false,
                                  IsHiddenOnClient = true
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
                            Function = BBApplyDamage,
                            Params = {
                              AttackerVar = "Attacker",
                              CallForHelpAttackerVar = "Attacker",
                              TargetVar = "Unit",
                              Damage = 0,
                              DamageVar = "DamageToDeal",
                              DamageType = PHYSICAL_DAMAGE,
                              SourceDamageType = DAMAGESOURCE_SPELLAOE,
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
                              EffectName = "monkey_king_ult_unit_tar.troy",
                              Flags = 0,
                              EffectIDVar = "SamPH",
                              TargetObjectVar = "Unit",
                              SpecificUnitOnlyVar = "Owner",
                              SpecificTeamOnly = TEAM_UNKNOWN,
                              UseSpecificUnit = false,
                              FOWTeam = TEAM_UNKNOWN,
                              FOWTeamOverrideVar = "TeamID",
                              FOWVisibilityRadius = 10,
                              SendIfOnScreenOrDiscard = true,
                              FollowsGroundTilt = false,
                              FacesTarget = false
                            }
                          },
                          {
                            Function = BBIfNotHasBuff,
                            Params = {
                              OwnerVar = "Unit",
                              CasterVar = "Unit",
                              BuffName = "MonkeyKingSpinMarkerOrder"
                            },
                            SubBlocks = {
                              {
                                Function = BBIfNotHasBuff,
                                Params = {
                                  OwnerVar = "Unit",
                                  CasterVar = "Unit",
                                  BuffName = "MonkeyKingSpinMarkerChaos"
                                },
                                SubBlocks = {
                                  {
                                    Function = BBSpellBuffAdd,
                                    Params = {
                                      TargetVar = "Unit",
                                      AttackerVar = "Unit",
                                      BuffName = "MonkeyKingSpinMarkerOrder",
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
                                    Function = BBBreakSpellShields,
                                    Params = {TargetVar = "Unit"}
                                  },
                                  {
                                    Function = BBSpellEffectCreate,
                                    Params = {
                                      BindObjectVar = "Unit",
                                      EffectName = "monkey_king_ult_unit_tar_02.troy",
                                      Flags = 0,
                                      EffectIDVar = "PH",
                                      TargetObjectVar = "Unit",
                                      SpecificUnitOnlyVar = "Owner",
                                      SpecificTeamOnly = TEAM_UNKNOWN,
                                      UseSpecificUnit = false,
                                      FOWTeam = TEAM_UNKNOWN,
                                      FOWTeamOverrideVar = "TeamID",
                                      FOWVisibilityRadius = 10,
                                      SendIfOnScreenOrDiscard = true,
                                      FollowsGroundTilt = false,
                                      FacesTarget = false
                                    }
                                  },
                                  {
                                    Function = BBSpellBuffAdd,
                                    Params = {
                                      TargetVar = "Unit",
                                      AttackerVar = "Attacker",
                                      BuffName = "MonkeyKingSpinKnockup",
                                      BuffAddType = BUFF_RENEW_EXISTING,
                                      StacksExclusive = true,
                                      BuffType = BUFF_Stun,
                                      MaxStack = 1,
                                      NumberOfStacks = 1,
                                      Duration = 1,
                                      BuffVarsTable = "NextBuffVars",
                                      TickRate = 0,
                                      CanMitigateDuration = false,
                                      IsHiddenOnClient = true
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
                Function = BBIf,
                Params = {
                  Src1Var = "IsStealthed",
                  Value2 = false,
                  CompareOp = CO_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBSpellEffectCreate,
                    Params = {
                      BindObjectVar = "Unit",
                      EffectName = "monkey_king_ult_unit_tar.troy",
                      Flags = 0,
                      EffectIDVar = "SamPH",
                      TargetObjectVar = "Unit",
                      SpecificUnitOnlyVar = "Owner",
                      SpecificTeamOnly = TEAM_UNKNOWN,
                      UseSpecificUnit = false,
                      FOWTeam = TEAM_UNKNOWN,
                      FOWTeamOverrideVar = "TeamID",
                      FOWVisibilityRadius = 10,
                      SendIfOnScreenOrDiscard = true,
                      FollowsGroundTilt = false,
                      FacesTarget = false
                    }
                  },
                  {
                    Function = BBApplyDamage,
                    Params = {
                      AttackerVar = "Attacker",
                      CallForHelpAttackerVar = "Attacker",
                      TargetVar = "Unit",
                      Damage = 0,
                      DamageVar = "DamageToDeal",
                      DamageType = PHYSICAL_DAMAGE,
                      SourceDamageType = DAMAGESOURCE_SPELLAOE,
                      PercentOfAttack = 1,
                      SpellDamageRatio = 0,
                      PhysicalDamageRatio = 0,
                      IgnoreDamageIncreaseMods = false,
                      IgnoreDamageCrit = false
                    }
                  },
                  {
                    Function = BBIfNotHasBuff,
                    Params = {
                      OwnerVar = "Unit",
                      CasterVar = "Unit",
                      BuffName = "MonkeyKingSpinMarkerChaos"
                    },
                    SubBlocks = {
                      {
                        Function = BBIfNotHasBuff,
                        Params = {
                          OwnerVar = "Unit",
                          CasterVar = "Unit",
                          BuffName = "MonkeyKingSpinMarkerOrder"
                        },
                        SubBlocks = {
                          {
                            Function = BBSpellBuffAdd,
                            Params = {
                              TargetVar = "Unit",
                              AttackerVar = "Unit",
                              BuffName = "MonkeyKingSpinMarkerChaos",
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
                            Function = BBBreakSpellShields,
                            Params = {TargetVar = "Unit"}
                          },
                          {
                            Function = BBSpellEffectCreate,
                            Params = {
                              BindObjectVar = "Unit",
                              EffectName = "monkey_king_ult_unit_tar_02.troy",
                              Flags = 0,
                              EffectIDVar = "PH",
                              TargetObjectVar = "Unit",
                              SpecificUnitOnlyVar = "Owner",
                              SpecificTeamOnly = TEAM_UNKNOWN,
                              UseSpecificUnit = false,
                              FOWTeam = TEAM_UNKNOWN,
                              FOWTeamOverrideVar = "TeamID",
                              FOWVisibilityRadius = 10,
                              SendIfOnScreenOrDiscard = true,
                              FollowsGroundTilt = false,
                              FacesTarget = false
                            }
                          },
                          {
                            Function = BBSpellBuffAdd,
                            Params = {
                              TargetVar = "Unit",
                              AttackerVar = "Attacker",
                              BuffName = "MonkeyKingSpinKnockup",
                              BuffAddType = BUFF_RENEW_EXISTING,
                              StacksExclusive = true,
                              BuffType = BUFF_Stun,
                              MaxStack = 1,
                              NumberOfStacks = 1,
                              Duration = 1,
                              BuffVarsTable = "NextBuffVars",
                              TickRate = 0,
                              CanMitigateDuration = false,
                              IsHiddenOnClient = true
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
                    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_HERO},
                    SubBlocks = {
                      {
                        Function = BBApplyDamage,
                        Params = {
                          AttackerVar = "Attacker",
                          CallForHelpAttackerVar = "Attacker",
                          TargetVar = "Unit",
                          Damage = 0,
                          DamageVar = "DamageToDeal",
                          DamageType = PHYSICAL_DAMAGE,
                          SourceDamageType = DAMAGESOURCE_SPELLAOE,
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
                          EffectName = "monkey_king_ult_unit_tar.troy",
                          Flags = 0,
                          EffectIDVar = "SamPH",
                          TargetObjectVar = "Unit",
                          SpecificUnitOnlyVar = "Owner",
                          SpecificTeamOnly = TEAM_UNKNOWN,
                          UseSpecificUnit = false,
                          FOWTeam = TEAM_UNKNOWN,
                          FOWTeamOverrideVar = "TeamID",
                          FOWVisibilityRadius = 10,
                          SendIfOnScreenOrDiscard = true,
                          FollowsGroundTilt = false,
                          FacesTarget = false
                        }
                      },
                      {
                        Function = BBIfNotHasBuff,
                        Params = {
                          OwnerVar = "Unit",
                          CasterVar = "Unit",
                          BuffName = "MonkeyKingSpinMarkerChaos"
                        },
                        SubBlocks = {
                          {
                            Function = BBIfNotHasBuff,
                            Params = {
                              OwnerVar = "Unit",
                              CasterVar = "Unit",
                              BuffName = "MonkeyKingSpinMarkerOrder"
                            },
                            SubBlocks = {
                              {
                                Function = BBSpellBuffAdd,
                                Params = {
                                  TargetVar = "Unit",
                                  AttackerVar = "Unit",
                                  BuffName = "MonkeyKingSpinMarkerChaos",
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
                                Function = BBBreakSpellShields,
                                Params = {TargetVar = "Unit"}
                              },
                              {
                                Function = BBSpellEffectCreate,
                                Params = {
                                  BindObjectVar = "Unit",
                                  EffectName = "monkey_king_ult_unit_tar_02.troy",
                                  Flags = 0,
                                  EffectIDVar = "PH",
                                  TargetObjectVar = "Unit",
                                  SpecificUnitOnlyVar = "Owner",
                                  SpecificTeamOnly = TEAM_UNKNOWN,
                                  UseSpecificUnit = false,
                                  FOWTeam = TEAM_UNKNOWN,
                                  FOWTeamOverrideVar = "TeamID",
                                  FOWVisibilityRadius = 10,
                                  SendIfOnScreenOrDiscard = true,
                                  FollowsGroundTilt = false,
                                  FacesTarget = false
                                }
                              },
                              {
                                Function = BBSpellBuffAdd,
                                Params = {
                                  TargetVar = "Unit",
                                  AttackerVar = "Attacker",
                                  BuffName = "MonkeyKingSpinKnockup",
                                  BuffAddType = BUFF_RENEW_EXISTING,
                                  StacksExclusive = true,
                                  BuffType = BUFF_Stun,
                                  MaxStack = 1,
                                  NumberOfStacks = 1,
                                  Duration = 1,
                                  BuffVarsTable = "NextBuffVars",
                                  TickRate = 0,
                                  CanMitigateDuration = false,
                                  IsHiddenOnClient = true
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
                            Function = BBApplyDamage,
                            Params = {
                              AttackerVar = "Attacker",
                              CallForHelpAttackerVar = "Attacker",
                              TargetVar = "Unit",
                              Damage = 0,
                              DamageVar = "DamageToDeal",
                              DamageType = PHYSICAL_DAMAGE,
                              SourceDamageType = DAMAGESOURCE_SPELLAOE,
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
                              EffectName = "monkey_king_ult_unit_tar.troy",
                              Flags = 0,
                              EffectIDVar = "SamPH",
                              TargetObjectVar = "Unit",
                              SpecificUnitOnlyVar = "Owner",
                              SpecificTeamOnly = TEAM_UNKNOWN,
                              UseSpecificUnit = false,
                              FOWTeam = TEAM_UNKNOWN,
                              FOWTeamOverrideVar = "TeamID",
                              FOWVisibilityRadius = 10,
                              SendIfOnScreenOrDiscard = true,
                              FollowsGroundTilt = false,
                              FacesTarget = false
                            }
                          },
                          {
                            Function = BBIfNotHasBuff,
                            Params = {
                              OwnerVar = "Unit",
                              CasterVar = "Unit",
                              BuffName = "MonkeyKingSpinMarkerChaos"
                            },
                            SubBlocks = {
                              {
                                Function = BBIfNotHasBuff,
                                Params = {
                                  OwnerVar = "Unit",
                                  CasterVar = "Unit",
                                  BuffName = "MonkeyKingSpinMarkerOrder"
                                },
                                SubBlocks = {
                                  {
                                    Function = BBSpellBuffAdd,
                                    Params = {
                                      TargetVar = "Unit",
                                      AttackerVar = "Unit",
                                      BuffName = "MonkeyKingSpinMarkerChaos",
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
                                    Function = BBBreakSpellShields,
                                    Params = {TargetVar = "Unit"}
                                  },
                                  {
                                    Function = BBSpellEffectCreate,
                                    Params = {
                                      BindObjectVar = "Unit",
                                      EffectName = "monkey_king_ult_unit_tar_02.troy",
                                      Flags = 0,
                                      EffectIDVar = "PH",
                                      TargetObjectVar = "Unit",
                                      SpecificUnitOnlyVar = "Owner",
                                      SpecificTeamOnly = TEAM_UNKNOWN,
                                      UseSpecificUnit = false,
                                      FOWTeam = TEAM_UNKNOWN,
                                      FOWTeamOverrideVar = "TeamID",
                                      FOWVisibilityRadius = 10,
                                      SendIfOnScreenOrDiscard = true,
                                      FollowsGroundTilt = false,
                                      FacesTarget = false
                                    }
                                  },
                                  {
                                    Function = BBSpellBuffAdd,
                                    Params = {
                                      TargetVar = "Unit",
                                      AttackerVar = "Attacker",
                                      BuffName = "MonkeyKingSpinKnockup",
                                      BuffAddType = BUFF_RENEW_EXISTING,
                                      StacksExclusive = true,
                                      BuffType = BUFF_Stun,
                                      MaxStack = 1,
                                      NumberOfStacks = 1,
                                      Duration = 1,
                                      BuffVarsTable = "NextBuffVars",
                                      TickRate = 0,
                                      CanMitigateDuration = false,
                                      IsHiddenOnClient = true
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
SelfExecuteBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "SpellCooldown",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        120,
        105,
        90,
        90,
        90
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BaseDamage",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        20,
        110,
        200,
        0,
        0
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MoveSpeedMod",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        0.015,
        0.015,
        0.015,
        0.015,
        0.015
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Attacker",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 0,
      BuffVarsTable = "NextBuffVars",
      DurationByLevel = {
        4,
        4,
        4
      },
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBSetSpell,
    Params = {
      SlotNumber = 3,
      SlotType = SpellSlots,
      SlotBook = SPELLBOOK_CHAMPION,
      SpellName = "MonkeyKingSpinToWinLeave",
      TargetVar = "Owner"
    }
  },
  {
    Function = BBSetSlotSpellCooldownTimeVer2,
    Params = {
      Src = 0.5,
      SlotNumber = 3,
      SlotType = SpellSlots,
      SpellbookType = SPELLBOOK_CHAMPION,
      OwnerVar = "Owner",
      BroadcastEvent = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "monkey_king_ult_spin.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "garen_weapon_glow_01.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "monkeykingdecoystealth"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "monkeykingspintowin"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "monkey_king_ult_unit_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "monkeykingspinmarkerorder"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "monkeykingspinmarkerchaos"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "monkey_king_ult_unit_tar_02.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "monkeykingspinknockup"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "monkeykingspintowinleave"
    }
  }
}
