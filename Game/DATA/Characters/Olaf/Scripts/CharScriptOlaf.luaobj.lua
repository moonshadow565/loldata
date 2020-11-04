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
          Src2Value = 0.005,
          DestVar = "HealthDamage",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBSetSpellToolTipVar,
        Params = {
          Value = 0,
          ValueVar = "HealthDamage",
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
CharOnPreDamageBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "Attacker",
      Src2Var = "Owner",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetPAROrHealth,
        Params = {
          DestVar = "CurrentHealth",
          OwnerVar = "Owner",
          Function = GetHealth,
          PARType = PAR_MANA
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "CurrentHealth",
          Src2Var = "DamageAmount",
          CompareOp = CO_LESS_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "CurrentHealth",
              Src1Value = 0,
              Src2Value = 1,
              DestVar = "DamageAmount",
              MathOp = MO_SUBTRACT
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
CharOnLevelUpSpellBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "Slot",
      Value2 = 3,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIncPermanentStat,
        Params = {
          Stat = IncPermanentFlatArmorPenetrationMod,
          TargetVar = "Owner",
          Delta = 10
        }
      }
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
