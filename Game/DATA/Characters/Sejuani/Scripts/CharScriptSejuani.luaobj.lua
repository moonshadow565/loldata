UpdateSelfBuffActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 5,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = true
    },
    SubBlocks = {
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
        Function = BBMath,
        Params = {
          Src1Var = "Level",
          Src1Value = 0,
          Src2Value = 1,
          DestVar = "Level",
          MathOp = MO_MAX
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "DamagePerTick",
          SrcValueByLevel = {
            12,
            20,
            28,
            36,
            44
          }
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "MaxHPPercent",
          SrcValueByLevel = {
            0.01,
            0.0125,
            0.015,
            0.0175,
            0.02
          }
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "FrostBonus", SrcValue = 1.5}
      },
      {
        Function = BBGetPAROrHealth,
        Params = {
          DestVar = "Temp1",
          OwnerVar = "Owner",
          Function = GetMaxHealth,
          PARType = PAR_MANA
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "Temp1",
          Src2Var = "MaxHPPercent",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "PercentDamage",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "PercentDamage",
          Src2Var = "DamagePerTick",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "DamagePerTick",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBGetStat,
        Params = {
          Stat = GetFlatMagicDamageMod,
          TargetVar = "Owner",
          DestVar = "AbilityPowerMod"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "AbilityPowerMod",
          Src1Value = 0,
          Src2Value = 0.1,
          DestVar = "AbilityPowerBonus",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "AbilityPowerBonus",
          Src2Var = "DamagePerTick",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "DamagePerTick",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "FrostBonus",
          Src2Var = "DamagePerTick",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "DamagePerTickFrost",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBSetSpellToolTipVar,
        Params = {
          Value = 0,
          ValueVar = "PercentDamage",
          Index = 1,
          SlotNumber = 1,
          SlotType = SpellSlots,
          SlotBook = SPELLBOOK_CHAMPION,
          TargetVar = "Owner"
        }
      },
      {
        Function = BBSetSpellToolTipVar,
        Params = {
          Value = 0,
          ValueVar = "DamagePerTickFrost",
          Index = 2,
          SlotNumber = 1,
          SlotType = SpellSlots,
          SlotBook = SPELLBOOK_CHAMPION,
          TargetVar = "Owner"
        }
      }
    }
  }
}
CharOnHitUnitBuildingBlocks = {
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
            Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
            SubBlocks = {
              {
                Function = BBSpellCast,
                Params = {
                  CasterVar = "Owner",
                  TargetVar = "Target",
                  OverrideCastPosition = false,
                  SlotNumber = 1,
                  SlotType = ExtraSlots,
                  OverrideForceLevel = 1,
                  OverrideCoolDownCheck = true,
                  FireWithoutCasting = true,
                  UseAutoAttackSpell = false,
                  ForceCastingOrChannelling = false,
                  UpdateAutoAttackTimer = false
                }
              }
            }
          }
        }
      }
    }
  }
}
CharOnSpellCastBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "DoesntTriggerSpellCasts",
      Src1VarTable = "SpellVars",
      Value2 = true,
      CompareOp = CO_EQUAL
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBGetCastInfo,
        Params = {DestVar = "Slot", Info = GetSpellSlot}
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Slot",
          Value2 = 2,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
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
                  Range = 900,
                  Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
                  IteratorVar = "Unit",
                  InclusiveBuffFilter = true
                },
                SubBlocks = {
                  {
                    Function = BBIfHasBuff,
                    Params = {
                      OwnerVar = "Unit",
                      AttackerVar = "Owner",
                      BuffName = "SejuaniFrost"
                    },
                    SubBlocks = {
                      {
                        Function = BBGetBuffRemainingDuration,
                        Params = {
                          DestVar = "Duration",
                          TargetVar = "Unit",
                          BuffName = "SejuaniFrost"
                        }
                      },
                      {
                        Function = BBMath,
                        Params = {
                          Src1Var = "Duration",
                          Src1Value = 0,
                          Src2Value = 0.5,
                          DestVar = "Duration",
                          MathOp = MO_ADD
                        }
                      },
                      {
                        Function = BBSpellBuffRenew,
                        Params = {
                          TargetVar = "Unit",
                          BuffName = "SejuaniFrost",
                          ResetDuration = 0,
                          ResetDurationVar = "Duration"
                        }
                      }
                    }
                  },
                  {
                    Function = BBIfHasBuff,
                    Params = {
                      OwnerVar = "Unit",
                      AttackerVar = "Owner",
                      BuffName = "SejuaniFrostResist"
                    },
                    SubBlocks = {
                      {
                        Function = BBGetBuffRemainingDuration,
                        Params = {
                          DestVar = "Duration",
                          TargetVar = "Unit",
                          BuffName = "SejuaniFrostResist"
                        }
                      },
                      {
                        Function = BBMath,
                        Params = {
                          Src1Var = "Duration",
                          Src1Value = 0,
                          Src2Value = 0.5,
                          DestVar = "Duration",
                          MathOp = MO_ADD
                        }
                      },
                      {
                        Function = BBSpellBuffRenew,
                        Params = {
                          TargetVar = "Unit",
                          BuffName = "SejuaniFrostResist",
                          ResetDuration = 0,
                          ResetDurationVar = "Duration"
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
                  Range = 900,
                  Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
                  IteratorVar = "Unit",
                  InclusiveBuffFilter = true
                },
                SubBlocks = {
                  {
                    Function = BBIfHasBuff,
                    Params = {
                      OwnerVar = "Unit",
                      AttackerVar = "Owner",
                      BuffName = "SejuaniFrostChaos"
                    },
                    SubBlocks = {
                      {
                        Function = BBGetBuffRemainingDuration,
                        Params = {
                          DestVar = "Duration",
                          TargetVar = "Unit",
                          BuffName = "SejuaniFrostChaos"
                        }
                      },
                      {
                        Function = BBMath,
                        Params = {
                          Src1Var = "Duration",
                          Src1Value = 0,
                          Src2Value = 0.5,
                          DestVar = "Duration",
                          MathOp = MO_ADD
                        }
                      },
                      {
                        Function = BBSpellBuffRenew,
                        Params = {
                          TargetVar = "Unit",
                          BuffName = "SejuaniFrostChaos",
                          ResetDuration = 0,
                          ResetDurationVar = "Duration"
                        }
                      }
                    }
                  },
                  {
                    Function = BBIfHasBuff,
                    Params = {
                      OwnerVar = "Unit",
                      AttackerVar = "Owner",
                      BuffName = "SejuaniFrostResistChaos"
                    },
                    SubBlocks = {
                      {
                        Function = BBGetBuffRemainingDuration,
                        Params = {
                          DestVar = "Duration",
                          TargetVar = "Unit",
                          BuffName = "SejuaniFrostResistChaos"
                        }
                      },
                      {
                        Function = BBMath,
                        Params = {
                          Src1Var = "Duration",
                          Src1Value = 0,
                          Src2Value = 0.5,
                          DestVar = "Duration",
                          MathOp = MO_ADD
                        }
                      },
                      {
                        Function = BBSpellBuffRenew,
                        Params = {
                          TargetVar = "Unit",
                          BuffName = "SejuaniFrostResistChaos",
                          ResetDuration = 0,
                          ResetDurationVar = "Duration"
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
CharOnActivateBuildingBlocks = {
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
      BuffName = "ChampionChampionDelta",
      BuffAddType = BUFF_REPLACE_EXISTING,
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
    Function = BBSetVarInTable,
    Params = {
      DestVar = "FrostDuration",
      DestVarTable = "CharVars",
      SrcValue = 3
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetMovementSpeed,
      TargetVar = "Owner",
      DestVar = "MS",
      DestVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "SejuaniRunSpeed",
      BuffAddType = BUFF_REPLACE_EXISTING,
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
  }
}
CharOnResurrectBuildingBlocks = {
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = false
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 3,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = false
    }
  },
  {
    Function = BBUnlockAnimation,
    Params = {OwnerVar = "Owner", Blend = true}
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
      Name = "sejuanirunspeed"
    }
  }
}
