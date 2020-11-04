NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "BlindMonkETwo.dds"
BuffName = "BlindMonkCripple"
AutoBuffActivateEffect = "blindMonk_E_tempestFist_cripple.troy"
AutoBuffActivateEffect2 = "blindMonk_E_tempestFist_cripple_02.troy"
PopupMessage1 = "game_floatingtext_Slowed"
SpellDamageRatio = 1
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "PercentReduction",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "InitialPercentReduction",
      DestVarTable = "InstanceVars",
      SrcVar = "PercentReduction",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBApplyAssistMarker,
    Params = {
      Duration = 10,
      TargetVar = "Owner",
      SourceVar = "Attacker"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Count",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
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
        Function = BBIf,
        Params = {
          Src1Var = "Count",
          Src1VarTable = "InstanceVars",
          Value2 = 0,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "InitialPercentReduction",
              Src1VarTable = "InstanceVars",
              Src1Value = 0,
              Src2Value = 0.75,
              DestVar = "PercentReduction",
              DestVarTable = "InstanceVars",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "Count",
              DestVarTable = "InstanceVars",
              SrcValue = 1
            }
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "Count",
          Src1VarTable = "InstanceVars",
          Value2 = 1,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "InitialPercentReduction",
              Src1VarTable = "InstanceVars",
              Src1Value = 0,
              Src2Value = 0.5,
              DestVar = "PercentReduction",
              DestVarTable = "InstanceVars",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "Count",
              DestVarTable = "InstanceVars",
              SrcValue = 2
            }
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "InitialPercentReduction",
              Src1VarTable = "InstanceVars",
              Src1Value = 0,
              Src2Value = 0.25,
              DestVar = "PercentReduction",
              DestVarTable = "InstanceVars",
              MathOp = MO_MULTIPLY
            }
          }
        }
      }
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMultiplicativeMovementSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "PercentReduction",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMultiplicativeAttackSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "PercentReduction",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Attacker",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "PercentReduction",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        -0.3,
        -0.375,
        -0.45,
        -0.525,
        -0.6
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Slow,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 0,
      BuffVarsTable = "NextBuffVars",
      DurationByLevel = {
        4,
        4,
        4,
        4,
        4
      },
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  }
}
