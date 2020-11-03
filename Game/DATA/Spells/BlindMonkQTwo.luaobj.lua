NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
AutoCooldownByLevel = {
  22,
  18,
  14,
  10,
  6
}
CanCastBuildingBlocks = {
  {
    Function = BBSetReturnValue,
    Params = {SrcValue = false}
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
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
        Function = BBForEachUnitInTargetArea,
        Params = {
          AttackerVar = "Owner",
          CenterVar = "Owner",
          Range = 1250,
          Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
          IteratorVar = "Unit",
          BuffNameFilter = "BlindMonkQOne",
          InclusiveBuffFilter = true
        },
        SubBlocks = {
          {
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Unit",
              AttackerVar = "Owner",
              BuffName = "BlindMonkQOne"
            },
            SubBlocks = {
              {
                Function = BBSetReturnValue,
                Params = {SrcValue = true}
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
        Function = BBForEachUnitInTargetArea,
        Params = {
          AttackerVar = "Owner",
          CenterVar = "Owner",
          Range = 1250,
          Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
          IteratorVar = "Unit",
          BuffNameFilter = "BlindMonkQOneChaos",
          InclusiveBuffFilter = true
        },
        SubBlocks = {
          {
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Unit",
              AttackerVar = "Owner",
              BuffName = "BlindMonkQOneChaos"
            },
            SubBlocks = {
              {
                Function = BBSetReturnValue,
                Params = {SrcValue = true}
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
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
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
        Function = BBForNClosestUnitsInTargetArea,
        Params = {
          AttackerVar = "Owner",
          CenterVar = "Owner",
          Range = 2000,
          Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
          IteratorVar = "Unit",
          MaximumUnitsToPick = 2,
          BuffNameFilter = "BlindMonkQOne",
          InclusiveBuffFilter = true
        },
        SubBlocks = {
          {
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Unit",
              AttackerVar = "Owner",
              BuffName = "BlindMonkQOne"
            },
            SubBlocks = {
              {
                Function = BBSpellBuffRemove,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Owner",
                  BuffName = "BlindMonkQOne",
                  ResetDuration = 0
                }
              },
              {
                Function = BBGetUnitPosition,
                Params = {UnitVar = "Owner", PositionVar = "OwnerPos"}
              },
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Nothing",
                  PosVar = "OwnerPos",
                  EffectName = "blindMonk_Q_resonatingStrike_02.troy",
                  Flags = 0,
                  EffectIDVar = "p3",
                  TargetObjectVar = "Target",
                  SpecificUnitOnlyVar = "Owner",
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
                Function = BBGetUnitPosition,
                Params = {UnitVar = "Unit", PositionVar = "TargetPos"}
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
                  Src2Value = 1350,
                  DestVar = "dashSpeed",
                  MathOp = MO_ADD
                }
              },
              {
                Function = BBDistanceBetweenObjects,
                Params = {
                  DestVar = "Distance",
                  ObjectVar1 = "Owner",
                  ObjectVar2 = "Unit"
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
                  DestVar = "dashSpeed",
                  DestVarTable = "NextBuffVars",
                  SrcVar = "dashSpeed"
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "BaseDamage",
                  SrcValueByLevel = {
                    50,
                    80,
                    110,
                    140,
                    170
                  }
                }
              },
              {
                Function = BBGetStat,
                Params = {
                  Stat = GetFlatPhysicalDamageMod,
                  TargetVar = "Owner",
                  DestVar = "BonusAD"
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "BaseDamage",
                  Src2Var = "BonusAD",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "DamageVar",
                  MathOp = MO_ADD
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "DamageVar",
                  DestVarTable = "NextBuffVars",
                  SrcVar = "DamageVar"
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Unit",
                  BuffName = "BlindMonkQTwoDash",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_CombatEnchancer,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 2.5,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = true
                }
              },
              {
                Function = BBSpellBuffClear,
                Params = {
                  TargetVar = "Owner",
                  BuffName = "BlindMonkQManager"
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
        Function = BBForNClosestUnitsInTargetArea,
        Params = {
          AttackerVar = "Owner",
          CenterVar = "Owner",
          Range = 2000,
          Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
          IteratorVar = "Unit",
          MaximumUnitsToPick = 2,
          BuffNameFilter = "BlindMonkQOneChaos",
          InclusiveBuffFilter = true
        },
        SubBlocks = {
          {
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Unit",
              AttackerVar = "Owner",
              BuffName = "BlindMonkQOneChaos"
            },
            SubBlocks = {
              {
                Function = BBSpellBuffRemove,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Owner",
                  BuffName = "BlindMonkQOneChaos",
                  ResetDuration = 0
                }
              },
              {
                Function = BBGetUnitPosition,
                Params = {UnitVar = "Owner", PositionVar = "OwnerPos"}
              },
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Nothing",
                  PosVar = "OwnerPos",
                  EffectName = "blindMonk_Q_resonatingStrike_02.troy",
                  Flags = 0,
                  EffectIDVar = "p3",
                  TargetObjectVar = "Target",
                  SpecificUnitOnlyVar = "Owner",
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
                Function = BBGetUnitPosition,
                Params = {UnitVar = "Unit", PositionVar = "TargetPos"}
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
                  Src2Value = 1350,
                  DestVar = "dashSpeed",
                  MathOp = MO_ADD
                }
              },
              {
                Function = BBDistanceBetweenObjects,
                Params = {
                  DestVar = "Distance",
                  ObjectVar1 = "Owner",
                  ObjectVar2 = "Unit"
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
                  DestVar = "dashSpeed",
                  DestVarTable = "NextBuffVars",
                  SrcVar = "dashSpeed"
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "BaseDamage",
                  SrcValueByLevel = {
                    50,
                    80,
                    110,
                    140,
                    170
                  }
                }
              },
              {
                Function = BBGetStat,
                Params = {
                  Stat = GetFlatPhysicalDamageMod,
                  TargetVar = "Owner",
                  DestVar = "BonusAD"
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "BaseDamage",
                  Src2Var = "BonusAD",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "DamageVar",
                  MathOp = MO_ADD
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "DamageVar",
                  DestVarTable = "NextBuffVars",
                  SrcVar = "DamageVar"
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Unit",
                  BuffName = "BlindMonkQTwoDash",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_CombatEnchancer,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 2.5,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = true
                }
              },
              {
                Function = BBSpellBuffClear,
                Params = {
                  TargetVar = "Owner",
                  BuffName = "BlindMonkQManager"
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
    Function = BBPreloadSpell,
    Params = {
      Name = "blindmonkqone"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "blindmonkqonechaos"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "blindmonk_q_resonatingstrike_02.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "blindmonkqtwodash"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "blindmonkqmanager"
    }
  }
}
