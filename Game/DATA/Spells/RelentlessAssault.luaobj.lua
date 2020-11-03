NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "Armsmaster_CoupDeGrace.dds"
BuffName = "Relentless Assault"
SpellToggleSlot = 4
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "LastHitTime",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "NumSwings",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "NumSwings",
      Src1VarTable = "InstanceVars",
      Value2 = 0,
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "Level",
          SpellSlotValue = 3,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          OwnerVar = "Owner",
          Function = GetSlotSpellLevel
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "AttackSpeedPerLevel",
          SrcValueByLevel = {
            0.06,
            0.1,
            0.14
          }
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "NumSwings",
          Src1VarTable = "InstanceVars",
          Src2Var = "AttackSpeedPerLevel",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "AttackSpeedMod",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBIncStat,
        Params = {
          Stat = IncPercentAttackSpeedMod,
          TargetVar = "Owner",
          DeltaVar = "AttackSpeedMod",
          Delta = 0
        }
      }
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBGetTime,
    Params = {DestVar = "TempTime"}
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "TempTime",
      Src2Var = "LastHitTime",
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "TimeSinceLastHit",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "TimeSinceLastHit",
      Value2 = 2.5,
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "NumSwings",
          DestVarTable = "InstanceVars",
          SrcValue = 0
        }
      }
    }
  }
}
BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "HitResult",
      Value2 = HIT_Dodge,
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "HitResult",
          Value2 = HIT_Miss,
          CompareOp = CO_NOT_EQUAL
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
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Attacker",
                      AttackerVar = "Attacker",
                      BuffName = "RelentlessAssaultDebuff",
                      BuffAddType = BUFF_STACKS_AND_RENEWS,
                      BuffType = BUFF_Internal,
                      MaxStack = 8,
                      NumberOfStacks = 1,
                      Duration = 2.5,
                      BuffVarsTable = "NextBuffVars",
                      TickRate = 0
                    }
                  },
                  {
                    Function = BBGetBuffCountFromCaster,
                    Params = {
                      DestVar = "Count",
                      TargetVar = "Attacker",
                      CasterVar = "Attacker",
                      BuffName = "RelentlessAssaultDebuff"
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
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Owner",
                          AttackerVar = "Owner",
                          BuffName = "RelentlessAssaultMarker",
                          BuffAddType = BUFF_RENEW_EXISTING,
                          BuffType = BUFF_Internal,
                          MaxStack = 1,
                          NumberOfStacks = 1,
                          Duration = 2.5,
                          BuffVarsTable = "NextBuffVars",
                          TickRate = 0
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
BuffOnLaunchAttackBuildingBlocks = {
  {
    Function = BBGetTime,
    Params = {
      DestVar = "LastHitTime",
      DestVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_NOT_TURRET},
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "NumSwings",
              Src1VarTable = "InstanceVars",
              Value2 = 9,
              CompareOp = CO_LESS_THAN_OR_EQUAL
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src1Var = "NumSwings",
                  Src1VarTable = "InstanceVars",
                  Src1Value = 0,
                  Src2Value = 1,
                  DestVar = "NumSwings",
                  DestVarTable = "InstanceVars",
                  MathOp = MO_ADD
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
      Name = "relentlessassaultdebuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "relentlessassaultmarker"
    }
  }
}
