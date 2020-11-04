UpdateSelfBuffActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 1,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = true
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
              DestVar = "BaseDamage",
              SrcValueByLevel = {
                12,
                18,
                24,
                30,
                36
              }
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "HealthPercent",
              SrcValueByLevel = {
                0.004,
                0.007,
                0.01,
                0.013,
                0.016
              }
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
              Src1Var = "MaxHealth",
              Src2Var = "HealthPercent",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "HealthDamage",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "BaseDamage",
              Src2Var = "HealthDamage",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "BonusDamage",
              DestVarTable = "InstanceVars",
              MathOp = MO_ADD
            }
          },
          {
            Function = BBSetSpellToolTipVar,
            Params = {
              Value = 0,
              ValueVar = "BonusDamage",
              ValueVarTable = "InstanceVars",
              Index = 1,
              SlotNumber = 1,
              SlotType = SpellSlots,
              SlotBook = SPELLBOOK_CHAMPION,
              TargetVar = "Owner"
            }
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
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
              Src1Var = "MaxHealth",
              Src1Value = 0,
              Src2Value = 0.004,
              DestVar = "HealthDamage",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBMath,
            Params = {
              Src2Var = "HealthDamage",
              Src1Value = 12,
              Src2Value = 0,
              DestVar = "BonusDamage",
              DestVarTable = "InstanceVars",
              MathOp = MO_ADD
            }
          },
          {
            Function = BBSetSpellToolTipVar,
            Params = {
              Value = 0,
              ValueVar = "BonusDamage",
              ValueVarTable = "InstanceVars",
              Index = 1,
              SlotNumber = 1,
              SlotType = SpellSlots,
              SlotBook = SPELLBOOK_CHAMPION,
              TargetVar = "Owner"
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
    Params = {DestVar = "SpellName", Info = GetSpellName}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "SpellName",
      Value2 = "OlafAxeThrow",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetCastSpellTargetPos,
        Params = {DestVar = "TargetPos"}
      },
      {
        Function = BBDistanceBetweenObjectAndPoint,
        Params = {
          DestVar = "Distance",
          ObjectVar = "Owner",
          PointVar = "TargetPos"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "Distance",
          Src1Value = 50,
          Src2Value = 0,
          DestVar = "Distance",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBGetPointByUnitFacingOffset,
        Params = {
          UnitVar = "Owner",
          Distance = 0,
          DistanceVar = "Distance",
          OffsetAngle = 0,
          PositionVar = "FacingPos"
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "FacingPos",
          DestVarTable = "NextBuffVars",
          SrcVar = "FacingPos"
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "TargetPos",
          DestVarTable = "NextBuffVars",
          SrcVar = "TargetPos"
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "OlafAxeThrow",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 2,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false
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
      BuffName = "OlafBerzerkerRage",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Aura,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 25000,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
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
      CanMitigateDuration = false
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
      CanMitigateDuration = false
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
      Src1Var = "MaxHealth",
      Src1Value = 0,
      Src2Value = 0.004,
      DestVar = "HealthDamage",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "HealthDamage",
      Src1Value = 12,
      Src2Value = 0,
      DestVar = "BonusDamage",
      DestVarTable = "InstanceVars",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBSetSpellToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "BonusDamage",
      ValueVarTable = "InstanceVars",
      Index = 1,
      SlotNumber = 1,
      SlotType = SpellSlots,
      SlotBook = SPELLBOOK_CHAMPION,
      TargetVar = "Owner"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "olafaxethrow"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "olafberzerkerrage"
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
      Name = "championchampiondelta"
    }
  }
}
