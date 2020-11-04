NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Armsmaster_CoupDeGrace.dds"
BuffName = "JaxPassive"
AutoBuffActivateEffect = ""
PersistsThroughDeath = true
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBGetBuffCountFromAll,
    Params = {
      DestVar = "Count",
      TargetVar = "Owner",
      BuffName = "JaxRelentlessAssaultAS"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Count",
      Value2 = 0,
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBGetLevel,
        Params = {TargetVar = "Owner", DestVar = "Level"}
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "AS",
          SrcValueByLevel = {
            0.04,
            0.04,
            0.04,
            0.06,
            0.06,
            0.06,
            0.08,
            0.08,
            0.08,
            0.1,
            0.1,
            0.1,
            0.12,
            0.12,
            0.12,
            0.14,
            0.14,
            0.14
          }
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "Count",
          Src2Var = "AS",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "AS",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBIncStat,
        Params = {
          Stat = IncPercentAttackSpeedMod,
          TargetVar = "Owner",
          DeltaVar = "AS",
          Delta = 0
        }
      }
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBGetLevel,
    Params = {TargetVar = "Owner", DestVar = "Level"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "AS",
      SrcValueByLevel = {
        4,
        4,
        4,
        6,
        6,
        6,
        8,
        8,
        8,
        10,
        10,
        10,
        12,
        12,
        12,
        14,
        14,
        14
      }
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "AS",
      Index = 1
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
            Function = BBGetSlotSpellInfo,
            Params = {
              DestVar = "Ult",
              SpellSlotValue = 3,
              SpellbookType = SPELLBOOK_CHAMPION,
              SlotType = SpellSlots,
              OwnerVar = "Owner",
              Function = GetSlotSpellLevel
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "JaxRelentlessAssaultAS",
              BuffAddType = BUFF_STACKS_AND_RENEWS,
              StacksExclusive = true,
              BuffType = BUFF_CombatEnchancer,
              MaxStack = 0,
              MaxStackVar = "UltStacks",
              MaxStackVarTable = "CharVars",
              NumberOfStacks = 1,
              Duration = 2.5,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "Ult",
              Value2 = 0,
              CompareOp = CO_GREATER_THAN
            },
            SubBlocks = {
              {
                Function = BBGetBuffCountFromAll,
                Params = {
                  DestVar = "Count",
                  TargetVar = "Owner",
                  BuffName = "JaxRelentlessAssaultDebuff"
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
                    Function = BBIfNotHasBuff,
                    Params = {
                      OwnerVar = "Owner",
                      CasterVar = "Owner",
                      BuffName = "JaxRelentlessAttack"
                    },
                    SubBlocks = {
                      {
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Owner",
                          AttackerVar = "Owner",
                          BuffName = "JaxRelentlessAssaultDebuff",
                          BuffAddType = BUFF_STACKS_AND_RENEWS,
                          StacksExclusive = true,
                          BuffType = BUFF_Internal,
                          MaxStack = 3,
                          NumberOfStacks = 2,
                          Duration = 25000,
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
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Owner",
                          AttackerVar = "Owner",
                          BuffName = "JaxRelentlessAssaultDebuff",
                          BuffAddType = BUFF_STACKS_AND_RENEWS,
                          StacksExclusive = true,
                          BuffType = BUFF_Internal,
                          MaxStack = 3,
                          NumberOfStacks = 1,
                          Duration = 25000,
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
                Function = BBIf,
                Params = {
                  Src1Var = "Count",
                  Value2 = 3,
                  CompareOp = CO_LESS_THAN
                },
                SubBlocks = {
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Owner",
                      AttackerVar = "Owner",
                      BuffName = "JaxRelentlessAssaultDebuff",
                      BuffAddType = BUFF_STACKS_AND_RENEWS,
                      StacksExclusive = true,
                      BuffType = BUFF_Internal,
                      MaxStack = 3,
                      NumberOfStacks = 1,
                      Duration = 25000,
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
                    Function = BBSpellBuffClear,
                    Params = {
                      TargetVar = "Owner",
                      BuffName = "JaxRelentlessAssaultDebuff"
                    }
                  },
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Owner",
                      AttackerVar = "Owner",
                      BuffName = "JaxRelentlessAttack",
                      BuffAddType = BUFF_STACKS_AND_RENEWS,
                      StacksExclusive = true,
                      BuffType = BUFF_Aura,
                      MaxStack = 1,
                      NumberOfStacks = 1,
                      Duration = 25000,
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
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jaxrelentlessassaultas"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jaxrelentlessassaultdebuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jaxrelentlessattack"
    }
  }
}
