NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
BuffTextureName = "DrMundo_BurningAgony.dds"
BuffName = "BurningAgony"
AutoBuffActivateEffect = "dr_mundo_burning_agony_cas_02.troy"
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = "root"
SpellToggleSlot = 2
BuffOnAllowAddBuildingBlocks = {
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
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DurationMod",
      SrcValue = 0,
      SrcValueByLevel = {
        0.85,
        0.8,
        0.75,
        0.7,
        0.65
      }
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
              Src2Var = "DurationMod",
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
              Src2Var = "DurationMod",
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
              Src2Var = "DurationMod",
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
              Src2Var = "DurationMod",
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
              Src2Var = "DurationMod",
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
              Src2Var = "DurationMod",
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
              Src2Var = "DurationMod",
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
          Value2 = BUFF_Silence,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "Duration",
              Src2Var = "PercentReduction",
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
          Value2 = BUFF_Blind,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "Duration",
              Src2Var = "PercentReduction",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "Duration",
              MathOp = MO_MULTIPLY
            }
          }
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "Duration",
          Src1Value = 0.3,
          Src2Value = 0,
          DestVar = "Duration",
          MathOp = MO_MAX
        }
      }
    }
  }
}
OnBuffActivateBuildingBlocks = {
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
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DamageToDeal",
      SrcValueByLevel = {
        40,
        55,
        70,
        85,
        100
      }
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 325,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          CallForHelpAttackerVar = "Attacker",
          TargetVar = "Unit",
          Damage = 0,
          DamageVar = "DamageToDeal",
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELLAOE,
          PercentOfAttack = 1,
          SpellDamageRatio = 0.2,
          PhysicalDamageRatio = 1,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      }
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
        Function = BBSetVarInTable,
        Params = {
          DestVar = "HealthCost",
          SrcValueByLevel = {
            20,
            25,
            30,
            35,
            40
          }
        }
      },
      {
        Function = BBGetPAROrHealth,
        Params = {
          DestVar = "Health",
          OwnerVar = "Owner",
          Function = GetHealth,
          PARType = PAR_MANA
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "DamageToDeal",
          SrcValueByLevel = {
            40,
            55,
            70,
            85,
            100
          }
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "HealthCost",
          Src1Value = -1,
          Src2Value = 0,
          DestVar = "DamageToDealSelf",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Health",
          Src2Var = "HealthCost",
          CompareOp = CO_LESS_THAN
        },
        SubBlocks = {
          {
            Function = BBSpellBuffRemoveCurrent,
            Params = {TargetVar = "Owner"}
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBIncHealth,
            Params = {
              TargetVar = "Owner",
              Delta = 0,
              DeltaVar = "DamageToDealSelf",
              HealerVar = "Owner"
            }
          },
          {
            Function = BBForEachUnitInTargetArea,
            Params = {
              AttackerVar = "Owner",
              CenterVar = "Owner",
              Range = 325,
              Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
              IteratorVar = "Unit",
              InclusiveBuffFilter = true
            },
            SubBlocks = {
              {
                Function = BBApplyDamage,
                Params = {
                  AttackerVar = "Attacker",
                  CallForHelpAttackerVar = "Attacker",
                  TargetVar = "Unit",
                  Damage = 0,
                  DamageVar = "DamageToDeal",
                  DamageType = MAGIC_DAMAGE,
                  SourceDamageType = DAMAGESOURCE_SPELLAOE,
                  PercentOfAttack = 1,
                  SpellDamageRatio = 0.2,
                  PhysicalDamageRatio = 1,
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
CanCastBuildingBlocks = {
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "Health1",
      OwnerVar = "Owner",
      Function = GetHealth,
      PARType = PAR_MANA
    }
  },
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
    Function = BBIf,
    Params = {
      Src1Var = "Level",
      Value2 = 0,
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "HealthCost",
          SrcValueByLevel = {
            20,
            25,
            30,
            35,
            40
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "HealthCost",
          Src2Var = "Health1",
          CompareOp = CO_GREATER_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetReturnValue,
            Params = {SrcValue = false}
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBSetReturnValue,
            Params = {SrcValue = true}
          }
        }
      }
    }
  }
}
AdjustCooldownBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "BurningAgony"
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSetReturnValue,
        Params = {SrcValue = 0}
      }
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "BurningAgony"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "BurningAgony"
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
          AttackerVar = "Attacker",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_CombatEnchancer,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 30000,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false
        }
      }
    }
  }
}
