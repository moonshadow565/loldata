BuffTextureName = "Minotaur_ColossalStrength.dds"
BuffName = "APBonusDamageToTowers"
PersistsThroughDeath = true
NonDispellable = true
BuffOnDisconnectBuildingBlocks = {
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "DisconnectTimer",
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
  }
}
BuffOnAllowAddBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "MasteryJuggernaut",
      Src1VarTable = "AvatarVars",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "CCreduction",
          SrcValue = 0.9
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Owner",
          Src2Var = "Attacker",
          CompareOp = CO_DIFFERENT_TEAM
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "Type",
              Value2 = BUFF_Snare,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src1Var = "Duration",
                  Src2Var = "CCreduction",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "Duration",
                  MathOp = MO_MULTIPLY
                }
              }
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "Type",
              Value2 = BUFF_Slow,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src1Var = "Duration",
                  Src2Var = "CCreduction",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "Duration",
                  MathOp = MO_MULTIPLY
                }
              }
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "Type",
              Value2 = BUFF_Fear,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src1Var = "Duration",
                  Src2Var = "CCreduction",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "Duration",
                  MathOp = MO_MULTIPLY
                }
              }
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "Type",
              Value2 = BUFF_Net,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src1Var = "Duration",
                  Src2Var = "CCreduction",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "Duration",
                  MathOp = MO_MULTIPLY
                }
              }
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "Type",
              Value2 = BUFF_Sleep,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src1Var = "Duration",
                  Src2Var = "CCreduction",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "Duration",
                  MathOp = MO_MULTIPLY
                }
              }
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "Type",
              Value2 = BUFF_Stun,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src1Var = "Duration",
                  Src2Var = "CCreduction",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "Duration",
                  MathOp = MO_MULTIPLY
                }
              }
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "Type",
              Value2 = BUFF_Taunt,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src1Var = "Duration",
                  Src2Var = "CCreduction",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "Duration",
                  MathOp = MO_MULTIPLY
                }
              }
            }
          }
        }
      }
    }
  }
}
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "ForitfyCheck",
      SpellSlotValue = 0,
      SpellbookType = SPELLBOOK_SUMMONER,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellName
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "ForitfyCheck",
      Value2 = "SummonerFortify",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "FortifyCheck",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 25000,
          BuffVarsTable = "NextBuffVars",
          TickRate = 3,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      }
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "ForitfyCheck2",
      SpellSlotValue = 1,
      SpellbookType = SPELLBOOK_SUMMONER,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellName
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "ForitfyCheck2",
      Value2 = "SummonerFortify",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "FortifyCheck",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 25000,
          BuffVarsTable = "NextBuffVars",
          TickRate = 3,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      }
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "HealthPERC",
      OwnerVar = "Owner",
      Function = GetHealthPercent,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "MasteryInitiate",
      Src1VarTable = "AvatarVars",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "HealthPERC",
          Value2 = 0.7,
          CompareOp = CO_GREATER_THAN
        },
        SubBlocks = {
          {
            Function = BBIncStat,
            Params = {
              Stat = IncPercentMovementSpeedMod,
              TargetVar = "Owner",
              DeltaVar = "MasteryInitiateAmt",
              DeltaVarTable = "AvatarVars",
              Delta = 0
            }
          }
        }
      }
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
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
        Function = BBIf,
        Params = {
          Src1Var = "MasterySeigeCommander",
          Src1VarTable = "AvatarVars",
          Value2 = true,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBForEachUnitInTargetArea,
            Params = {
              AttackerVar = "Owner",
              CenterVar = "Owner",
              Range = 900,
              Flags = "AffectEnemies AffectTurrets ",
              IteratorVar = "Unit",
              InclusiveBuffFilter = true
            },
            SubBlocks = {
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Attacker",
                  BuffName = "MasterySiegeCommanderDebuff",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Internal,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 2,
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
BuffOnKillBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "MasteryScholar",
      Src1VarTable = "AvatarVars",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_HERO},
        SubBlocks = {
          {
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "OdinPlayerBuff"
            },
            SubBlocks = {
              {
                Function = BBIncExp,
                Params = {TargetVar = "Owner", Delta = 20}
              }
            }
          },
          {
            Function = BBElse,
            Params = {},
            SubBlocks = {
              {
                Function = BBIncExp,
                Params = {TargetVar = "Owner", Delta = 40}
              }
            }
          }
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "MasteryBounty",
      Src1VarTable = "AvatarVars",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_HERO},
        SubBlocks = {
          {
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "OdinPlayerBuff"
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src1Var = "MasteryBountyAmt",
                  Src1VarTable = "AvatarVars",
                  Src1Value = 0,
                  Src2Value = 2,
                  DestVar = "MasteryBountyAmt",
                  MathOp = MO_DIVIDE
                }
              },
              {
                Function = BBIncGold,
                Params = {
                  TargetVar = "Owner",
                  Delta = 0,
                  DeltaVar = "MasteryBountyAmt"
                }
              }
            }
          },
          {
            Function = BBElse,
            Params = {},
            SubBlocks = {
              {
                Function = BBIncGold,
                Params = {
                  TargetVar = "Owner",
                  Delta = 0,
                  DeltaVar = "MasteryBountyAmt",
                  DeltaVarTable = "AvatarVars"
                }
              }
            }
          }
        }
      }
    }
  }
}
BuffOnAssistBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "MasteryScholar",
      Src1VarTable = "AvatarVars",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_HERO},
        SubBlocks = {
          {
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "OdinPlayerBuff"
            },
            SubBlocks = {
              {
                Function = BBIncExp,
                Params = {TargetVar = "Owner", Delta = 20}
              }
            }
          },
          {
            Function = BBElse,
            Params = {},
            SubBlocks = {
              {
                Function = BBIncExp,
                Params = {TargetVar = "Owner", Delta = 40}
              }
            }
          }
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "MasteryBounty",
      Src1VarTable = "AvatarVars",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_HERO},
        SubBlocks = {
          {
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "OdinPlayerBuff"
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src1Var = "MasteryBountyAmt",
                  Src1VarTable = "AvatarVars",
                  Src1Value = 0,
                  Src2Value = 2,
                  DestVar = "MasteryBountyAmt",
                  MathOp = MO_DIVIDE
                }
              },
              {
                Function = BBIncGold,
                Params = {
                  TargetVar = "Owner",
                  Delta = 0,
                  DeltaVar = "MasteryBountyAmt"
                }
              }
            }
          },
          {
            Function = BBElse,
            Params = {},
            SubBlocks = {
              {
                Function = BBIncGold,
                Params = {
                  TargetVar = "Owner",
                  Delta = 0,
                  DeltaVar = "MasteryBountyAmt",
                  DeltaVarTable = "AvatarVars"
                }
              }
            }
          }
        }
      }
    }
  }
}
BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_TURRET},
    SubBlocks = {
      {
        Function = BBGetStat,
        Params = {
          Stat = GetFlatMagicDamageMod,
          TargetVar = "Owner",
          DestVar = "AbilityPower"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "AbilityPower",
          Src1Value = 0,
          Src2Value = 2.5,
          DestVar = "AbilityDamageToAdd",
          MathOp = MO_DIVIDE
        }
      },
      {
        Function = BBGetStat,
        Params = {
          Stat = GetFlatPhysicalDamageMod,
          TargetVar = "Owner",
          DestVar = "BonusAttackPower"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "BonusAttackPower",
          Src2Var = "AbilityDamageToAdd",
          CompareOp = CO_LESS_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "DamageAmount",
              Src2Var = "BonusAttackPower",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "DamageAmount",
              MathOp = MO_SUBTRACT
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "DamageAmount",
              Src2Var = "AbilityDamageToAdd",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "DamageAmount",
              MathOp = MO_ADD
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "MasteryDemolitionist",
          Src1VarTable = "AvatarVars",
          Value2 = true,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "MasteryDemolitionistAmt",
              Src1VarTable = "AvatarVars",
              Src2Var = "DamageAmount",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "DamageAmount",
              MathOp = MO_ADD
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
        Function = BBIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_NOT_AI},
        SubBlocks = {
          {
            Function = BBGetStat,
            Params = {
              Stat = GetFlatMagicDamageMod,
              TargetVar = "Owner",
              DestVar = "AbilityPower"
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "AbilityPower",
              Src1Value = 0,
              Src2Value = 2.5,
              DestVar = "AbilityDamageToAdd",
              MathOp = MO_DIVIDE
            }
          },
          {
            Function = BBGetStat,
            Params = {
              Stat = GetFlatPhysicalDamageMod,
              TargetVar = "Owner",
              DestVar = "BonusAttackPower"
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "BonusAttackPower",
              Src2Var = "AbilityDamageToAdd",
              CompareOp = CO_LESS_THAN_OR_EQUAL
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src1Var = "DamageAmount",
                  Src2Var = "BonusAttackPower",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "DamageAmount",
                  MathOp = MO_SUBTRACT
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "DamageAmount",
                  Src2Var = "AbilityDamageToAdd",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "DamageAmount",
                  MathOp = MO_ADD
                }
              }
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "MasteryDemolitionist",
              Src1VarTable = "AvatarVars",
              Value2 = true,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src1Var = "MasteryDemolitionistAmt",
                  Src1VarTable = "AvatarVars",
                  Src2Var = "DamageAmount",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "DamageAmount",
                  MathOp = MO_ADD
                }
              }
            }
          }
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "MasteryButcher",
      Src1VarTable = "AvatarVars",
      Value2 = true,
      CompareOp = CO_EQUAL
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
                Function = BBIf,
                Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_HERO}
              },
              {
                Function = BBElse,
                Params = {},
                SubBlocks = {
                  {
                    Function = BBMath,
                    Params = {
                      Src1Var = "MasteryButcherAmt",
                      Src1VarTable = "AvatarVars",
                      Src2Var = "DamageAmount",
                      Src1Value = 0,
                      Src2Value = 0,
                      DestVar = "DamageAmount",
                      MathOp = MO_ADD
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
BuffOnBeingHitBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "MasteryBladedArmor",
      Src1VarTable = "AvatarVars",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Attacker", CompareOp = CO_IS_TYPE_AI},
        SubBlocks = {
          {
            Function = BBIf,
            Params = {Src1Var = "Attacker", CompareOp = CO_IS_TYPE_TURRET}
          },
          {
            Function = BBElse,
            Params = {},
            SubBlocks = {
              {
                Function = BBIf,
                Params = {Src1Var = "Attacker", CompareOp = CO_IS_TYPE_HERO}
              },
              {
                Function = BBElse,
                Params = {},
                SubBlocks = {
                  {
                    Function = BBApplyDamage,
                    Params = {
                      AttackerVar = "Owner",
                      CallForHelpAttackerVar = "Owner",
                      TargetVar = "Attacker",
                      Damage = 0,
                      DamageVar = "MasteryBladedArmorAmt",
                      DamageVarTable = "AvatarVars",
                      DamageType = TRUE_DAMAGE,
                      SourceDamageType = DAMAGESOURCE_REACTIVE,
                      PercentOfAttack = 1,
                      SpellDamageRatio = 0,
                      PhysicalDamageRatio = 0,
                      IgnoreDamageIncreaseMods = false,
                      IgnoreDamageCrit = false
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
      Name = "disconnecttimer"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "fortifycheck"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "masterysiegecommanderdebuff"
    }
  }
}
