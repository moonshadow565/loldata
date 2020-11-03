NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Renekton_SliceAndDice.dds"
BuffName = "RenekthonSliceAndDice"
AutoBuffActivateEffect = "Global_Haste.troy"
AutoBuffActivateAttachBoneName = "lhnd"
AutoBuffActivateEffect2 = "Global_Haste.troy"
AutoBuffActivateAttachBoneName2 = "rhnd"
IsDeathRecapSource = true
BuffOnCollisionBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "Owner",
      Src2Var = "Target",
      CompareOp = CO_DIFFERENT_TEAM
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
        SubBlocks = {
          {
            Function = BBForEachUnitInTargetArea,
            Params = {
              AttackerVar = "Owner",
              CenterVar = "Owner",
              Range = 175,
              Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
              IteratorVar = "Unit",
              BuffNameFilter = "RenektonTargetSliced",
              InclusiveBuffFilter = false
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {DestVar = "ShouldHit", SrcValue = true}
              },
              {
                Function = BBCanSeeTarget,
                Params = {
                  ViewerVar = "Owner",
                  TargetVar = "Unit",
                  ResultVar = "Visible"
                }
              },
              {
                Function = BBIf,
                Params = {
                  Src1Var = "Visible",
                  Value2 = false,
                  CompareOp = CO_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBIf,
                    Params = {Src1Var = "Unit", CompareOp = CO_IS_NOT_HERO},
                    SubBlocks = {
                      {
                        Function = BBSetVarInTable,
                        Params = {DestVar = "ShouldHit", SrcValue = false}
                      }
                    }
                  }
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "HitUnit",
                  DestVarTable = "InstanceVars",
                  SrcValue = true
                }
              },
              {
                Function = BBGetStat,
                Params = {
                  Stat = GetBaseAttackDamage,
                  TargetVar = "Owner",
                  DestVar = "BaseAttack"
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src2Var = "BaseAttack",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "HitDamage",
                  MathOp = MO_MULTIPLY
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "HitDamage",
                  Src2Var = "BonusDamage",
                  Src2VarTable = "InstanceVars",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "HitDamage",
                  MathOp = MO_ADD
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Owner",
                  BuffName = "RenektonTargetSliced",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Internal,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 0.5,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = false
                }
              },
              {
                Function = BBIfHasBuff,
                Params = {
                  OwnerVar = "Owner",
                  AttackerVar = "Owner",
                  BuffName = "RenektonSliceAndDiceDelay"
                }
              },
              {
                Function = BBElseIf,
                Params = {
                  Src1Var = "DiceVersion",
                  Src1VarTable = "InstanceVars",
                  Value2 = true,
                  CompareOp = CO_EQUAL
                }
              },
              {
                Function = BBElseIf,
                Params = {
                  Src1Var = "ShouldHit",
                  Value2 = false,
                  CompareOp = CO_EQUAL
                }
              },
              {
                Function = BBElse,
                Params = {},
                SubBlocks = {
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Owner",
                      AttackerVar = "Owner",
                      BuffName = "RenektonSliceAndDiceDelay",
                      BuffAddType = BUFF_RENEW_EXISTING,
                      StacksExclusive = true,
                      BuffType = BUFF_CombatEnchancer,
                      MaxStack = 1,
                      NumberOfStacks = 1,
                      Duration = 4,
                      BuffVarsTable = "NextBuffVars",
                      TickRate = 0,
                      CanMitigateDuration = false,
                      IsHiddenOnClient = false
                    }
                  },
                  {
                    Function = BBSetSlotSpellCooldownTimeVer2,
                    Params = {
                      Src = 0,
                      SlotNumber = 2,
                      SlotType = SpellSlots,
                      SpellbookType = SPELLBOOK_CHAMPION,
                      OwnerVar = "Owner",
                      BroadcastEvent = false
                    }
                  }
                }
              },
              {
                Function = BBIf,
                Params = {
                  Src1Var = "ShouldHit",
                  Value2 = true,
                  CompareOp = CO_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBGetTeamID,
                    Params = {TargetVar = "Owner", DestVar = "OwnerVar"}
                  },
                  {
                    Function = BBBreakSpellShields,
                    Params = {TargetVar = "Unit"}
                  },
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Unit",
                      AttackerVar = "Owner",
                      BuffName = "RenektonBloodSplatterTarget",
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
                  },
                  {
                    Function = BBIf,
                    Params = {
                      Src1Var = "RageBonus",
                      Src1VarTable = "InstanceVars",
                      Value2 = true,
                      CompareOp = CO_EQUAL
                    },
                    SubBlocks = {
                      {
                        Function = BBSetVarInTable,
                        Params = {
                          DestVar = "ArmorShred",
                          DestVarTable = "NextBuffVars",
                          SrcVar = "ArmorShred",
                          SrcVarTable = "InstanceVars"
                        }
                      },
                      {
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Unit",
                          AttackerVar = "Owner",
                          BuffName = "RenektonSliceAndDiceDebuff",
                          BuffAddType = BUFF_REPLACE_EXISTING,
                          StacksExclusive = true,
                          BuffType = BUFF_CombatDehancer,
                          MaxStack = 1,
                          NumberOfStacks = 1,
                          Duration = 4,
                          BuffVarsTable = "NextBuffVars",
                          TickRate = 0,
                          CanMitigateDuration = false,
                          IsHiddenOnClient = false
                        }
                      },
                      {
                        Function = BBApplyDamage,
                        Params = {
                          AttackerVar = "Owner",
                          CallForHelpAttackerVar = "Owner",
                          TargetVar = "Unit",
                          Damage = 0,
                          DamageVar = "HitDamage",
                          DamageType = PHYSICAL_DAMAGE,
                          SourceDamageType = DAMAGESOURCE_SPELLAOE,
                          PercentOfAttack = 1.5,
                          SpellDamageRatio = 0,
                          PhysicalDamageRatio = 0.9,
                          IgnoreDamageIncreaseMods = false,
                          IgnoreDamageCrit = false
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
                          AttackerVar = "Owner",
                          CallForHelpAttackerVar = "Owner",
                          TargetVar = "Unit",
                          Damage = 0,
                          DamageVar = "HitDamage",
                          DamageType = PHYSICAL_DAMAGE,
                          SourceDamageType = DAMAGESOURCE_SPELLAOE,
                          PercentOfAttack = 1,
                          SpellDamageRatio = 0,
                          PhysicalDamageRatio = 0.9,
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
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBPlayAnimation,
    Params = {
      AnimationName = "Spell3",
      ScaleTime = 0,
      TargetVar = "Owner",
      Loop = true,
      Blend = false,
      Lock = true
    }
  },
  {
    Function = BBStartTrackingCollisions,
    Params = {TargetVar = "Owner", Value = true}
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "DashSpeed",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "TargetPos",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "DiceVersion",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "Distance",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "BonusDamage",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "ShinyParticle",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "ArmorShred",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "TargetPos",
      SrcVar = "TargetPos",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetCanMove
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
    Function = BBMove,
    Params = {
      UnitVar = "Owner",
      TargetVar = "TargetPos",
      Speed = 0,
      SpeedVar = "DashSpeed",
      SpeedVarTable = "InstanceVars",
      Gravity = 0,
      MoveBackBy = 0,
      MovementType = FURTHEST_WITHIN_RANGE,
      MovementOrdersType = CANCEL_ORDER,
      MovementOrdersFacing = FACE_MOVEMENT_DIRECTION,
      IdealDistance = 0,
      IdealDistanceVar = "Distance",
      IdealDistanceVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "HitUnit",
      DestVarTable = "InstanceVars",
      SrcValue = false
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "RageBonus",
      DestVarTable = "InstanceVars",
      SrcValue = false
    }
  },
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "RageAmount",
      OwnerVar = "Owner",
      Function = GetPAR,
      PARType = PAR_OTHER
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "RageAmount",
      Value2 = 50,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "DiceVersion",
          Src1VarTable = "InstanceVars",
          Value2 = true,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "RageBonus",
              DestVarTable = "InstanceVars",
              SrcValue = true
            }
          },
          {
            Function = BBIncPAR,
            Params = {
              TargetVar = "Owner",
              Delta = -50,
              PARType = PAR_OTHER
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Owner",
              EffectName = "RenektonSliceDice_buf_rage.troy",
              Flags = 0,
              EffectIDVar = "ShinyParticle",
              EffectIDVarTable = "InstanceVars",
              BoneName = "lhand",
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
              BindObjectVar = "Owner",
              EffectName = "RenektonSliceDice_buf.troy",
              Flags = 0,
              EffectIDVar = "ShinyParticle",
              EffectIDVarTable = "InstanceVars",
              BoneName = "lhand",
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
          EffectName = "RenektonSliceDice_buf.troy",
          Flags = 0,
          EffectIDVar = "ShinyParticle",
          EffectIDVarTable = "InstanceVars",
          BoneName = "lhand",
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
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      DestVarTable = "InstanceVars",
      SpellSlotValue = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
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
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 175,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      BuffNameFilter = "RenektonTargetSliced",
      InclusiveBuffFilter = false
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "ShouldHit", SrcValue = true}
      },
      {
        Function = BBCanSeeTarget,
        Params = {
          ViewerVar = "Owner",
          TargetVar = "Unit",
          ResultVar = "Visible"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Visible",
          Value2 = false,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {Src1Var = "Unit", CompareOp = CO_IS_NOT_HERO},
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {DestVar = "ShouldHit", SrcValue = false}
              }
            }
          }
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "HitUnit",
          DestVarTable = "InstanceVars",
          SrcValue = true
        }
      },
      {
        Function = BBGetStat,
        Params = {
          Stat = GetBaseAttackDamage,
          TargetVar = "Owner",
          DestVar = "BaseAttack"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "BaseAttack",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "HitDamage",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "HitDamage",
          Src2Var = "BonusDamage",
          Src2VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "HitDamage",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Unit",
          AttackerVar = "Owner",
          BuffName = "RenektonTargetSliced",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 0.5,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      },
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "RenektonSliceAndDiceDelay"
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "DiceVersion",
          Src1VarTable = "InstanceVars",
          Value2 = true,
          CompareOp = CO_EQUAL
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "ShouldHit",
          Value2 = false,
          CompareOp = CO_EQUAL
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "RenektonSliceAndDiceDelay",
              BuffAddType = BUFF_RENEW_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_CombatEnchancer,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 4,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          },
          {
            Function = BBSetSlotSpellCooldownTimeVer2,
            Params = {
              Src = 0,
              SlotNumber = 2,
              SlotType = SpellSlots,
              SpellbookType = SPELLBOOK_CHAMPION,
              OwnerVar = "Owner",
              BroadcastEvent = false
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "ShouldHit",
          Value2 = true,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBGetTeamID,
            Params = {TargetVar = "Owner", DestVar = "OwnerVar"}
          },
          {
            Function = BBBreakSpellShields,
            Params = {TargetVar = "Unit"}
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Unit",
              AttackerVar = "Owner",
              BuffName = "RenektonBloodSplatterTarget",
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
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "RageBonus",
              Src1VarTable = "InstanceVars",
              Value2 = true,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "ArmorShred",
                  DestVarTable = "NextBuffVars",
                  SrcVar = "ArmorShred",
                  SrcVarTable = "InstanceVars"
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Owner",
                  BuffName = "RenektonSliceAndDiceDebuff",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_CombatDehancer,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 4,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = false
                }
              },
              {
                Function = BBApplyDamage,
                Params = {
                  AttackerVar = "Owner",
                  CallForHelpAttackerVar = "Owner",
                  TargetVar = "Unit",
                  Damage = 0,
                  DamageVar = "HitDamage",
                  DamageType = PHYSICAL_DAMAGE,
                  SourceDamageType = DAMAGESOURCE_SPELLAOE,
                  PercentOfAttack = 1.5,
                  SpellDamageRatio = 0,
                  PhysicalDamageRatio = 0.9,
                  IgnoreDamageIncreaseMods = false,
                  IgnoreDamageCrit = false
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
                  AttackerVar = "Owner",
                  CallForHelpAttackerVar = "Owner",
                  TargetVar = "Unit",
                  Damage = 0,
                  DamageVar = "HitDamage",
                  DamageType = PHYSICAL_DAMAGE,
                  SourceDamageType = DAMAGESOURCE_SPELLAOE,
                  PercentOfAttack = 1,
                  SpellDamageRatio = 0,
                  PhysicalDamageRatio = 0.9,
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
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBUnlockAnimation,
    Params = {OwnerVar = "Owner", Blend = true}
  },
  {
    Function = BBStartTrackingCollisions,
    Params = {TargetVar = "Owner", Value = false}
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
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "ShinyParticle",
      EffectIDVarTable = "InstanceVars"
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
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetCanMove
    }
  },
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "RagePercent",
      OwnerVar = "Owner",
      Function = GetPARPercent,
      PARType = PAR_SHIELD
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 175,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      BuffNameFilter = "RenektonTargetSliced",
      InclusiveBuffFilter = false
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "ShouldHit", SrcValue = true}
      },
      {
        Function = BBCanSeeTarget,
        Params = {
          ViewerVar = "Owner",
          TargetVar = "Unit",
          ResultVar = "Visible"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Visible",
          Value2 = false,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {Src1Var = "Unit", CompareOp = CO_IS_NOT_HERO},
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {DestVar = "ShouldHit", SrcValue = false}
              }
            }
          }
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "HitUnit",
          DestVarTable = "InstanceVars",
          SrcValue = true
        }
      },
      {
        Function = BBGetStat,
        Params = {
          Stat = GetBaseAttackDamage,
          TargetVar = "Owner",
          DestVar = "BaseAttack"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "BaseAttack",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "HitDamage",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "HitDamage",
          Src2Var = "BonusDamage",
          Src2VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "HitDamage",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Unit",
          AttackerVar = "Owner",
          BuffName = "RenektonTargetSliced",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 0.5,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      },
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "RenektonSliceAndDiceDelay"
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "DiceVersion",
          Src1VarTable = "InstanceVars",
          Value2 = true,
          CompareOp = CO_EQUAL
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "ShouldHit",
          Value2 = false,
          CompareOp = CO_EQUAL
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "RenektonSliceAndDiceDelay",
              BuffAddType = BUFF_RENEW_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_CombatEnchancer,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 4,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          },
          {
            Function = BBSetSlotSpellCooldownTimeVer2,
            Params = {
              Src = 0,
              SlotNumber = 2,
              SlotType = SpellSlots,
              SpellbookType = SPELLBOOK_CHAMPION,
              OwnerVar = "Owner",
              BroadcastEvent = false
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "ShouldHit",
          Value2 = true,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBGetTeamID,
            Params = {TargetVar = "Owner", DestVar = "OwnerVar"}
          },
          {
            Function = BBBreakSpellShields,
            Params = {TargetVar = "Unit"}
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Unit",
              AttackerVar = "Owner",
              BuffName = "RenektonBloodSplatterTarget",
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
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "RageBonus",
              Src1VarTable = "InstanceVars",
              Value2 = true,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "ArmorShred",
                  DestVarTable = "NextBuffVars",
                  SrcVar = "ArmorShred",
                  SrcVarTable = "InstanceVars"
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Owner",
                  BuffName = "RenektonSliceAndDiceDebuff",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_CombatDehancer,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 4,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = false
                }
              },
              {
                Function = BBApplyDamage,
                Params = {
                  AttackerVar = "Owner",
                  CallForHelpAttackerVar = "Owner",
                  TargetVar = "Unit",
                  Damage = 0,
                  DamageVar = "HitDamage",
                  DamageType = PHYSICAL_DAMAGE,
                  SourceDamageType = DAMAGESOURCE_SPELLAOE,
                  PercentOfAttack = 1.5,
                  SpellDamageRatio = 0,
                  PhysicalDamageRatio = 0.9,
                  IgnoreDamageIncreaseMods = false,
                  IgnoreDamageCrit = false
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
                  AttackerVar = "Owner",
                  CallForHelpAttackerVar = "Owner",
                  TargetVar = "Unit",
                  Damage = 0,
                  DamageVar = "HitDamage",
                  DamageType = PHYSICAL_DAMAGE,
                  SourceDamageType = DAMAGESOURCE_SPELLAOE,
                  PercentOfAttack = 1,
                  SpellDamageRatio = 0,
                  PhysicalDamageRatio = 0.9,
                  IgnoreDamageIncreaseMods = false,
                  IgnoreDamageCrit = false
                }
              }
            }
          }
        }
      }
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 1250,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      BuffNameFilter = "RenektonTargetSliced",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBSpellBuffClear,
        Params = {
          TargetVar = "Unit",
          BuffName = "RenektonTargetSliced"
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "DiceVersion",
      Src1VarTable = "InstanceVars",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellBuffClear,
        Params = {
          TargetVar = "Owner",
          BuffName = "RenektonSliceAndDiceDelay"
        }
      }
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetCanAttack
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
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
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetCanAttack
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 175,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      BuffNameFilter = "RenektonTargetSliced",
      InclusiveBuffFilter = false
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "ShouldHit", SrcValue = true}
      },
      {
        Function = BBCanSeeTarget,
        Params = {
          ViewerVar = "Owner",
          TargetVar = "Unit",
          ResultVar = "Visible"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Visible",
          Value2 = false,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {Src1Var = "Unit", CompareOp = CO_IS_NOT_HERO},
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {DestVar = "ShouldHit", SrcValue = false}
              }
            }
          }
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "HitUnit",
          DestVarTable = "InstanceVars",
          SrcValue = true
        }
      },
      {
        Function = BBGetStat,
        Params = {
          Stat = GetBaseAttackDamage,
          TargetVar = "Owner",
          DestVar = "BaseAttack"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "BaseAttack",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "HitDamage",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "HitDamage",
          Src2Var = "BonusDamage",
          Src2VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "HitDamage",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Unit",
          AttackerVar = "Owner",
          BuffName = "RenektonTargetSliced",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 0.5,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      },
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "RenektonSliceAndDiceDelay"
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "DiceVersion",
          Src1VarTable = "InstanceVars",
          Value2 = true,
          CompareOp = CO_EQUAL
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "ShouldHit",
          Value2 = false,
          CompareOp = CO_EQUAL
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "RenektonSliceAndDiceDelay",
              BuffAddType = BUFF_RENEW_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_CombatEnchancer,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 4,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          },
          {
            Function = BBSetSlotSpellCooldownTimeVer2,
            Params = {
              Src = 0,
              SlotNumber = 2,
              SlotType = SpellSlots,
              SpellbookType = SPELLBOOK_CHAMPION,
              OwnerVar = "Owner",
              BroadcastEvent = false
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "ShouldHit",
          Value2 = true,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBGetTeamID,
            Params = {TargetVar = "Owner", DestVar = "OwnerVar"}
          },
          {
            Function = BBBreakSpellShields,
            Params = {TargetVar = "Unit"}
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Unit",
              AttackerVar = "Owner",
              BuffName = "RenektonBloodSplatterTarget",
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
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "RageBonus",
              Src1VarTable = "InstanceVars",
              Value2 = true,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "ArmorShred",
                  DestVarTable = "NextBuffVars",
                  SrcVar = "ArmorShred",
                  SrcVarTable = "InstanceVars"
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Owner",
                  BuffName = "RenektonSliceAndDiceDebuff",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_CombatDehancer,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 4,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = false
                }
              },
              {
                Function = BBApplyDamage,
                Params = {
                  AttackerVar = "Owner",
                  CallForHelpAttackerVar = "Owner",
                  TargetVar = "Unit",
                  Damage = 0,
                  DamageVar = "HitDamage",
                  DamageType = PHYSICAL_DAMAGE,
                  SourceDamageType = DAMAGESOURCE_SPELLAOE,
                  PercentOfAttack = 1.5,
                  SpellDamageRatio = 0,
                  PhysicalDamageRatio = 0.9,
                  IgnoreDamageIncreaseMods = false,
                  IgnoreDamageCrit = false
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
                  AttackerVar = "Owner",
                  CallForHelpAttackerVar = "Owner",
                  TargetVar = "Unit",
                  Damage = 0,
                  DamageVar = "HitDamage",
                  DamageType = PHYSICAL_DAMAGE,
                  SourceDamageType = DAMAGESOURCE_SPELLAOE,
                  PercentOfAttack = 1,
                  SpellDamageRatio = 0,
                  PhysicalDamageRatio = 0.9,
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
SelfExecuteBuildingBlocks = {
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 1250,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      BuffNameFilter = "RenektonTargetSliced",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBSpellBuffClear,
        Params = {
          TargetVar = "Unit",
          BuffName = "RenektonTargetSliced"
        }
      }
    }
  },
  {
    Function = BBGetCastSpellTargetPos,
    Params = {DestVar = "TargetPos"}
  },
  {
    Function = BBGetUnitPosition,
    Params = {UnitVar = "Owner", PositionVar = "OwnerPos"}
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetMovementSpeed,
      TargetVar = "Owner",
      DestVar = "MoveSpeed"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "MoveSpeed",
      Src1Value = 0,
      Src2Value = 750,
      DestVar = "DashSpeed",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBDistanceBetweenPoints,
    Params = {
      DestVar = "Distance",
      Point1Var = "OwnerPos",
      Point2Var = "TargetPos"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Distance",
      Value2 = 0,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBFaceDirection,
        Params = {TargetVar = "Owner", LocationVar = "TargetPos"}
      },
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "Distance", SrcValue = 450}
      },
      {
        Function = BBGetPointByUnitFacingOffset,
        Params = {
          UnitVar = "Owner",
          Distance = 450,
          OffsetAngle = 0,
          PositionVar = "TargetPos"
        }
      }
    }
  },
  {
    Function = BBIfNotHasBuff,
    Params = {
      OwnerVar = "Owner",
      CasterVar = "Owner",
      BuffName = "RenektonSliceAndDiceDelay"
    },
    SubBlocks = {
      {
        Function = BBGetStat,
        Params = {
          Stat = GetPercentCooldownMod,
          TargetVar = "Owner",
          DestVar = "CooldownMod"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "CooldownMod",
          Src1Value = 1,
          Src2Value = 0,
          DestVar = "Multiplier",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "CooldownTime",
          SrcValueByLevel = {
            20,
            18,
            16,
            14,
            12
          }
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "Multiplier",
          Src2Var = "CooldownTime",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "DebuffTime",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "RenektonSliceAndDiceTimer",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 0,
          BuffVarsTable = "NextBuffVars",
          DurationVar = "DebuffTime",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "DiceVersion",
          DestVarTable = "NextBuffVars",
          SrcValue = false
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
          DestVar = "DiceVersion",
          DestVarTable = "NextBuffVars",
          SrcValue = true
        }
      },
      {
        Function = BBSpellBuffClear,
        Params = {
          TargetVar = "Owner",
          BuffName = "RenektonSliceAndDiceDelay"
        }
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DashSpeed",
      DestVarTable = "NextBuffVars",
      SrcVar = "DashSpeed"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BonusDamage",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        30,
        60,
        90,
        120,
        150
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ArmorShred",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        -0.15,
        -0.175,
        -0.2,
        -0.225,
        -0.25
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Distance",
      DestVarTable = "NextBuffVars",
      SrcVar = "Distance"
    }
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
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Attacker",
      BuffName = "RenektonSliceAndDice",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 2,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0.1,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  }
}
BuffOnMoveEndBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "ShinyParticle",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBStopMove,
    Params = {TargetVar = "Owner"}
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
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetCanAttack
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "RenektonUnlockAnimationAttack",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 0.01,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "RenektonSliceAndDice",
      ResetDuration = 0
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "renektontargetsliced"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "renektonsliceanddicedelay"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "renektonbloodsplattertarget"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "renektonsliceanddicedebuff"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "renektonslicedice_buf_rage.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "renektonslicedice_buf.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "renektonsliceanddicetimer"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "renektonsliceanddice"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "renektonunlockanimationattack"
    }
  }
}
