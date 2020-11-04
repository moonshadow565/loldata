UpdateSelfBuffActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 5,
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
            Function = BBSetVarInTable,
            Params = {
              DestVar = "CritChanceMod",
              DestVarTable = "NextBuffVars",
              SrcVar = "CriticalChance",
              SrcVarTable = "CharVars"
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "CritChanceMod",
              Src1VarTable = "NextBuffVars",
              Src2Var = "LastCritChanceMod",
              Src2VarTable = "CharVars",
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBForEachUnitInTargetArea,
                Params = {
                  AttackerVar = "Owner",
                  CenterVar = "Owner",
                  Range = 20000,
                  Flags = "AffectFriends AffectHeroes ",
                  IteratorVar = "Unit"
                },
                SubBlocks = {
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Unit",
                      AttackerVar = "Owner",
                      BuffName = "SecondSight",
                      BuffAddType = BUFF_RENEW_EXISTING,
                      BuffType = BUFF_Aura,
                      MaxStack = 1,
                      NumberStacks = 1,
                      Duration = 6,
                      BuffVarsTable = "NextBuffVars",
                      TickRate = 0
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
                  Range = 20000,
                  Flags = "AffectFriends AffectHeroes ",
                  IteratorVar = "Unit"
                },
                SubBlocks = {
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Unit",
                      AttackerVar = "Owner",
                      BuffName = "SecondSight",
                      BuffAddType = BUFF_REPLACE_EXISTING,
                      BuffType = BUFF_Aura,
                      MaxStack = 1,
                      NumberStacks = 1,
                      Duration = 6,
                      BuffVarsTable = "NextBuffVars",
                      TickRate = 0
                    }
                  }
                }
              }
            }
          }
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "LastCritChanceMod",
          DestVarTable = "CharVars",
          SrcVar = "CriticalChance",
          SrcVarTable = "CharVars"
        }
      }
    }
  }
}
SetVarsByLevelBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "CriticalChance",
      DestVarTable = "CharVars",
      SrcValueByLevel = {
        0.03,
        0.03,
        0.03,
        0.03,
        0.03,
        0.03,
        0.04,
        0.04,
        0.04,
        0.04,
        0.04,
        0.04,
        0.05,
        0.05,
        0.05,
        0.05,
        0.05,
        0.05
      }
    }
  }
}
CharOnSpellCastBuildingBlocks = {
  {
    Function = BBGetCastInfo,
    Params = {DestVar = "SpellName", Info = GetSpellName}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "SpellName",
      Value2 = "WildCards",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "Cooldown",
          SpellSlotValue = 2,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          OwnerVar = "Owner",
          Function = GetSlotSpellCooldownTime
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Cooldown",
          Value2 = 0.01,
          CompareOp = CO_LESS_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetSlotSpellCooldownTime,
            Params = {
              SrcValue = 0.1,
              SpellbookType = SPELLBOOK_CHAMPION,
              SlotType = SpellSlots,
              SpellSlotValue = 2,
              OwnerVar = "Owner"
            }
          }
        }
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
      BuffAddType = BUFF_REPLACE_EXISTING,
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
      DestVar = "LastCritChanceMod",
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
    Params = {
      Name = "secondsight"
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
