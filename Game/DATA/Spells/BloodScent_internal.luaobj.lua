DoesntTriggerSpellCasts = true
CastingBreaksStealth = false
BuffTextureName = "20.dds"
BuffName = "Blood Awareness"
SpellToggleSlot = 3
PersistsThroughDeath = true
SpellVOOverrideSkins = {
  "HyenaWarwick"
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetSlotSpellCooldownTime,
    Params = {
      SrcValue = 4,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      SpellSlotValue = 2,
      OwnerVar = "Owner"
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
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
                  IteratorVar = "Unit",
                  InclusiveBuffFilter = true
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
                          StacksExclusive = true,
                          BuffType = BUFF_CombatDehancer,
                          MaxStack = 1,
                          NumberOfStacks = 1,
                          Duration = 3,
                          BuffVarsTable = "NextBuffVars",
                          TickRate = 0,
                          CanMitigateDuration = false,
                          IsHiddenOnClient = false
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
                          StacksExclusive = true,
                          BuffType = BUFF_Haste,
                          MaxStack = 1,
                          NumberOfStacks = 1,
                          Duration = 3,
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
  }
}
