NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Vladimir_TidesofBlood.dds"
BuffName = ""
AutoBuffActivateEffect = ""
TriggersSpellCasts = true
SelfExecuteBuildingBlocks = {
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
      Src2Value = 0.5,
      DestVar = "Multiplier",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Multiplier",
      Src1Value = 0,
      Src2Value = 1,
      DestVar = "Multiplier",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "HealthCost",
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
      Src1Var = "HealthCost",
      Src2Var = "Multiplier",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "HealthCost",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "Temp1",
      OwnerVar = "Owner",
      Function = GetHealth,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "HealthCost",
      Src2Var = "Temp1",
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "Temp1",
          Src1Value = 0,
          Src2Value = 1,
          DestVar = "HealthCost",
          MathOp = MO_SUBTRACT
        }
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "HealthCost",
      Src1Value = 0,
      Src2Value = -1,
      DestVar = "HealthCost",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncHealth,
    Params = {
      TargetVar = "Owner",
      Delta = 0,
      DeltaVar = "HealthCost",
      HealerVar = "Owner"
    }
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Attacker", DestVar = "CasterID"}
  },
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
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 570,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBCanSeeTarget,
        Params = {
          ViewerVar = "Owner",
          TargetVar = "Target",
          ResultVar = "CanSee"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "CanSee",
          Value2 = true,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellCast,
            Params = {
              CasterVar = "Owner",
              TargetVar = "Unit",
              PosVar = "Owner",
              EndPosVar = "Owner",
              OverrideCastPosition = false,
              SlotNumber = 4,
              SlotType = ExtraSlots,
              OverrideForceLevel = 0,
              OverrideForceLevelVar = "Level",
              OverrideCoolDownCheck = true,
              FireWithoutCasting = true,
              UseAutoAttackSpell = false,
              ForceCastingOrChannelling = false,
              UpdateAutoAttackTimer = false
            }
          }
        }
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Attacker",
      AttackerVar = "Attacker",
      BuffName = "VladimirTidesofBloodCost",
      BuffAddType = BUFF_STACKS_AND_RENEWS,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 4,
      NumberOfStacks = 1,
      Duration = 7,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Attacker",
      AttackerVar = "Attacker",
      BuffName = "VladimirTidesofBloodNuke",
      BuffAddType = BUFF_STACKS_AND_RENEWS,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 5,
      NumberOfStacks = 1,
      Duration = 7,
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
      Name = "vladimirtidesofbloodcost"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "vladimirtidesofbloodnuke"
    }
  }
}
