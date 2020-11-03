BuffTextureName = "Heimerdinger_TechmaturgicalRepairBots.dds"
BuffName = "TechmaturgicalIcon"
PersistsThroughDeath = true
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetBuffToolTipVar,
    Params = {Value = 10, Index = 1}
  },
  {
    Function = BBSetSpellToolTipVar,
    Params = {
      Value = 260,
      Index = 2,
      SlotNumber = 0,
      SlotType = SpellSlots,
      SlotBook = SPELLBOOK_CHAMPION,
      TargetVar = "Attacker"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBGetLevel,
    Params = {TargetVar = "Owner", DestVar = "Level"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "healthRegen",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        2,
        2,
        2,
        2,
        2,
        3,
        3,
        3,
        3,
        3,
        4,
        4,
        4,
        4,
        5,
        5,
        5,
        5
      }
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatHPRegenMod,
      TargetVar = "Owner",
      DeltaVar = "healthRegen",
      DeltaVarTable = "NextBuffVars",
      Delta = 0
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 1,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "CharVars",
      ExecuteImmediately = true
    },
    SubBlocks = {
      {
        Function = BBGetLevel,
        Params = {TargetVar = "Owner", DestVar = "Level"}
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "healthRegen",
          DestVarTable = "NextBuffVars",
          SrcValueByLevel = {
            2,
            2,
            2,
            2,
            2,
            3,
            3,
            3,
            3,
            3,
            4,
            4,
            4,
            4,
            5,
            5,
            5,
            5
          }
        }
      },
      {
        Function = BBForEachUnitInTargetArea,
        Params = {
          AttackerVar = "Owner",
          CenterVar = "Owner",
          Range = 1000,
          Flags = "AffectFriends AffectMinions AffectHeroes AffectTurrets NotAffectSelf ",
          IteratorVar = "Unit",
          InclusiveBuffFilter = true
        },
        SubBlocks = {
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Unit",
              AttackerVar = "Owner",
              BuffName = "TechmaturgicalRepairBots",
              BuffAddType = BUFF_RENEW_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Aura,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 1.25,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          }
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "baseCooldown",
          SrcValue = 25
        }
      },
      {
        Function = BBGetStat,
        Params = {
          Stat = GetPercentCooldownMod,
          TargetVar = "Owner",
          DestVar = "CooldownMod"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "CooldownMod",
          Src1Value = 1,
          Src2Value = 0,
          DestVar = "CooldownMod",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "baseCooldown",
          Src2Var = "CooldownMod",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "newCooldown",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBSetSpellToolTipVar,
        Params = {
          Value = 0,
          ValueVar = "newCooldown",
          Index = 1,
          SlotNumber = 0,
          SlotType = SpellSlots,
          SlotBook = SPELLBOOK_CHAMPION,
          TargetVar = "Attacker"
        }
      }
    }
  }
}
BuffOnPreDamageBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "Owner",
      Src2Var = "Attacker",
      CompareOp = CO_DIFFERENT_TEAM
    },
    SubBlocks = {
      {
        Function = BBIfNotHasBuff,
        Params = {
          OwnerVar = "Owner",
          CasterVar = "Owner",
          BuffName = "IfHasBuffCheck"
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {Src1Var = "Attacker", CompareOp = CO_IS_TYPE_HERO},
            SubBlocks = {
              {
                Function = BBForEachUnitInTargetArea,
                Params = {
                  AttackerVar = "Owner",
                  CenterVar = "Owner",
                  Range = 1500,
                  Flags = "AffectFriends AffectMinions ",
                  IteratorVar = "Unit",
                  BuffNameFilter = "H28GEvolutionTurret",
                  InclusiveBuffFilter = true
                },
                SubBlocks = {
                  {
                    Function = BBIfNotHasBuff,
                    Params = {
                      OwnerVar = "Unit",
                      CasterVar = "Nothing",
                      BuffName = "H28GEvolutionTurretSpell1"
                    },
                    SubBlocks = {
                      {
                        Function = BBSetTriggerUnit,
                        Params = {TriggerVar = "Attacker"}
                      },
                      {
                        Function = BBDistanceBetweenObjects,
                        Params = {
                          DestVar = "Distance",
                          ObjectVar1 = "Attacker",
                          ObjectVar2 = "Unit"
                        }
                      },
                      {
                        Function = BBIf,
                        Params = {
                          Src1Var = "Distance",
                          Value2 = 450,
                          CompareOp = CO_LESS_THAN_OR_EQUAL
                        },
                        SubBlocks = {
                          {
                            Function = BBCancelAutoAttack,
                            Params = {TargetVar = "Unit", Reset = true}
                          },
                          {
                            Function = BBSpellBuffClear,
                            Params = {
                              TargetVar = "Unit",
                              BuffName = "H28GEvolutionTurretSpell2"
                            }
                          },
                          {
                            Function = BBSpellBuffClear,
                            Params = {
                              TargetVar = "Unit",
                              BuffName = "H28GEvolutionTurretSpell3"
                            }
                          },
                          {
                            Function = BBSpellBuffAdd,
                            Params = {
                              TargetVar = "Unit",
                              AttackerVar = "Attacker",
                              BuffName = "H28GEvolutionTurretSpell1",
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
                      }
                    }
                  }
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Owner",
                  BuffName = "IfHasBuffCheck",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Internal,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 1,
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
BuffOnLevelUpBuildingBlocks = {
  {
    Function = BBGetLevel,
    Params = {TargetVar = "Owner", DestVar = "Level"}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Level",
      Value2 = 6,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "healthRegen",
          DestVarTable = "NextBuffVars",
          SrcValueByLevel = {
            2,
            2,
            2,
            2,
            2,
            3,
            3,
            3,
            3,
            3,
            4,
            4,
            4,
            4,
            5,
            5,
            5,
            5
          }
        }
      },
      {
        Function = BBSetBuffToolTipVar,
        Params = {Value = 15, Index = 1}
      },
      {
        Function = BBForEachUnitInTargetArea,
        Params = {
          AttackerVar = "Owner",
          CenterVar = "Owner",
          Range = 1000,
          Flags = "AffectFriends AffectMinions AffectHeroes AffectTurrets AlwaysSelf ",
          IteratorVar = "Unit",
          InclusiveBuffFilter = true
        },
        SubBlocks = {
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Unit",
              AttackerVar = "Owner",
              BuffName = "TechmaturgicalRepairBots",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Aura,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 1.25,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          }
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Level",
      Value2 = 11,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "healthRegen",
          DestVarTable = "NextBuffVars",
          SrcValueByLevel = {
            2,
            2,
            2,
            2,
            2,
            3,
            3,
            3,
            3,
            3,
            4,
            4,
            4,
            4,
            5,
            5,
            5,
            5
          }
        }
      },
      {
        Function = BBSetBuffToolTipVar,
        Params = {Value = 20, Index = 1}
      },
      {
        Function = BBForEachUnitInTargetArea,
        Params = {
          AttackerVar = "Owner",
          CenterVar = "Owner",
          Range = 1000,
          Flags = "AffectFriends AffectMinions AffectHeroes AffectTurrets AlwaysSelf ",
          IteratorVar = "Unit",
          InclusiveBuffFilter = true
        },
        SubBlocks = {
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Unit",
              AttackerVar = "Owner",
              BuffName = "TechmaturgicalRepairBots",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Aura,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 1.25,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          }
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Level",
      Value2 = 15,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "healthRegen",
          DestVarTable = "NextBuffVars",
          SrcValueByLevel = {
            2,
            2,
            2,
            2,
            2,
            3,
            3,
            3,
            3,
            3,
            4,
            4,
            4,
            4,
            5,
            5,
            5,
            5
          }
        }
      },
      {
        Function = BBSetBuffToolTipVar,
        Params = {Value = 25, Index = 1}
      },
      {
        Function = BBForEachUnitInTargetArea,
        Params = {
          AttackerVar = "Owner",
          CenterVar = "Owner",
          Range = 1000,
          Flags = "AffectFriends AffectMinions AffectHeroes AffectTurrets AlwaysSelf ",
          IteratorVar = "Unit",
          InclusiveBuffFilter = true
        },
        SubBlocks = {
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Unit",
              AttackerVar = "Owner",
              BuffName = "TechmaturgicalRepairBots",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Aura,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 1.25,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          }
        }
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "baseHealth", SrcValue = 260}
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "Level",
      Src1Value = 15,
      Src2Value = 0,
      DestVar = "healthByLevel",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "baseHealth",
      Src2Var = "healthByLevel",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "totalHealth",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "slotLevel",
      SpellSlotValue = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "slotLevel",
      Value2 = 4,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src2Var = "totalHealth",
          Src1Value = 125,
          Src2Value = 0,
          DestVar = "totalHealth",
          MathOp = MO_ADD
        }
      }
    }
  },
  {
    Function = BBSetSpellToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "totalHealth",
      Index = 2,
      SlotNumber = 0,
      SlotType = SpellSlots,
      SlotBook = SPELLBOOK_CHAMPION,
      TargetVar = "Attacker"
    }
  }
}
BuffOnLevelUpSpellBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "Slot",
      Value2 = 0,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetLevel,
        Params = {TargetVar = "Owner", DestVar = "Level"}
      },
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "baseHealth", SrcValue = 260}
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "Level",
          Src1Value = 15,
          Src2Value = 0,
          DestVar = "healthByLevel",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "baseHealth",
          Src2Var = "healthByLevel",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "totalHealth",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "slotLevel",
          SpellSlotValue = 0,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          OwnerVar = "Owner",
          Function = GetSlotSpellLevel
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "slotLevel",
          Value2 = 4,
          CompareOp = CO_GREATER_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src2Var = "totalHealth",
              Src1Value = 125,
              Src2Value = 0,
              DestVar = "totalHealth",
              MathOp = MO_ADD
            }
          }
        }
      },
      {
        Function = BBSetSpellToolTipVar,
        Params = {
          Value = 0,
          ValueVar = "totalHealth",
          Index = 2,
          SlotNumber = 0,
          SlotType = SpellSlots,
          SlotBook = SPELLBOOK_CHAMPION,
          TargetVar = "Attacker"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "slotLevel",
          Value2 = 1,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "baseCooldown",
              SrcValue = 25
            }
          },
          {
            Function = BBGetStat,
            Params = {
              Stat = GetPercentCooldownMod,
              TargetVar = "Owner",
              DestVar = "CooldownMod"
            }
          },
          {
            Function = BBMath,
            Params = {
              Src2Var = "CooldownMod",
              Src1Value = 1,
              Src2Value = 0,
              DestVar = "CooldownMod",
              MathOp = MO_ADD
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "baseCooldown",
              Src2Var = "CooldownMod",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "newCooldown",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "HeimerdingerTurretCounter",
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
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "HeimerdingerTurretReady",
              BuffAddType = BUFF_STACKS_AND_RENEWS,
              StacksExclusive = true,
              BuffType = BUFF_Aura,
              MaxStack = 2,
              NumberOfStacks = 1,
              Duration = 25000,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          }
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Slot",
      Value2 = 3,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "UPGRADE!!!",
          BuffAddType = BUFF_RENEW_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 20000,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "techmaturgicalrepairbots"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "ifhasbuffcheck"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "h28gevolutionturret"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "h28gevolutionturretspell1"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "h28gevolutionturretspell2"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "h28gevolutionturretspell3"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "heimerdingerturretcounter"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "heimerdingerturretready"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "upgrade!!!"}
  }
}
