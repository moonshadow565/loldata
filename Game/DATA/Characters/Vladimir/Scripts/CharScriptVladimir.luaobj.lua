UpdateSelfBuffStatsBuildingBlocks = {
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "maxHP",
      OwnerVar = "Owner",
      Function = GetMaxHealth,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "baseHP", SrcValue = 400}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "healthPerLevel",
      SrcValue = 85
    }
  },
  {
    Function = BBGetLevel,
    Params = {TargetVar = "Owner", DestVar = "Level"}
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Level",
      Src2Var = "healthPerLevel",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "levelHealth",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "levelHealth",
      Src2Var = "baseHP",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "totalBaseHealth",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "maxHP",
      Src2Var = "totalBaseHealth",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "totalBonusHealth",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "totalBonusHealth",
      Src1Value = 0,
      Src2Value = 0.15,
      DestVar = "totalBonusHealth",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetSpellToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "totalBonusHealth",
      Index = 1,
      SlotNumber = 1,
      SlotType = SpellSlots,
      SlotBook = SPELLBOOK_CHAMPION,
      TargetVar = "Owner"
    }
  }
}
UpdateSelfBuffActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 0.4,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Owner", CompareOp = CO_IS_DEAD},
        SubBlocks = {
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "VladDeathParticle",
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
          }
        }
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
              BuffName = "VladDeathParticle"
            },
            SubBlocks = {
              {
                Function = BBSpellBuffRemove,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Owner",
                  BuffName = "VladDeathParticle"
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
      BuffName = "VladimirBloodGorged",
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
      BuffName = "ChampionChampionDelta",
      BuffAddType = BUFF_REPLACE_EXISTING,
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
  }
}
CharOnHealBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "VladimirTidesofBloodCost"
    },
    SubBlocks = {
      {
        Function = BBGetBuffCountFromAll,
        Params = {
          DestVar = "Count",
          TargetVar = "Owner",
          BuffName = "VladimirTidesofBloodCost"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "Count",
          Src1Value = 0,
          Src2Value = 0.08,
          DestVar = "Heal%",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "Heal%",
          Src1Value = 0,
          Src2Value = 1,
          DestVar = "Heal%",
          MathOp = MO_ADD
        }
      },
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
              Src2Var = "Heal%",
              Src1Value = 0,
              Src2Value = 0,
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
      Name = "vladdeathparticle"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "vladimirbloodgorged"
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
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "vladimirtidesofbloodcost"
    }
  }
}
