UpdateSelfBuffActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 0.5,
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
            Function = BBGetTeamID,
            Params = {TargetVar = "Owner", DestVar = "TeamID"}
          },
          {
            Function = BBForEachUnitInTargetArea,
            Params = {
              AttackerVar = "Owner",
              CenterVar = "Owner",
              Range = 1800,
              Flags = "AffectEnemies AffectFriends AffectHeroes AlwaysSelf ",
              IteratorVar = "Unit",
              InclusiveBuffFilter = true
            },
            SubBlocks = {
              {
                Function = BBIf,
                Params = {
                  Src1Var = "TeamID",
                  Value2 = 100,
                  CompareOp = CO_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Unit",
                      AttackerVar = "Attacker",
                      BuffName = "MaokaiSapMagic",
                      BuffAddType = BUFF_RENEW_EXISTING,
                      StacksExclusive = true,
                      BuffType = BUFF_Internal,
                      MaxStack = 1,
                      NumberOfStacks = 1,
                      Duration = 0.75,
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
                      TargetVar = "Unit",
                      AttackerVar = "Attacker",
                      BuffName = "MaokaiSapMagicChaos",
                      BuffAddType = BUFF_RENEW_EXISTING,
                      StacksExclusive = true,
                      BuffType = BUFF_Internal,
                      MaxStack = 1,
                      NumberOfStacks = 1,
                      Duration = 0.75,
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
CharOnPreAttackBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_NOT_TURRET},
        SubBlocks = {
          {
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Owner",
              AttackerVar = "Attacker",
              BuffName = "MaokaiSapMagicMelee"
            },
            SubBlocks = {
              {
                Function = BBGetPAROrHealth,
                Params = {
                  DestVar = "healthPercent",
                  OwnerVar = "Owner",
                  Function = GetHealthPercent,
                  PARType = PAR_MANA
                }
              },
              {
                Function = BBIf,
                Params = {
                  Src1Var = "healthPercent",
                  Value2 = 1,
                  CompareOp = CO_LESS_THAN
                },
                SubBlocks = {
                  {
                    Function = BBOverrideAnimation,
                    Params = {
                      ToOverrideAnim = "Attack",
                      OverrideAnim = "Passive",
                      OwnerVar = "Owner"
                    }
                  },
                  {
                    Function = BBOverrideAnimation,
                    Params = {
                      ToOverrideAnim = "Attack2",
                      OverrideAnim = "Passive",
                      OwnerVar = "Owner"
                    }
                  },
                  {
                    Function = BBOverrideAnimation,
                    Params = {
                      ToOverrideAnim = "Crit",
                      OverrideAnim = "Passive",
                      OwnerVar = "Owner"
                    }
                  }
                }
              },
              {
                Function = BBElse,
                Params = {},
                SubBlocks = {
                  {
                    Function = BBClearOverrideAnimation,
                    Params = {ToOverrideAnim = "Attack", OwnerVar = "Owner"}
                  },
                  {
                    Function = BBClearOverrideAnimation,
                    Params = {ToOverrideAnim = "Attack2", OwnerVar = "Owner"}
                  },
                  {
                    Function = BBClearOverrideAnimation,
                    Params = {ToOverrideAnim = "Crit", OwnerVar = "Owner"}
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
                Function = BBClearOverrideAnimation,
                Params = {ToOverrideAnim = "Attack", OwnerVar = "Owner"}
              },
              {
                Function = BBClearOverrideAnimation,
                Params = {ToOverrideAnim = "Attack2", OwnerVar = "Owner"}
              },
              {
                Function = BBClearOverrideAnimation,
                Params = {ToOverrideAnim = "Crit", OwnerVar = "Owner"}
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
            Function = BBClearOverrideAnimation,
            Params = {ToOverrideAnim = "Attack", OwnerVar = "Owner"}
          },
          {
            Function = BBClearOverrideAnimation,
            Params = {ToOverrideAnim = "Attack2", OwnerVar = "Owner"}
          },
          {
            Function = BBClearOverrideAnimation,
            Params = {ToOverrideAnim = "Crit", OwnerVar = "Owner"}
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
        Function = BBClearOverrideAnimation,
        Params = {ToOverrideAnim = "Attack", OwnerVar = "Owner"}
      },
      {
        Function = BBClearOverrideAnimation,
        Params = {ToOverrideAnim = "Attack2", OwnerVar = "Owner"}
      },
      {
        Function = BBClearOverrideAnimation,
        Params = {ToOverrideAnim = "Crit", OwnerVar = "Owner"}
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
      StacksExclusive = true,
      BuffType = BUFF_Internal,
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
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "APBonusDamageToTowers",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
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
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "MaokaiSapMagicPass",
      BuffAddType = BUFF_RENEW_EXISTING,
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
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Tally",
      DestVarTable = "CharVars",
      SrcValue = 0
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
      OverrideCastPosition = false,
      SlotNumber = 6,
      SlotType = InventorySlots,
      OverrideForceLevel = 1,
      OverrideCoolDownCheck = true,
      FireWithoutCasting = false,
      UseAutoAttackSpell = false,
      ForceCastingOrChannelling = false,
      UpdateAutoAttackTimer = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "maokaisapmagic"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "maokaisapmagicchaos"
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
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "maokaisapmagicpass"
    }
  }
}
