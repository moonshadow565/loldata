UpdateSelfBuffStatsBuildingBlocks = {
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "ResistantSkin",
      BuffAddType = BUFF_RENEW_EXISTING,
      BuffType = BUFF_Aura,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 25000,
      BuffVarsTable = "NextBuffVars",
      TickRate = 60
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetCanAttack
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetCanMove
    }
  }
}
CharOnPreDamageBuildingBlocks = {
  {
    Function = BBIfNotHasBuff,
    Params = {
      OwnerVar = "Owner",
      CasterVar = "Owner",
      BuffName = "WrathTimer"
    },
    SubBlocks = {
      {
        Function = BBIfNotHasBuff,
        Params = {
          OwnerVar = "Owner",
          CasterVar = "Owner",
          BuffName = "SweepTimer"
        },
        SubBlocks = {
          {
            Function = BBIfNotHasBuff,
            Params = {
              OwnerVar = "Owner",
              CasterVar = "Owner",
              BuffName = "PropelTimer"
            },
            SubBlocks = {
              {
                Function = BBIfNotHasBuff,
                Params = {
                  OwnerVar = "Owner",
                  CasterVar = "Owner",
                  BuffName = "ActionTimer"
                },
                SubBlocks = {
                  {
                    Function = BBDistanceBetweenObjects,
                    Params = {
                      DestVar = "Distance",
                      ObjectVar1 = "Attacker",
                      ObjectVar2 = "Owner"
                    }
                  },
                  {
                    Function = BBIf,
                    Params = {
                      Src1Var = "Distance",
                      Value2 = 950,
                      CompareOp = CO_LESS_THAN_OR_EQUAL
                    },
                    SubBlocks = {
                      {
                        Function = BBFaceDirection,
                        Params = {TargetVar = "Owner", LocationVar = "Attacker"}
                      },
                      {
                        Function = BBSpellCast,
                        Params = {
                          CasterVar = "Owner",
                          TargetVar = "Attacker",
                          PosVar = "Owner",
                          EndPosVar = "Owner",
                          SlotNumber = 3,
                          SlotType = SpellSlots,
                          OverrideForceLevel = 1,
                          OverrideCoolDownCheck = false,
                          FireWithoutCasting = false,
                          UseAutoAttackSpell = false
                        }
                      }
                    }
                  },
                  {
                    Function = BBElse,
                    Params = {},
                    SubBlocks = {
                      {
                        Function = BBSetVarInTable,
                        Params = {
                          DestVar = "DamageAmount",
                          SrcValue = 0
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
CharOnSpellCastBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Value1 = 0.04, CompareOp = CO_RANDOM_CHANCE_LESS_THAN},
    SubBlocks = {
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "WrathCooldown"
        },
        SubBlocks = {
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "ActionTimer",
              BuffAddType = BUFF_REPLACE_EXISTING,
              BuffType = BUFF_Internal,
              MaxStack = 1,
              NumberStacks = 1,
              Duration = 1.5,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0
            }
          }
        }
      },
      {
        Function = BBIfNotHasBuff,
        Params = {
          OwnerVar = "Owner",
          CasterVar = "Owner",
          BuffName = "WrathCooldown"
        },
        SubBlocks = {
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "WrathTimer",
              BuffAddType = BUFF_REPLACE_EXISTING,
              BuffType = BUFF_Internal,
              MaxStack = 1,
              NumberStacks = 1,
              Duration = 2,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "WrathCooldown",
              BuffAddType = BUFF_REPLACE_EXISTING,
              BuffType = BUFF_Internal,
              MaxStack = 1,
              NumberStacks = 1,
              Duration = 7,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0
            }
          }
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {Value1 = 0.12, CompareOp = CO_RANDOM_CHANCE_LESS_THAN},
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "SweepTimer",
          BuffAddType = BUFF_REPLACE_EXISTING,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberStacks = 1,
          Duration = 2,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {Value1 = 0.18, CompareOp = CO_RANDOM_CHANCE_LESS_THAN},
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "PropelTimer",
          BuffAddType = BUFF_REPLACE_EXISTING,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberStacks = 1,
          Duration = 2,
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
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "ActionTimer",
          BuffAddType = BUFF_REPLACE_EXISTING,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberStacks = 1,
          Duration = 1.5,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      }
    }
  }
}
CharOnActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "teamID", SrcValue = TEAM_NEUTRAL}
  },
  {
    Function = BBAddPosPerceptionBubble,
    Params = {
      TeamVar = "teamID",
      Radius = 1600,
      PosVar = "Owner",
      Duration = 25000,
      SpecificUnitsClientOnlyVar = "Nothing",
      RevealSteath = false,
      BubbleIDVar = "Bubble",
      BubbleIDVarTable = "InstanceVars"
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
      Name = "resistantskin"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "wrathtimer"}
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "sweeptimer"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "propeltimer"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "actiontimer"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "wrathcooldown"
    }
  }
}
