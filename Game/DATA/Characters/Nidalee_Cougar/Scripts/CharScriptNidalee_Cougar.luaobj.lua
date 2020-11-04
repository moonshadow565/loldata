UpdateSelfBuffActionsBuildingBlocks = {
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
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "VorpalSpikes",
          BuffAddType = BUFF_RENEW_EXISTING,
          BuffType = BUFF_Aura,
          MaxStack = 1,
          NumberStacks = 1,
          Duration = 25000,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      }
    }
  },
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
                  IteratorVar = "Unit"
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
                          BuffType = BUFF_Internal,
                          MaxStack = 1,
                          NumberStacks = 1,
                          Duration = 1.1,
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
CharOnHitUnitBuildingBlocks = {
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
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetPointByUnitFacingOffset,
        Params = {
          UnitVar = "Owner",
          Distance = 550,
          OffsetAngle = 0,
          PositionVar = "MissileEndPosition"
        }
      },
      {
        Function = BBSpellCast,
        Params = {
          CasterVar = "Owner",
          TargetVar = "Target",
          PosVar = "MissileEndPosition",
          SlotNumber = 0,
          SlotType = ExtraSlots,
          OverrideForceLevel = 0,
          OverrideForceLevelVar = "Level",
          OverrideCoolDownCheck = true,
          FireWithoutCasting = true,
          UseAutoAttackSpell = false
        }
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
      BuffType = BUFF_Aura,
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
    Function = BBSilenceSpellSlot,
    Params = {
      SpellSlot = 2,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = true
    }
  },
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
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "teamID"}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "teamID",
      Value2 = TEAM_ORDER,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBForEachChampion,
        Params = {IteratorVar = "Unit", Team = TEAM_ORDER},
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "Owner",
              Src2Var = "Unit",
              CompareOp = CO_NOT_EQUAL
            },
            SubBlocks = {
              {
                Function = BBIncPermanentStat,
                Params = {
                  Stat = IncPermanentFlatGoldPer10Mod,
                  TargetVar = "Unit",
                  Delta = 4
                }
              },
              {
                Function = BBIncPermanentStat,
                Params = {
                  Stat = IncPermanentPercentEXPBonus,
                  TargetVar = "Unit",
                  Delta = 0.04
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
        Function = BBForEachChampion,
        Params = {IteratorVar = "Unit", Team = TEAM_CHAOS},
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "Owner",
              Src2Var = "Unit",
              CompareOp = CO_NOT_EQUAL
            },
            SubBlocks = {
              {
                Function = BBIncPermanentStat,
                Params = {
                  Stat = IncPermanentFlatGoldPer10Mod,
                  TargetVar = "Unit",
                  Delta = 4
                }
              },
              {
                Function = BBIncPermanentStat,
                Params = {
                  Stat = IncPermanentPercentEXPBonus,
                  TargetVar = "Unit",
                  Delta = 0.04
                }
              }
            }
          }
        }
      }
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetDisableAmbientGold
    }
  }
}
CharOnReconnectBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "teamID"}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "teamID",
      Value2 = TEAM_ORDER,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBForEachChampion,
        Params = {IteratorVar = "Unit", Team = TEAM_ORDER},
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "Owner",
              Src2Var = "Unit",
              CompareOp = CO_NOT_EQUAL
            },
            SubBlocks = {
              {
                Function = BBIncPermanentStat,
                Params = {
                  Stat = IncPermanentFlatGoldPer10Mod,
                  TargetVar = "Unit",
                  Delta = -4
                }
              },
              {
                Function = BBIncPermanentStat,
                Params = {
                  Stat = IncPermanentPercentEXPBonus,
                  TargetVar = "Unit",
                  Delta = -0.04
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
        Function = BBForEachChampion,
        Params = {IteratorVar = "Unit", Team = TEAM_CHAOS},
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "Owner",
              Src2Var = "Unit",
              CompareOp = CO_NOT_EQUAL
            },
            SubBlocks = {
              {
                Function = BBIncPermanentStat,
                Params = {
                  Stat = IncPermanentFlatGoldPer10Mod,
                  TargetVar = "Unit",
                  Delta = -4
                }
              },
              {
                Function = BBIncPermanentStat,
                Params = {
                  Stat = IncPermanentPercentEXPBonus,
                  TargetVar = "Unit",
                  Delta = -0.04
                }
              }
            }
          }
        }
      }
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetDisableAmbientGold
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "vorpalspikes"
    }
  },
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
  }
}
