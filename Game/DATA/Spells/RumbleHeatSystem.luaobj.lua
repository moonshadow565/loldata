BuffTextureName = "Rumble_Junkyard Titan1.dds"
BuffName = "RumbleHeatSystem"
PersistsThroughDeath = true
OnBuffActivateBuildingBlocks = {}
BuffOnUpdateActionsBuildingBlocks = {
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
        Params = {
          Value1 = 1,
          Value2 = 1,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBGetLevel,
            Params = {TargetVar = "Owner", DestVar = "Level"}
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "punchdmg",
              SrcValueByLevel = {
                25,
                30,
                35,
                40,
                45,
                50,
                55,
                60,
                65,
                70,
                75,
                80,
                85,
                90,
                95,
                100,
                105,
                110
              }
            }
          },
          {
            Function = BBSetBuffToolTipVar,
            Params = {
              Value = 0,
              ValueVar = "punchdmg",
              Index = 1
            }
          },
          {
            Function = BBGetStat,
            Params = {
              Stat = GetFlatMagicDamageMod,
              TargetVar = "Owner",
              DestVar = "AP"
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "AP",
              Src1Value = 0,
              Src2Value = 0.3,
              DestVar = "AP",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBSetBuffToolTipVar,
            Params = {
              Value = 0,
              ValueVar = "AP",
              Index = 2
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {DestVar = "BaseCDR", SrcValue = 10}
          },
          {
            Function = BBGetStat,
            Params = {
              Stat = GetPercentCooldownMod,
              TargetVar = "Owner",
              DestVar = "CDRMod"
            }
          },
          {
            Function = BBMath,
            Params = {
              Src2Var = "CDRMod",
              Src1Value = -1,
              Src2Value = 0,
              DestVar = "CDRMod",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBMath,
            Params = {
              Src2Var = "CDRMod",
              Src1Value = 1,
              Src2Value = 0,
              DestVar = "CDRMod",
              MathOp = MO_SUBTRACT
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "CDRMod",
              Src2Var = "BaseCDR",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "BaseCDR",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBSetSpellToolTipVar,
            Params = {
              Value = 0,
              ValueVar = "BaseCDR",
              Index = 1,
              SlotNumber = 2,
              SlotType = SpellSlots,
              SlotBook = SPELLBOOK_CHAMPION,
              TargetVar = "Owner"
            }
          }
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "HeatDecay", SrcValue = -5}
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "BonusHeatDecay",
          SrcValue = -5
        }
      },
      {
        Function = BBGetPAROrHealth,
        Params = {
          DestVar = "CurrentHeat",
          OwnerVar = "Owner",
          Function = GetPAR,
          PARType = PAR_OTHER
        }
      },
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "RumbleHeatingUp"
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBIncPAR,
            Params = {
              TargetVar = "Owner",
              Delta = 0,
              PARType = PAR_OTHER,
              DeltaVar = "HeatDecay"
            }
          },
          {
            Function = BBIfNotHasBuff,
            Params = {
              OwnerVar = "Owner",
              CasterVar = "Owner",
              BuffName = "RumbleHeatingUp2"
            },
            SubBlocks = {
              {
                Function = BBIncPAR,
                Params = {
                  TargetVar = "Owner",
                  Delta = 0,
                  PARType = PAR_OTHER,
                  DeltaVar = "BonusHeatDecay"
                }
              }
            }
          }
        }
      },
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "RumbleOverheat"
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "CurrentHeat",
              Src2Var = "DangerZone",
              Src2VarTable = "CharVars",
              CompareOp = CO_GREATER_THAN_OR_EQUAL
            },
            SubBlocks = {
              {
                Function = BBIf,
                Params = {
                  Src1Var = "CurrentHeat",
                  Value2 = 100,
                  CompareOp = CO_GREATER_THAN_OR_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Owner",
                      AttackerVar = "Attacker",
                      BuffName = "RumbleOverheat",
                      BuffAddType = BUFF_RENEW_EXISTING,
                      StacksExclusive = true,
                      BuffType = BUFF_Aura,
                      MaxStack = 1,
                      NumberOfStacks = 1,
                      Duration = 5.25,
                      BuffVarsTable = "NextBuffVars",
                      TickRate = 0,
                      CanMitigateDuration = false,
                      IsHiddenOnClient = false
                    }
                  },
                  {
                    Function = BBSay,
                    Params = {OwnerVar = "Owner", ToSay = "Overheat!"}
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
                      AttackerVar = "Attacker",
                      BuffName = "RumbleDangerZone",
                      BuffAddType = BUFF_REPLACE_EXISTING,
                      StacksExclusive = true,
                      BuffType = BUFF_Aura,
                      MaxStack = 1,
                      NumberOfStacks = 1,
                      Duration = 1,
                      BuffVarsTable = "NextBuffVars",
                      TickRate = 0,
                      CanMitigateDuration = false,
                      IsHiddenOnClient = false
                    }
                  },
                  {
                    Function = BBSetPARColorOverride,
                    Params = {
                      SpellSlotOwnerVar = "Owner",
                      ColorR = 255,
                      ColorG = 255,
                      ColorB = 0,
                      ColorA = 255,
                      FadeR = 175,
                      FadeG = 175,
                      FadeB = 0,
                      FadeA = 255
                    }
                  },
                  {
                    Function = BBIfHasBuff,
                    Params = {
                      OwnerVar = "Owner",
                      AttackerVar = "Owner",
                      BuffName = "RumbleOverheat"
                    },
                    SubBlocks = {
                      {
                        Function = BBSetPARColorOverride,
                        Params = {
                          SpellSlotOwnerVar = "Owner",
                          ColorR = 255,
                          ColorG = 225,
                          ColorB = 0,
                          ColorA = 255,
                          FadeR = 175,
                          FadeG = 0,
                          FadeB = 0,
                          FadeA = 255
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
                Function = BBSetPARColorOverride,
                Params = {
                  SpellSlotOwnerVar = "Owner",
                  ColorR = 255,
                  ColorG = 255,
                  ColorB = 255,
                  ColorA = 255,
                  FadeR = 175,
                  FadeG = 175,
                  FadeB = 0,
                  FadeA = 255
                }
              },
              {
                Function = BBSpellBuffRemove,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Owner",
                  BuffName = "RumbleOverheat"
                }
              },
              {
                Function = BBSpellBuffRemove,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Owner",
                  BuffName = "RumbleDangerZone"
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
      Name = "rumbleheatingup"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rumbleheatingup2"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rumbleoverheat"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rumbledangerzone"
    }
  }
}
