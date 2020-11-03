NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffName = "TalonRakeMissileOne"
SpellDamageRatio = 0.5
TriggersSpellCasts = false
OnBuffDeactivateBuildingBlocks = {
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
    Function = BBGetUnitPosition,
    Params = {UnitVar = "Owner", PositionVar = "OwnerPos"}
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "OwnerPos",
      Range = 3000,
      Flags = "AffectFriends AffectMinions NotAffectSelf AffectUntargetable ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Unit",
          AttackerVar = "Owner",
          BuffName = "TalonRakeMarker"
        },
        SubBlocks = {
          {
            Function = BBGetUnitPosition,
            Params = {UnitVar = "Unit", PositionVar = "UnitPos"}
          },
          {
            Function = BBDistanceBetweenObjects,
            Params = {
              DestVar = "NewDistance",
              ObjectVar1 = "Owner",
              ObjectVar2 = "Unit"
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "NewDistance",
              Value2 = 100,
              CompareOp = CO_GREATER_THAN
            },
            SubBlocks = {
              {
                Function = BBSpellCast,
                Params = {
                  CasterVar = "Owner",
                  TargetVar = "Owner",
                  PosVar = "OwnerPos",
                  OverrideCastPosition = true,
                  OverrideCastPosVar = "UnitPos",
                  SlotNumber = 2,
                  SlotType = ExtraSlots,
                  OverrideForceLevel = 0,
                  OverrideForceLevelVar = "Level",
                  OverrideCoolDownCheck = true,
                  FireWithoutCasting = true,
                  UseAutoAttackSpell = false,
                  ForceCastingOrChannelling = false,
                  UpdateAutoAttackTimer = false
                }
              }
            }
          },
          {
            Function = BBSpellBuffRemove,
            Params = {
              TargetVar = "Unit",
              AttackerVar = "Owner",
              BuffName = "TalonRakeMarker",
              ResetDuration = 0
            }
          },
          {
            Function = BBSetStatus,
            Params = {
              TargetVar = "Unit",
              SrcValue = false,
              Status = SetInvulnerable
            }
          },
          {
            Function = BBSetStatus,
            Params = {
              TargetVar = "Unit",
              SrcValue = true,
              Status = SetTargetable
            }
          },
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Unit",
              CallForHelpAttackerVar = "Attacker",
              TargetVar = "Unit",
              Damage = 50000,
              DamageType = PHYSICAL_DAMAGE,
              SourceDamageType = DAMAGESOURCE_DEFAULT,
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
  },
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
      DestVar = "CooldownVal",
      SrcValueByLevel = {
        14,
        13,
        12,
        11,
        10
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "FlatCDVal", SrcValue = 0}
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetPercentCooldownMod,
      TargetVar = "Owner",
      DestVar = "FlatCD"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "CooldownVal",
      Src2Var = "FlatCD",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "FlatCDVal",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "CooldownVal",
      Src2Var = "FlatCDVal",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "CooldownVal",
      MathOp = MO_ADD
    }
  }
}
BuffOnMissileEndBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "SpellName",
      Value2 = "TalonRakeMissileOne",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetUnitPosition,
        Params = {UnitVar = "Owner", PositionVar = "OwnerPos"}
      },
      {
        Function = BBGetTeamID,
        Params = {
          TargetVar = "Owner",
          DestVar = "TeamOfOwner"
        }
      },
      {
        Function = BBSpawnMinion,
        Params = {
          Name = "HiddenMinion",
          Skin = "TestCube",
          AiScript = "idle.lua",
          PosVar = "MissileEndPosition",
          Team = TEAM_CASTER,
          TeamVar = "TeamOfOwner",
          Stunned = false,
          Rooted = true,
          Silenced = false,
          Invulnerable = false,
          MagicImmune = false,
          IgnoreCollision = true,
          IsWard = false,
          Placemarker = true,
          VisibilitySize = 0,
          DestVar = "Other3",
          GoldRedirectTargetVar = "Owner"
        }
      },
      {
        Function = BBFaceDirection,
        Params = {TargetVar = "Other3", LocationVar = "OwnerPos"}
      },
      {
        Function = BBSetStatus,
        Params = {
          TargetVar = "Other3",
          SrcValue = true,
          Status = SetInvulnerable
        }
      },
      {
        Function = BBSetStatus,
        Params = {
          TargetVar = "Other3",
          SrcValue = false,
          Status = SetTargetable
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "MissileNumber",
          Src1VarTable = "CharVars",
          Src1Value = 0,
          Src2Value = 1,
          DestVar = "MissileNumber",
          DestVarTable = "CharVars",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBGetUnitPosition,
        Params = {UnitVar = "Other3", PositionVar = "UnitPos"}
      },
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
        Function = BBIf,
        Params = {
          Src1Var = "MissileNumber",
          Src1VarTable = "CharVars",
          Value2 = 2,
          CompareOp = CO_GREATER_THAN
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "MissileNumber",
              DestVarTable = "CharVars",
              SrcValue = 0
            }
          },
          {
            Function = BBSpellBuffRemove,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "TalonRakeMissileOne",
              ResetDuration = 0
            }
          }
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Other3",
          AttackerVar = "Owner",
          BuffName = "TalonRakeMarker",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 100000,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      },
      {
        Function = BBDestroyMissile,
        Params = {MissileIDVar = "MISSILEID2", MissileIDVarTable = "CharVars"}
      }
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetBuffCountFromCaster,
    Params = {
      DestVar = "Count",
      TargetVar = "Target",
      CasterVar = "Target",
      BuffName = "TalonRakeMissileOneMarker"
    }
  },
  {
    Function = BBGetTeamID,
    Params = {
      TargetVar = "Owner",
      DestVar = "OwnerTeamID"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Count",
      Value2 = 0,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
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
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Target",
              PosVar = "Target",
              EffectName = "talon_w_tar.troy",
              Flags = 0,
              EffectIDVar = "part",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWTeamOverrideVar = "OwnerTeamID",
              FOWVisibilityRadius = 10,
              SendIfOnScreenOrDiscard = true,
              PersistsThroughReconnect = false,
              BindFlexToOwnerPAR = false,
              FollowsGroundTilt = false,
              FacesTarget = false
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Target",
              AttackerVar = "Target",
              BuffName = "TalonRakeMissileOneMarker",
              BuffAddType = BUFF_STACKS_AND_RENEWS,
              StacksExclusive = true,
              BuffType = BUFF_Internal,
              MaxStack = 9,
              NumberOfStacks = 1,
              Duration = 0.5,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          },
          {
            Function = BBBreakSpellShields,
            Params = {TargetVar = "Target"}
          },
          {
            Function = BBGetStat,
            Params = {
              Stat = GetBaseAttackDamage,
              TargetVar = "Owner",
              DestVar = "BaseDamage"
            }
          },
          {
            Function = BBGetTotalAttackDamage,
            Params = {TargetVar = "Owner", DestVar = "TotalAD"}
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "TotalAD",
              Src2Var = "BaseDamage",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "BaseDamage",
              MathOp = MO_SUBTRACT
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "BaseDamage",
              Src1Value = 0,
              Src2Value = 0.6,
              DestVar = "BaseDamage",
              MathOp = MO_MULTIPLY
            }
          },
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
              DestVar = "BonusDamage",
              SrcValueByLevel = {
                30,
                55,
                80,
                105,
                130
              }
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "BaseDamage",
              Src2Var = "BonusDamage",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "BaseDamage",
              MathOp = MO_ADD
            }
          },
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Owner",
              CallForHelpAttackerVar = "Attacker",
              TargetVar = "Target",
              Damage = 0,
              DamageVar = "BaseDamage",
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
              DestVar = "MoveSpeedMod",
              DestVarTable = "NextBuffVars",
              SrcValueByLevel = {
                -0.2,
                -0.25,
                -0.3,
                -0.35,
                -0.4
              }
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Target",
              AttackerVar = "Attacker",
              BuffName = "TalonSlow",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Slow,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 2,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "Level",
              Value2 = 1,
              CompareOp = CO_GREATER_THAN_OR_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "MovementSpeedMod",
                  DestVarTable = "NextBuffVars",
                  SrcValueByLevel = {
                    -0.15,
                    -0.2,
                    -0.25,
                    -0.3,
                    -0.35
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
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Target",
                  PosVar = "Target",
                  EffectName = "talon_w_tar.troy",
                  Flags = 0,
                  EffectIDVar = "part",
                  TargetObjectVar = "Target",
                  SpecificUnitOnlyVar = "Owner",
                  SpecificTeamOnly = TEAM_UNKNOWN,
                  UseSpecificUnit = false,
                  FOWTeam = TEAM_UNKNOWN,
                  FOWTeamOverrideVar = "OwnerTeamID",
                  FOWVisibilityRadius = 10,
                  SendIfOnScreenOrDiscard = true,
                  PersistsThroughReconnect = false,
                  BindFlexToOwnerPAR = false,
                  FollowsGroundTilt = false,
                  FacesTarget = false
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Target",
                  AttackerVar = "Target",
                  BuffName = "TalonRakeMissileOneMarker",
                  BuffAddType = BUFF_STACKS_AND_RENEWS,
                  StacksExclusive = true,
                  BuffType = BUFF_Internal,
                  MaxStack = 9,
                  NumberOfStacks = 1,
                  Duration = 0.5,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = false
                }
              },
              {
                Function = BBBreakSpellShields,
                Params = {TargetVar = "Target"}
              },
              {
                Function = BBGetStat,
                Params = {
                  Stat = GetBaseAttackDamage,
                  TargetVar = "Owner",
                  DestVar = "BaseDamage"
                }
              },
              {
                Function = BBGetTotalAttackDamage,
                Params = {TargetVar = "Owner", DestVar = "TotalAD"}
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "TotalAD",
                  Src2Var = "BaseDamage",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "BaseDamage",
                  MathOp = MO_SUBTRACT
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "BaseDamage",
                  Src1Value = 0,
                  Src2Value = 0.6,
                  DestVar = "BaseDamage",
                  MathOp = MO_MULTIPLY
                }
              },
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
                  DestVar = "BonusDamage",
                  SrcValueByLevel = {
                    30,
                    55,
                    80,
                    105,
                    130
                  }
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "BaseDamage",
                  Src2Var = "BonusDamage",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "BaseDamage",
                  MathOp = MO_ADD
                }
              },
              {
                Function = BBApplyDamage,
                Params = {
                  AttackerVar = "Owner",
                  CallForHelpAttackerVar = "Attacker",
                  TargetVar = "Target",
                  Damage = 0,
                  DamageVar = "BaseDamage",
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
                  DestVar = "MoveSpeedMod",
                  DestVarTable = "NextBuffVars",
                  SrcValueByLevel = {
                    -0.2,
                    -0.25,
                    -0.3,
                    -0.35,
                    -0.4
                  }
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Target",
                  AttackerVar = "Attacker",
                  BuffName = "TalonSlow",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Slow,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 2,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = false
                }
              },
              {
                Function = BBIf,
                Params = {
                  Src1Var = "Level",
                  Value2 = 1,
                  CompareOp = CO_GREATER_THAN_OR_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBSetVarInTable,
                    Params = {
                      DestVar = "MovementSpeedMod",
                      DestVarTable = "NextBuffVars",
                      SrcValueByLevel = {
                        -0.15,
                        -0.2,
                        -0.25,
                        -0.3,
                        -0.35
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
                    Function = BBSpellEffectCreate,
                    Params = {
                      BindObjectVar = "Target",
                      PosVar = "Target",
                      EffectName = "talon_w_tar.troy",
                      Flags = 0,
                      EffectIDVar = "part",
                      TargetObjectVar = "Target",
                      SpecificUnitOnlyVar = "Owner",
                      SpecificTeamOnly = TEAM_UNKNOWN,
                      UseSpecificUnit = false,
                      FOWTeam = TEAM_UNKNOWN,
                      FOWTeamOverrideVar = "OwnerTeamID",
                      FOWVisibilityRadius = 10,
                      SendIfOnScreenOrDiscard = true,
                      PersistsThroughReconnect = false,
                      BindFlexToOwnerPAR = false,
                      FollowsGroundTilt = false,
                      FacesTarget = false
                    }
                  },
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Target",
                      AttackerVar = "Target",
                      BuffName = "TalonRakeMissileOneMarker",
                      BuffAddType = BUFF_STACKS_AND_RENEWS,
                      StacksExclusive = true,
                      BuffType = BUFF_Internal,
                      MaxStack = 9,
                      NumberOfStacks = 1,
                      Duration = 0.5,
                      BuffVarsTable = "NextBuffVars",
                      TickRate = 0,
                      CanMitigateDuration = false,
                      IsHiddenOnClient = false
                    }
                  },
                  {
                    Function = BBBreakSpellShields,
                    Params = {TargetVar = "Target"}
                  },
                  {
                    Function = BBGetStat,
                    Params = {
                      Stat = GetBaseAttackDamage,
                      TargetVar = "Owner",
                      DestVar = "BaseDamage"
                    }
                  },
                  {
                    Function = BBGetTotalAttackDamage,
                    Params = {TargetVar = "Owner", DestVar = "TotalAD"}
                  },
                  {
                    Function = BBMath,
                    Params = {
                      Src1Var = "TotalAD",
                      Src2Var = "BaseDamage",
                      Src1Value = 0,
                      Src2Value = 0,
                      DestVar = "BaseDamage",
                      MathOp = MO_SUBTRACT
                    }
                  },
                  {
                    Function = BBMath,
                    Params = {
                      Src1Var = "BaseDamage",
                      Src1Value = 0,
                      Src2Value = 0.6,
                      DestVar = "BaseDamage",
                      MathOp = MO_MULTIPLY
                    }
                  },
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
                      DestVar = "BonusDamage",
                      SrcValueByLevel = {
                        30,
                        55,
                        80,
                        105,
                        130
                      }
                    }
                  },
                  {
                    Function = BBMath,
                    Params = {
                      Src1Var = "BaseDamage",
                      Src2Var = "BonusDamage",
                      Src1Value = 0,
                      Src2Value = 0,
                      DestVar = "BaseDamage",
                      MathOp = MO_ADD
                    }
                  },
                  {
                    Function = BBApplyDamage,
                    Params = {
                      AttackerVar = "Owner",
                      CallForHelpAttackerVar = "Attacker",
                      TargetVar = "Target",
                      Damage = 0,
                      DamageVar = "BaseDamage",
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
                      DestVar = "MoveSpeedMod",
                      DestVarTable = "NextBuffVars",
                      SrcValueByLevel = {
                        -0.2,
                        -0.25,
                        -0.3,
                        -0.35,
                        -0.4
                      }
                    }
                  },
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Target",
                      AttackerVar = "Attacker",
                      BuffName = "TalonSlow",
                      BuffAddType = BUFF_REPLACE_EXISTING,
                      StacksExclusive = true,
                      BuffType = BUFF_Slow,
                      MaxStack = 1,
                      NumberOfStacks = 1,
                      Duration = 2,
                      BuffVarsTable = "NextBuffVars",
                      TickRate = 0,
                      CanMitigateDuration = false,
                      IsHiddenOnClient = false
                    }
                  },
                  {
                    Function = BBIf,
                    Params = {
                      Src1Var = "Level",
                      Value2 = 1,
                      CompareOp = CO_GREATER_THAN_OR_EQUAL
                    },
                    SubBlocks = {
                      {
                        Function = BBSetVarInTable,
                        Params = {
                          DestVar = "MovementSpeedMod",
                          DestVarTable = "NextBuffVars",
                          SrcValueByLevel = {
                            -0.15,
                            -0.2,
                            -0.25,
                            -0.3,
                            -0.35
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
BuffOnLaunchMissileBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MISSILEID2",
      DestVarTable = "CharVars",
      SrcVar = "missileId"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "talonrakemarker"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {Name = "testcube"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "talonrakemissileone"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "talonrakemissileonemarker"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "talon_w_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "talonslow"}
  }
}
