UpdateSelfBuffActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 1,
      TrackTimeVar = "LastTime2Executed",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = true
    },
    SubBlocks = {
      {
        Function = BBGetStat,
        Params = {
          Stat = GetBaseAttackDamage,
          TargetVar = "Owner",
          DestVar = "BaseDamage"
        }
      },
      {
        Function = BBGetTotalAttackDamage,
        Params = {
          TargetVar = "Owner",
          DestVar = "RenekthonDamage",
          DestVarTable = "InstanceVars"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "RenekthonDamage",
          Src1VarTable = "InstanceVars",
          Src2Var = "BaseDamage",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "RenektonBonusAD",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "RenektonBonusAD",
          Src1Value = 0,
          Src2Value = 1.8,
          DestVar = "RenekthonTooltip1",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBSetSpellToolTipVar,
        Params = {
          Value = 0,
          ValueVar = "RenekthonTooltip1",
          Index = 1,
          SlotNumber = 0,
          SlotType = SpellSlots,
          SlotBook = SPELLBOOK_CHAMPION,
          TargetVar = "Owner"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "RenekthonTooltip1",
          Src1Value = 1.5,
          Src2Value = 0,
          DestVar = "RenekthonTooltip1b",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBSetSpellToolTipVar,
        Params = {
          Value = 0,
          ValueVar = "RenekthonTooltip1b",
          Index = 2,
          SlotNumber = 0,
          SlotType = SpellSlots,
          SlotBook = SPELLBOOK_CHAMPION,
          TargetVar = "Owner"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "RenekthonDamage",
          Src1VarTable = "InstanceVars",
          Src2Var = "AttackPercentage",
          Src2VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "RenekthonTooltip3",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "RenekthonTooltip3",
          Src2Var = "BonusDamage",
          Src2VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "RenekthonTooltip3",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBSetSpellToolTipVar,
        Params = {
          Value = 0,
          ValueVar = "RenekthonTooltip3",
          Index = 1,
          SlotNumber = 1,
          SlotType = SpellSlots,
          SlotBook = SPELLBOOK_CHAMPION,
          TargetVar = "Owner"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "RenekthonDamage",
          Src1VarTable = "InstanceVars",
          Src2Var = "BonusAttackPercentage",
          Src2VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "RenekthonTooltip4",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "RenekthonTooltip4",
          Src2Var = "RageBonusDamage",
          Src2VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "RenekthonTooltip4",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBSetSpellToolTipVar,
        Params = {
          Value = 0,
          ValueVar = "RenekthonTooltip4",
          Index = 2,
          SlotNumber = 1,
          SlotType = SpellSlots,
          SlotBook = SPELLBOOK_CHAMPION,
          TargetVar = "Owner"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "RenektonBonusAD",
          Src1Value = 0,
          Src2Value = 1.2,
          DestVar = "RenekthonTooltip2",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBSetSpellToolTipVar,
        Params = {
          Value = 0,
          ValueVar = "RenekthonTooltip2",
          Index = 1,
          SlotNumber = 2,
          SlotType = SpellSlots,
          SlotBook = SPELLBOOK_CHAMPION,
          TargetVar = "Owner"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "RenektonBonusAD",
          Src1Value = 0,
          Src2Value = 1.35,
          DestVar = "RenekthonTooltip5",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBSetSpellToolTipVar,
        Params = {
          Value = 0,
          ValueVar = "RenekthonTooltip5",
          Index = 2,
          SlotNumber = 2,
          SlotType = SpellSlots,
          SlotBook = SPELLBOOK_CHAMPION,
          TargetVar = "Owner"
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
      BuffName = "ChampionChampionDelta",
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
      BuffName = "RenektonPredator",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Aura,
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
    Function = BBIncPAR,
    Params = {
      TargetVar = "Owner",
      Delta = -99,
      PARType = PAR_OTHER
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "PerPercent",
      DestVarTable = "CharVars",
      SrcValue = 0.1
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BonusAttackPercentage",
      DestVarTable = "InstanceVars",
      SrcValue = 2.25
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "AttackPercentage",
      DestVarTable = "InstanceVars",
      SrcValue = 1.5
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "RageThreshold",
      DestVarTable = "CharVars",
      SrcValue = 0.5
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BonusDamage",
      DestVarTable = "CharVars",
      SrcValueByLevel = {
        10,
        30,
        50,
        70,
        90
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "RageBonusDamage",
      DestVarTable = "CharVars",
      SrcValueByLevel = {
        15,
        45,
        75,
        105,
        135
      }
    }
  }
}
CharOnLevelUpBuildingBlocks = {
  {
    Function = BBGetLevel,
    Params = {TargetVar = "Owner", DestVar = "Level"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "AutoattackRage",
      DestVarTable = "CharVars",
      SrcValue = 0,
      SrcValueByLevel = {
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5
      }
    }
  }
}
CharOnResurrectBuildingBlocks = {
  {
    Function = BBIncPAR,
    Params = {
      TargetVar = "Owner",
      Delta = -99,
      PARType = PAR_OTHER
    }
  }
}
CharOnLevelUpSpellBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "Slot",
      Value2 = 1,
      CompareOp = CO_EQUAL
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
          DestVar = "AttackPercentage",
          DestVarTable = "InstanceVars",
          SrcValueByLevel = {
            1.5,
            1.5,
            1.5,
            1.5,
            1.5
          }
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "BonusAttackPercentage",
          DestVarTable = "InstanceVars",
          SrcValueByLevel = {
            2.25,
            2.25,
            2.25,
            2.25,
            2.25
          }
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "BonusDamage",
          DestVarTable = "InstanceVars",
          SrcValueByLevel = {
            10,
            30,
            50,
            70,
            90
          }
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "RageBonusDamage",
          DestVarTable = "InstanceVars",
          SrcValueByLevel = {
            15,
            45,
            75,
            105,
            135
          }
        }
      }
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
      Name = "championchampiondelta"
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
      Name = "renektonpredator"
    }
  }
}
