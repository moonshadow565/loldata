UpdateSelfBuffActionsBuildingBlocks = {
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
        Function = BBGetBuffCountFromCaster,
        Params = {
          DestVar = "Count",
          TargetVar = "Owner",
          CasterVar = "Owner",
          BuffName = "Feast"
        }
      },
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
            Function = BBGetSlotSpellInfo,
            Params = {
              DestVar = "Cooldown",
              SpellSlotValue = 3,
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
              Value2 = 0,
              CompareOp = CO_LESS_THAN_OR_EQUAL
            },
            SubBlocks = {
              {
                Function = BBForEachUnitInTargetArea,
                Params = {
                  AttackerVar = "Owner",
                  CenterVar = "Owner",
                  Range = 1500,
                  Flags = "AffectEnemies AffectHeroes ",
                  IteratorVar = "Unit",
                  InclusiveBuffFilter = true
                },
                SubBlocks = {
                  {
                    Function = BBGetBuffCountFromCaster,
                    Params = {
                      DestVar = "Count",
                      TargetVar = "Owner",
                      CasterVar = "Owner",
                      BuffName = "Feast"
                    }
                  },
                  {
                    Function = BBSetVarInTable,
                    Params = {
                      DestVar = "HealthPerStack",
                      SrcValueByLevel = {
                        0,
                        0,
                        0
                      }
                    }
                  },
                  {
                    Function = BBSetVarInTable,
                    Params = {
                      DestVar = "FeastBase",
                      SrcValueByLevel = {
                        300,
                        550,
                        800
                      }
                    }
                  },
                  {
                    Function = BBMath,
                    Params = {
                      Src1Var = "HealthPerStack",
                      Src2Var = "Count",
                      Src1Value = 0,
                      Src2Value = 0,
                      DestVar = "BonusFeastHealth",
                      MathOp = MO_MULTIPLY
                    }
                  },
                  {
                    Function = BBMath,
                    Params = {
                      Src1Var = "BonusFeastHealth",
                      Src2Var = "FeastBase",
                      Src1Value = 0,
                      Src2Value = 0,
                      DestVar = "FeastHealth",
                      MathOp = MO_ADD
                    }
                  },
                  {
                    Function = BBGetPAROrHealth,
                    Params = {
                      DestVar = "TargetHealth",
                      OwnerVar = "Unit",
                      Function = GetHealth,
                      PARType = PAR_MANA
                    }
                  },
                  {
                    Function = BBIf,
                    Params = {
                      Src1Var = "FeastHealth",
                      Src2Var = "TargetHealth",
                      CompareOp = CO_GREATER_THAN_OR_EQUAL
                    },
                    SubBlocks = {
                      {
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Unit",
                          AttackerVar = "Owner",
                          BuffName = "FeastMarker",
                          BuffAddType = BUFF_RENEW_EXISTING,
                          StacksExclusive = true,
                          BuffType = BUFF_Internal,
                          MaxStack = 1,
                          NumberOfStacks = 1,
                          Duration = 1.1,
                          BuffVarsTable = "NextBuffVars",
                          TickRate = 0,
                          CanMitigateDuration = false
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
SetVarsByLevelBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "HealAmount",
      DestVarTable = "CharVars",
      SrcValueByLevel = {
        40,
        42,
        45,
        47,
        50,
        52,
        55,
        57,
        60,
        62,
        65,
        67,
        70,
        72,
        75,
        77,
        80,
        82
      }
    }
  }
}
CharOnKillUnitBuildingBlocks = {
  {
    Function = BBIncHealth,
    Params = {
      TargetVar = "Owner",
      Delta = 0,
      DeltaVar = "HealAmount",
      DeltaVarTable = "CharVars",
      HealerVar = "Owner"
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "EternalThirst_buf.troy",
      Flags = 0,
      EffectIDVar = "Particle",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false
    }
  }
}
CharOnActivateBuildingBlocks = {
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "Carnivore",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Aura,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 25000,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
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
      CanMitigateDuration = false
    }
  },
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
      CanMitigateDuration = false
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
      ForceCastingOrChannelling = false
    }
  }
}
CharOnLevelUpSpellBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "Slot",
      Value2 = 2,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "Level",
          SpellSlotValue = 2,
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
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "VorpalSpikes",
              BuffAddType = BUFF_RENEW_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Aura,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 25000,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false
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
    Params = {Name = "feast"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "feastmarker"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "eternalthirst_buf.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "carnivore"}
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
      Name = "championchampiondelta"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "vorpalspikes"
    }
  }
}
