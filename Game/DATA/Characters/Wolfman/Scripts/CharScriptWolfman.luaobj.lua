BuffTextureName = "Wolfman_InnerHunger.dds"
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
        Function = BBIf,
        Params = {Src1Var = "Owner", CompareOp = CO_IS_DEAD}
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBExecutePeriodically,
            Params = {
              TimeBetweenExecutions = 2,
              TrackTimeVar = "LastTimeExecuted",
              TrackTimeVarTable = "InstanceVars",
              ExecuteImmediately = false
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src1Var = "Level",
                  Src1Value = 0,
                  Src2Value = 800,
                  DestVar = "BaseRange",
                  MathOp = MO_MULTIPLY
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "BaseRange",
                  Src1Value = 0,
                  Src2Value = 700,
                  DestVar = "Range",
                  MathOp = MO_ADD
                }
              },
              {
                Function = BBForEachUnitInTargetArea,
                Params = {
                  AttackerVar = "Owner",
                  CenterVar = "Owner",
                  Range = 0,
                  RangeVar = "Range",
                  Flags = "AffectEnemies AffectHeroes ",
                  IteratorVar = "Unit"
                },
                SubBlocks = {
                  {
                    Function = BBGetPAROrHealth,
                    Params = {
                      DestVar = "MaxHealth",
                      OwnerVar = "Unit",
                      Function = GetMaxHealth,
                      PARType = PAR_MANA
                    }
                  },
                  {
                    Function = BBGetPAROrHealth,
                    Params = {
                      DestVar = "Health",
                      OwnerVar = "Unit",
                      Function = GetHealth,
                      PARType = PAR_MANA
                    }
                  },
                  {
                    Function = BBMath,
                    Params = {
                      Src1Var = "Health",
                      Src2Var = "MaxHealth",
                      Src1Value = 0,
                      Src2Value = 0,
                      DestVar = "HealthPercent",
                      MathOp = MO_DIVIDE
                    }
                  },
                  {
                    Function = BBIf,
                    Params = {
                      Src1Var = "HealthPercent",
                      Value2 = 0.5,
                      CompareOp = CO_LESS_THAN_OR_EQUAL
                    },
                    SubBlocks = {
                      {
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Unit",
                          AttackerVar = "Attacker",
                          BuffName = "BloodScent_target",
                          BuffAddType = BUFF_RENEW_EXISTING,
                          BuffType = BUFF_CombatDehancer,
                          MaxStack = 1,
                          NumberStacks = 1,
                          Duration = 3,
                          BuffVarsTable = "NextBuffVars",
                          TickRate = 0
                        }
                      },
                      {
                        Function = BBSetVarInTable,
                        Params = {
                          DestVar = "MoveSpeedBuff",
                          DestVarTable = "NextBuffVars",
                          SrcValueByLevel = {
                            0.2,
                            0.25,
                            0.3,
                            0.35,
                            0.4
                          }
                        }
                      },
                      {
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Attacker",
                          AttackerVar = "Attacker",
                          BuffName = "BloodScent",
                          BuffAddType = BUFF_RENEW_EXISTING,
                          BuffType = BUFF_Haste,
                          MaxStack = 1,
                          NumberStacks = 1,
                          Duration = 3,
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
      DestVar = "LifeStealAmount",
      DestVarTable = "CharVars",
      SrcValueByLevel = {
        5,
        5,
        5,
        5,
        5,
        5,
        10,
        10,
        10,
        10,
        10,
        10,
        15,
        15,
        15,
        15,
        15,
        15
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
                Function = BBIf,
                Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_TURRET}
              },
              {
                Function = BBElse,
                Params = {},
                SubBlocks = {
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Target",
                      AttackerVar = "Attacker",
                      BuffName = "EternalThirst",
                      BuffAddType = BUFF_STACKS_AND_RENEWS,
                      BuffType = BUFF_Internal,
                      MaxStack = 4,
                      NumberStacks = 1,
                      Duration = 3.1,
                      BuffVarsTable = "NextBuffVars",
                      TickRate = 0
                    }
                  },
                  {
                    Function = BBGetBuffCountFromAll,
                    Params = {
                      DestVar = "Count",
                      TargetVar = "Target",
                      BuffName = "EternalThirst"
                    }
                  },
                  {
                    Function = BBMath,
                    Params = {
                      Src1Var = "LifeStealAmount",
                      Src1VarTable = "CharVars",
                      Src2Var = "Count",
                      Src1Value = 0,
                      Src2Value = 0,
                      DestVar = "LifeStealToHeal",
                      MathOp = MO_MULTIPLY
                    }
                  },
                  {
                    Function = BBIncHealth,
                    Params = {
                      TargetVar = "Owner",
                      Delta = 0,
                      DeltaVar = "LifeStealToHeal",
                      HealerVar = "Owner"
                    }
                  },
                  {
                    Function = BBSpellEffectCreate,
                    Params = {
                      BindObjectVar = "Attacker",
                      EffectName = "EternalThirst_buf.troy",
                      Flags = 0,
                      EffectIDVar = "num",
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
      TargetVar = "Target",
      AttackerVar = "Owner",
      BuffName = "EternalThirstIcon",
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
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "bloodscent_target"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "bloodscent"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "eternalthirst"
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
    Params = {
      Name = "eternalthirsticon"
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
      Name = "championchampiondelta"
    }
  }
}
