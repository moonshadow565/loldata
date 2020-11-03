NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
TargetExecuteBuildingBlocks = {
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
      DestVar = "BonusDamage",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        35,
        70,
        105,
        140,
        175
      }
    }
  },
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "RenektonPreExecute"
    }
  },
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_TURRET}
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBGetPAROrHealth,
            Params = {
              DestVar = "RagePercent",
              OwnerVar = "Owner",
              Function = GetPARPercent,
              PARType = PAR_OTHER
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "RagePercent",
              Value2 = 0.5,
              CompareOp = CO_GREATER_THAN_OR_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSpellCast,
                Params = {
                  CasterVar = "Attacker",
                  TargetVar = "Target",
                  OverrideCastPosition = false,
                  SlotNumber = 1,
                  SlotType = ExtraSlots,
                  OverrideForceLevel = 0,
                  OverrideForceLevelVar = "Level",
                  OverrideCoolDownCheck = true,
                  FireWithoutCasting = false,
                  UseAutoAttackSpell = false,
                  ForceCastingOrChannelling = true,
                  UpdateAutoAttackTimer = true
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "Swung",
                  DestVarTable = "CharVars",
                  SrcValue = true
                }
              }
            }
          },
          {
            Function = BBElse,
            Params = {},
            SubBlocks = {
              {
                Function = BBSpellCast,
                Params = {
                  CasterVar = "Attacker",
                  TargetVar = "Target",
                  OverrideCastPosition = false,
                  SlotNumber = 0,
                  SlotType = ExtraSlots,
                  OverrideForceLevel = 0,
                  OverrideForceLevelVar = "Level",
                  OverrideCoolDownCheck = true,
                  FireWithoutCasting = false,
                  UseAutoAttackSpell = false,
                  ForceCastingOrChannelling = true,
                  UpdateAutoAttackTimer = true
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "Swung",
                  DestVarTable = "CharVars",
                  SrcValue = true
                }
              }
            }
          }
        }
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "DamageAmount",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "DamageAmount",
      MathOp = MO_MULTIPLY
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "renektonpreexecute"
    }
  }
}
