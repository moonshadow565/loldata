UpdateSelfBuffStatsBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "ChampionAPGain"
    }
  },
  {
    Function = BBRequireVar,
    Params = {RequiredVar = "TotalBonus", RequiredVarTable = "CharVars"}
  },
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
          Src2Var = "TotalBonus",
          Src2VarTable = "CharVars",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "TotalBonus",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "APGain",
          Src1VarTable = "CharVars",
          Src2Var = "TotalBonus",
          Src2VarTable = "CharVars",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "TotalBonus",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBSetSpellToolTipVar,
        Params = {
          Value = 0,
          ValueVar = "TotalBonus",
          Index = 1,
          SlotNumber = 0,
          SlotType = SpellSlots,
          SlotBook = SPELLBOOK_CHAMPION,
          TargetVar = "Owner"
        }
      }
    }
  },
  {
    Function = BBRequireVar,
    Params = {RequiredVar = "APGain", RequiredVarTable = "CharVars"}
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatMagicDamageMod,
      TargetVar = "Owner",
      DeltaVar = "APGain",
      DeltaVarTable = "CharVars",
      Delta = 0
    }
  }
}
CharOnKillUnitBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_HERO},
    SubBlocks = {
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "Level",
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
          Src1Var = "Level",
          Value2 = 0,
          CompareOp = CO_GREATER_THAN
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "ChampionAPGain",
              SrcValueByLevel = {
                1,
                2,
                3,
                4,
                5
              }
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "APGain",
              Src1VarTable = "CharVars",
              Src2Var = "ChampionAPGain",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "APGain",
              DestVarTable = "CharVars",
              MathOp = MO_ADD
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
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "VeigarEquilibrium",
      BuffAddType = BUFF_REPLACE_EXISTING,
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
    Function = BBSetVarInTable,
    Params = {
      DestVar = "APGain",
      DestVarTable = "CharVars",
      SrcValue = 0
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "TotalBonus",
      DestVarTable = "CharVars",
      SrcValue = 0
    }
  }
}
CharOnLevelUpSpellBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "Slot",
      Value2 = 0,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "Level",
          SpellSlotValue = 0,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          OwnerVar = "Owner",
          Function = GetSlotSpellLevel
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "BonusAP",
          DestVarTable = "NextBuffVars",
          SrcValueByLevel = {
            1,
            1,
            1,
            1,
            1
          }
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "MaxBonus",
          DestVarTable = "CharVars",
          SrcValueByLevel = {
            9999,
            9999,
            9999,
            9999,
            9999
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
      Name = "veigarequilibrium"
    }
  },
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
  }
}
