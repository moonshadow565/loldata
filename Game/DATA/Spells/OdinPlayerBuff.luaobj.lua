BuffTextureName = "CrystalScarsAura.dds"
BuffName = "OdinPlayerBuff"
PersistsThroughDeath = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "CooldownVar",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "TotalDamageOT",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBGetLevel,
    Params = {TargetVar = "Owner", DestVar = "Level"}
  },
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "PercentMana",
      OwnerVar = "Owner",
      Function = GetPARPercent,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "PercentMana",
      Src1Value = 1,
      Src2Value = 0,
      DestVar = "PercentMissing",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "PercentMissing",
      Src1Value = 0,
      Src2Value = 2.1,
      DestVar = "PercentMissing",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncPercentPARRegenMod,
    Params = {
      PARType = PAR_MANA,
      TargetVar = "Owner",
      DeltaVar = "PercentMissing",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentArmorPenetrationMod,
      TargetVar = "Owner",
      Delta = 0.12
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMagicPenetrationMod,
      TargetVar = "Owner",
      Delta = 0.05
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
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
        Function = BBMath,
        Params = {
          Src1Var = "TotalDamageOT",
          Src1VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 0.9,
          DestVar = "TotalDamageOT",
          DestVarTable = "InstanceVars",
          MathOp = MO_MULTIPLY
        }
      }
    }
  }
}
BuffOnTakeDamageBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src1Var = "TotalDamageOT",
      Src1VarTable = "InstanceVars",
      Src2Var = "DamageAmount",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "TotalDamageOT",
      DestVarTable = "InstanceVars",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBIf,
    Params = {Src1Var = "Attacker", CompareOp = CO_IS_TYPE_HERO},
    SubBlocks = {
      {
        Function = BBGetPAROrHealth,
        Params = {
          DestVar = "HP_Percent",
          OwnerVar = "Owner",
          Function = GetHealthPercent,
          PARType = PAR_MANA
        }
      },
      {
        Function = BBGetPAROrHealth,
        Params = {
          DestVar = "MaxHealth",
          OwnerVar = "Owner",
          Function = GetMaxHealth,
          PARType = PAR_MANA
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "TotalDamageOT",
          Src1VarTable = "InstanceVars",
          Src2Var = "MaxHealth",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "DamagePercent",
          MathOp = MO_DIVIDE
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "HP_Percent",
          Value2 = 0.4,
          CompareOp = CO_LESS_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Attacker",
              AttackerVar = "Owner",
              BuffName = "OdinScoreLowHPAttacker",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Internal,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 10,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "DamagePercent",
              Value2 = 0.2,
              CompareOp = CO_GREATER_THAN
            },
            SubBlocks = {
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Owner",
                  BuffName = "OdinScoreLowHP",
                  BuffAddType = BUFF_RENEW_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Internal,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 10,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = false
                }
              }
            }
          },
          {
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "OdinScoreLowHP"
            },
            SubBlocks = {
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Owner",
                  BuffName = "OdinScoreLowHP",
                  BuffAddType = BUFF_RENEW_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Internal,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 10,
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
BuffOnDealDamageBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_HERO},
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Attacker",
          BuffName = "CallForHelp",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
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
BuffOnKillBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_HERO},
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "OdinScoreAvengerTarget",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 15,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Owner",
          BuffName = "OdinScoreKiller",
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
BuffOnDeathBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "TotalDamageOT",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  }
}
BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_HERO},
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Owner",
          BuffName = "CallForHelp",
          BuffAddType = BUFF_RENEW_EXISTING,
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
BuffOnHealBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "Health",
      Value2 = 0,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "Health",
          Src1Value = 0,
          Src2Value = 0.8,
          DestVar = "EffectiveHeal",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBSetReturnValue,
        Params = {
          SrcVar = "EffectiveHeal"
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Owner",
      Src2Var = "Target",
      CompareOp = CO_SAME_TEAM
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_HERO},
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "Target",
              Src2Var = "Owner",
              CompareOp = CO_NOT_EQUAL
            },
            SubBlocks = {
              {
                Function = BBIf,
                Params = {
                  Src1Var = "EffectiveHeal",
                  Value2 = 30,
                  CompareOp = CO_GREATER_THAN_OR_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBIfHasBuff,
                    Params = {
                      OwnerVar = "Owner",
                      AttackerVar = "Owner",
                      BuffName = "OdinScoreLowHP"
                    },
                    SubBlocks = {
                      {
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Target",
                          AttackerVar = "Owner",
                          BuffName = "OdinScoreArchAngel",
                          BuffAddType = BUFF_REPLACE_EXISTING,
                          StacksExclusive = true,
                          BuffType = BUFF_Internal,
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
                  },
                  {
                    Function = BBElse,
                    Params = {},
                    SubBlocks = {
                      {
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Target",
                          AttackerVar = "Owner",
                          BuffName = "OdinScoreAngel",
                          BuffAddType = BUFF_REPLACE_EXISTING,
                          StacksExclusive = true,
                          BuffType = BUFF_Internal,
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
BuffOnAllowAddBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "Owner",
      Src2Var = "Attacker",
      CompareOp = CO_SAME_TEAM
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Attacker", CompareOp = CO_IS_TYPE_HERO},
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "Attacker",
              Src2Var = "Owner",
              CompareOp = CO_NOT_EQUAL
            },
            SubBlocks = {
              {
                Function = BBIf,
                Params = {
                  Src1Var = "Type",
                  Value2 = BUFF_CombatEnchancer,
                  CompareOp = CO_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBIfHasBuff,
                    Params = {
                      OwnerVar = "Owner",
                      AttackerVar = "Owner",
                      BuffName = "OdinScoreLowHP"
                    },
                    SubBlocks = {
                      {
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Target",
                          AttackerVar = "Owner",
                          BuffName = "OdinScoreArchAngel",
                          BuffAddType = BUFF_REPLACE_EXISTING,
                          StacksExclusive = true,
                          BuffType = BUFF_Internal,
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
                  },
                  {
                    Function = BBElse,
                    Params = {},
                    SubBlocks = {
                      {
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Attacker",
                          AttackerVar = "Owner",
                          BuffName = "OdinScoreAngel",
                          BuffAddType = BUFF_REPLACE_EXISTING,
                          StacksExclusive = true,
                          BuffType = BUFF_Internal,
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
              },
              {
                Function = BBIf,
                Params = {
                  Src1Var = "Type",
                  Value2 = BUFF_Haste,
                  CompareOp = CO_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBIfHasBuff,
                    Params = {
                      OwnerVar = "Owner",
                      AttackerVar = "Owner",
                      BuffName = "OdinScoreLowHP"
                    },
                    SubBlocks = {
                      {
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Target",
                          AttackerVar = "Owner",
                          BuffName = "OdinScoreArchAngel",
                          BuffAddType = BUFF_REPLACE_EXISTING,
                          StacksExclusive = true,
                          BuffType = BUFF_Internal,
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
                  },
                  {
                    Function = BBElse,
                    Params = {},
                    SubBlocks = {
                      {
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Attacker",
                          AttackerVar = "Owner",
                          BuffName = "OdinScoreAngel",
                          BuffAddType = BUFF_REPLACE_EXISTING,
                          StacksExclusive = true,
                          BuffType = BUFF_Internal,
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
              },
              {
                Function = BBIf,
                Params = {
                  Src1Var = "Type",
                  Value2 = BUFF_Invulnerability,
                  CompareOp = CO_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBIfHasBuff,
                    Params = {
                      OwnerVar = "Owner",
                      AttackerVar = "Owner",
                      BuffName = "OdinScoreLowHP"
                    },
                    SubBlocks = {
                      {
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Target",
                          AttackerVar = "Owner",
                          BuffName = "OdinScoreArchAngel",
                          BuffAddType = BUFF_REPLACE_EXISTING,
                          StacksExclusive = true,
                          BuffType = BUFF_Internal,
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
                  },
                  {
                    Function = BBElse,
                    Params = {},
                    SubBlocks = {
                      {
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Attacker",
                          AttackerVar = "Owner",
                          BuffName = "OdinScoreAngel",
                          BuffAddType = BUFF_REPLACE_EXISTING,
                          StacksExclusive = true,
                          BuffType = BUFF_Internal,
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
              },
              {
                Function = BBIf,
                Params = {
                  Src1Var = "Type",
                  Value2 = BUFF_Heal,
                  CompareOp = CO_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBIfHasBuff,
                    Params = {
                      OwnerVar = "Owner",
                      AttackerVar = "Owner",
                      BuffName = "OdinScoreLowHP"
                    },
                    SubBlocks = {
                      {
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Target",
                          AttackerVar = "Owner",
                          BuffName = "OdinScoreArchAngel",
                          BuffAddType = BUFF_REPLACE_EXISTING,
                          StacksExclusive = true,
                          BuffType = BUFF_Internal,
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
                  },
                  {
                    Function = BBElse,
                    Params = {},
                    SubBlocks = {
                      {
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Attacker",
                          AttackerVar = "Owner",
                          BuffName = "OdinScoreAngel",
                          BuffAddType = BUFF_REPLACE_EXISTING,
                          StacksExclusive = true,
                          BuffType = BUFF_Internal,
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
              },
              {
                Function = BBIf,
                Params = {
                  Src1Var = "Type",
                  Value2 = BUFF_PhysicalImmunity,
                  CompareOp = CO_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBIfHasBuff,
                    Params = {
                      OwnerVar = "Owner",
                      AttackerVar = "Owner",
                      BuffName = "OdinScoreLowHP"
                    },
                    SubBlocks = {
                      {
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Target",
                          AttackerVar = "Owner",
                          BuffName = "OdinScoreArchAngel",
                          BuffAddType = BUFF_REPLACE_EXISTING,
                          StacksExclusive = true,
                          BuffType = BUFF_Internal,
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
                  },
                  {
                    Function = BBElse,
                    Params = {},
                    SubBlocks = {
                      {
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Attacker",
                          AttackerVar = "Owner",
                          BuffName = "OdinScoreAngel",
                          BuffAddType = BUFF_REPLACE_EXISTING,
                          StacksExclusive = true,
                          BuffType = BUFF_Internal,
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
      Name = "odinscorelowhpattacker"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinscorelowhp"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "callforhelp"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinscoreavengertarget"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinscorekiller"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinscorearchangel"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinscoreangel"
    }
  }
}
