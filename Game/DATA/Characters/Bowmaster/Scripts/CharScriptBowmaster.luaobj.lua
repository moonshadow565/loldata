UpdateSelfBuffStatsBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src1Var = "NumSecondsSinceLastCrit",
      Src1VarTable = "CharVars",
      Src2Var = "CritPerSecond",
      Src2VarTable = "CharVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "CritToAdd",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatCritChanceMod,
      TargetVar = "Owner",
      DeltaVar = "CritToAdd",
      Delta = 0
    }
  }
}
UpdateSelfBuffActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 3,
      TrackTimeVar = "LastCrit",
      TrackTimeVarTable = "CharVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "NumSecondsSinceLastCrit",
          Src1VarTable = "CharVars",
          Src1Value = 0,
          Src2Value = 1,
          DestVar = "NumSecondsSinceLastCrit",
          DestVarTable = "CharVars",
          MathOp = MO_ADD
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {Src1Var = "Owner", CompareOp = CO_IS_DEAD}
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "ArchersMark"
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
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
              Value2 = 0,
              CompareOp = CO_GREATER_THAN
            },
            SubBlocks = {
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Owner",
                  BuffName = "ArchersMark",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  BuffType = BUFF_Aura,
                  MaxStack = 1,
                  NumberStacks = 1,
                  Duration = 25000,
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
SetVarsByLevelBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "CritPerSecond",
      DestVarTable = "CharVars",
      SrcValueByLevel = {
        0.03,
        0.03,
        0.03,
        0.06,
        0.06,
        0.06,
        0.09,
        0.09,
        0.09,
        0.12,
        0.12,
        0.12,
        0.15,
        0.15,
        0.15,
        0.18,
        0.18,
        0.18
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
            Function = BBGetTime,
            Params = {DestVar = "LastCrit", DestVarTable = "CharVars"}
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "NumSecondsSinceLastCrit",
              DestVarTable = "CharVars",
              SrcValue = 0
            }
          }
        }
      }
    }
  }
}
CharOnSpellCastBuildingBlocks = {
  {
    Function = BBGetCastInfo,
    Params = {DestVar = "TempName", Info = GetSpellName}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "TempName",
      Value2 = "EnchantedCrystalArrow",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetUnitPosition,
        Params = {
          UnitVar = "Owner",
          PositionVar = "CastPoint",
          PositionVarTable = "CharVars"
        }
      }
    }
  }
}
CharOnActivateBuildingBlocks = {
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
      BuffName = "Focus",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_Aura,
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
      BuffAddType = BUFF_REPLACE_EXISTING,
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
      Name = "archersmark"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "focus"}
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
