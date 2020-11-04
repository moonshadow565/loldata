UpdateSelfBuffActionsBuildingBlocks = {
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
      DestVar = "Scaling",
      SrcValueByLevel = {
        0.8,
        0.9,
        1,
        1.1,
        1.2
      }
    }
  },
  {
    Function = BBGetTotalAttackDamage,
    Params = {TargetVar = "Owner", DestVar = "Damagess"}
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Damagess",
      Src2Var = "Scaling",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "TTVar",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetSpellToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "TTVar",
      Index = 1,
      SlotNumber = 0,
      SlotType = SpellSlots,
      SlotBook = SPELLBOOK_CHAMPION,
      TargetVar = "Owner"
    }
  }
}
CharOnNearbyDeathBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "Owner",
      Src2Var = "Target",
      CompareOp = CO_DIFFERENT_TEAM
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
        SubBlocks = {
          {
            Function = BBIf,
            Params = {Src1Var = "Target", CompareOp = CO_IS_NOT_TURRET},
            SubBlocks = {
              {
                Function = BBGetPAROrHealth,
                Params = {
                  DestVar = "HPPre",
                  OwnerVar = "Target",
                  Function = GetMaxHealth,
                  PARType = PAR_MANA
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "HPPre",
                  Src2Var = "RegenValue",
                  Src2VarTable = "CharVars",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "HealVar",
                  MathOp = MO_MULTIPLY
                }
              },
              {
                Function = BBIncHealth,
                Params = {
                  TargetVar = "Owner",
                  Delta = 0,
                  DeltaVar = "HealVar",
                  HealerVar = "Owner"
                }
              }
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
    Function = BBGetLevel,
    Params = {TargetVar = "Owner", DestVar = "Level"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "RegenValue",
      DestVarTable = "CharVars",
      SrcValueByLevel = {
        0.02,
        0.02,
        0.02,
        0.02,
        0.03,
        0.03,
        0.03,
        0.03,
        0.04,
        0.04,
        0.04,
        0.05,
        0.05,
        0.05,
        0.06,
        0.06,
        0.06,
        0.06
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "TrundleDiseaseOverseer",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 25000,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DiseaseCounter",
      DestVarTable = "CharVars",
      SrcValue = 0
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
      DestVar = "RegenValue",
      DestVarTable = "CharVars",
      SrcValueByLevel = {
        0.02,
        0.02,
        0.02,
        0.02,
        0.03,
        0.03,
        0.03,
        0.03,
        0.04,
        0.04,
        0.04,
        0.05,
        0.05,
        0.05,
        0.06,
        0.06,
        0.06,
        0.06
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "TrundleDiseaseOverseer",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 25000,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  }
}
PreLoadBuildingBlocks = {
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
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "trundlediseaseoverseer"
    }
  }
}
