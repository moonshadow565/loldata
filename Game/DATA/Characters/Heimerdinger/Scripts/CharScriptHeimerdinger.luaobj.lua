UpdateSelfBuffActionsBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Owner", CompareOp = CO_IS_DEAD}
  },
  {
    Function = BBElse,
    Params = {},
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
        Function = BBIf,
        Params = {
          Src1Var = "Level",
          Value2 = 1,
          CompareOp = CO_GREATER_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "UPGRADE!!!",
              BuffAddType = BUFF_RENEW_EXISTING,
              BuffType = BUFF_Aura,
              MaxStack = 1,
              NumberStacks = 1,
              Duration = 20000,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0
            }
          }
        }
      },
      {
        Function = BBExecutePeriodically,
        Params = {
          TimeBetweenExecutions = 0.9,
          TrackTimeVar = "LastTimeExecuted",
          TrackTimeVarTable = "CharVars",
          ExecuteImmediately = false
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "HealthRegenIncrease",
              DestVarTable = "NextBuffVars",
              SrcVar = "HealthRegenIncrease",
              SrcVarTable = "CharVars"
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "HealthRegenIncrease",
              Src1VarTable = "CharVars",
              Src2Var = "LastHealthRegenIncrease",
              Src2VarTable = "CharVars",
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBForEachUnitInTargetArea,
                Params = {
                  AttackerVar = "Owner",
                  CenterVar = "Owner",
                  Range = 1000,
                  Flags = "AffectFriends AffectMinions AffectHeroes AffectTurrets AlwaysSelf ",
                  IteratorVar = "Unit"
                },
                SubBlocks = {
                  {
                    Function = BBIf,
                    Params = {Src1Var = "Unit", CompareOp = CO_IS_TYPE_HERO},
                    SubBlocks = {
                      {
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Unit",
                          AttackerVar = "Owner",
                          BuffName = "TechmaturgicalRepairBots",
                          BuffAddType = BUFF_RENEW_EXISTING,
                          BuffType = BUFF_Aura,
                          MaxStack = 1,
                          NumberStacks = 1,
                          Duration = 1,
                          BuffVarsTable = "NextBuffVars",
                          TickRate = 0
                        }
                      }
                    }
                  },
                  {
                    Function = BBElseIf,
                    Params = {Src1Var = "Unit", CompareOp = CO_IS_TYPE_TURRET},
                    SubBlocks = {
                      {
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Unit",
                          AttackerVar = "Owner",
                          BuffName = "TechmaturgicalRepairBots",
                          BuffAddType = BUFF_RENEW_EXISTING,
                          BuffType = BUFF_Aura,
                          MaxStack = 1,
                          NumberStacks = 1,
                          Duration = 1,
                          BuffVarsTable = "NextBuffVars",
                          TickRate = 0
                        }
                      }
                    }
                  },
                  {
                    Function = BBElse,
                    Params = {},
                    SubBlocks = {
                      {
                        Function = BBIfHasBuff,
                        Params = {
                          OwnerVar = "Unit",
                          AttackerVar = "Owner",
                          BuffName = "H28GEvolutionTurret"
                        },
                        SubBlocks = {
                          {
                            Function = BBSpellBuffAdd,
                            Params = {
                              TargetVar = "Unit",
                              AttackerVar = "Owner",
                              BuffName = "TechmaturgicalRepairBots",
                              BuffAddType = BUFF_RENEW_EXISTING,
                              BuffType = BUFF_Aura,
                              MaxStack = 1,
                              NumberStacks = 1,
                              Duration = 1,
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
                  Range = 1000,
                  Flags = "AffectFriends AffectMinions AffectHeroes AffectTurrets AlwaysSelf ",
                  IteratorVar = "Unit"
                },
                SubBlocks = {
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Unit",
                      AttackerVar = "Owner",
                      BuffName = "TechmaturgicalRepairBots",
                      BuffAddType = BUFF_REPLACE_EXISTING,
                      BuffType = BUFF_Aura,
                      MaxStack = 1,
                      NumberStacks = 1,
                      Duration = 1,
                      BuffVarsTable = "NextBuffVars",
                      TickRate = 0
                    }
                  }
                }
              }
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "LastHealthRegenIncrease",
              DestVarTable = "CharVars",
              SrcVar = "HealthRegenIncrease",
              SrcVarTable = "CharVars"
            }
          }
        }
      }
    }
  }
}
SetVarsByLevelBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "HealthRegenIncrease",
      DestVarTable = "CharVars",
      SrcValueByLevel = {
        1.2,
        1.2,
        1.2,
        1.2,
        1.2,
        2.2,
        2.2,
        2.2,
        2.2,
        2.2,
        3.2,
        3.2,
        3.2,
        3.2,
        4.2,
        4.2,
        4.2,
        4.2
      }
    }
  }
}
CharOnActivateBuildingBlocks = {
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "ChampionChampionDelta",
      BuffAddType = BUFF_RENEW_EXISTING,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 25000,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "APBonusDamageToTowers",
      BuffAddType = BUFF_RENEW_EXISTING,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 25000,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Time1",
      DestVarTable = "CharVars",
      SrcValue = 25000
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Time2",
      DestVarTable = "CharVars",
      SrcValue = 25000
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Time3",
      DestVarTable = "CharVars",
      SrcValue = 25000
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Time4",
      DestVarTable = "CharVars",
      SrcValue = 25000
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Time5",
      DestVarTable = "CharVars",
      SrcValue = 25000
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Time6",
      DestVarTable = "CharVars",
      SrcValue = 25000
    }
  }
}
CharOnDisconnectBuildingBlocks = {
  {
    Function = BBSpellCast,
    Params = {
      CasterVar = "Owner",
      TargetVar = "Owner",
      PosVar = "Owner",
      EndPosVar = "Owner",
      SlotNumber = 6,
      SlotType = InventorySlots,
      OverrideForceLevel = 1,
      OverrideCoolDownCheck = true,
      FireWithoutCasting = false,
      UseAutoAttackSpell = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "upgrade!!!"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "techmaturgicalrepairbots"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "h28gevolutionturret"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "h28gevolutionturret"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "championchampiondelta"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "apbonusdamagetotowers"
    }
  }
}
