PersistsThroughDeath = true
Nondispellable = true
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 1,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Owner", CompareOp = CO_IS_NOT_DEAD},
        SubBlocks = {
          {
            Function = BBIfNotHasBuff,
            Params = {
              OwnerVar = "Owner",
              CasterVar = "Owner",
              BuffName = "HeimerdingerTurretTimer"
            },
            SubBlocks = {
              {
                Function = BBGetSlotSpellInfo,
                Params = {
                  DestVar = "Level",
                  SpellSlotValue = 0,
                  SpellbookType = SPELLBOOK_CHAMPION,
                  SlotType = SpellSlots,
                  OwnerVar = "Owner",
                  Function = GetSlotSpellLevel
                }
              },
              {
                Function = BBIf,
                Params = {
                  Src1Var = "Level",
                  Value2 = 3,
                  CompareOp = CO_GREATER_THAN_OR_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBGetBuffCountFromCaster,
                    Params = {
                      DestVar = "Count",
                      TargetVar = "Owner",
                      CasterVar = "Owner",
                      BuffName = "HeimerdingerTurretReady"
                    }
                  },
                  {
                    Function = BBIf,
                    Params = {
                      Src1Var = "Count",
                      Value2 = 2,
                      CompareOp = CO_LESS_THAN
                    },
                    SubBlocks = {
                      {
                        Function = BBSetVarInTable,
                        Params = {
                          DestVar = "baseCooldown",
                          SrcValue = 25
                        }
                      },
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
                          DestVar = "CooldownMod",
                          MathOp = MO_ADD
                        }
                      },
                      {
                        Function = BBMath,
                        Params = {
                          Src1Var = "baseCooldown",
                          Src2Var = "CooldownMod",
                          Src1Value = 0,
                          Src2Value = 0,
                          DestVar = "newCooldown",
                          MathOp = MO_MULTIPLY
                        }
                      },
                      {
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Owner",
                          AttackerVar = "Owner",
                          BuffName = "HeimerdingerTurretTimer",
                          BuffAddType = BUFF_REPLACE_EXISTING,
                          StacksExclusive = false,
                          BuffType = BUFF_Internal,
                          MaxStack = 1,
                          NumberOfStacks = 1,
                          Duration = 0,
                          BuffVarsTable = "NextBuffVars",
                          DurationVar = "newCooldown",
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
                Function = BBElseIf,
                Params = {
                  Src1Var = "Level",
                  Value2 = 1,
                  CompareOp = CO_GREATER_THAN_OR_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBIfNotHasBuff,
                    Params = {
                      OwnerVar = "Owner",
                      CasterVar = "Owner",
                      BuffName = "HeimerdingerTurretReady"
                    },
                    SubBlocks = {
                      {
                        Function = BBSetVarInTable,
                        Params = {
                          DestVar = "baseCooldown",
                          SrcValue = 25
                        }
                      },
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
                          DestVar = "CooldownMod",
                          MathOp = MO_ADD
                        }
                      },
                      {
                        Function = BBMath,
                        Params = {
                          Src1Var = "baseCooldown",
                          Src2Var = "CooldownMod",
                          Src1Value = 0,
                          Src2Value = 0,
                          DestVar = "newCooldown",
                          MathOp = MO_MULTIPLY
                        }
                      },
                      {
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Owner",
                          AttackerVar = "Owner",
                          BuffName = "HeimerdingerTurretTimer",
                          BuffAddType = BUFF_REPLACE_EXISTING,
                          StacksExclusive = false,
                          BuffType = BUFF_Internal,
                          MaxStack = 1,
                          NumberOfStacks = 1,
                          Duration = 0,
                          BuffVarsTable = "NextBuffVars",
                          DurationVar = "newCooldown",
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
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "heimerdingerturrettimer"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "heimerdingerturretready"
    }
  }
}
