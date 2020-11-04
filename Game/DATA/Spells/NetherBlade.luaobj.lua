NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "Voidwalker_NullBlade.dds"
BuffName = "NetherBlade"
AutoBuffActivateEffect = ""
SpellToggleSlot = 2
BuffOnHitUnitBuildingBlocks = {
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
      DestVar = "SpellLevel",
      SrcValueByLevel = {
        -0.02,
        -0.0275,
        -0.035,
        -0.0425,
        -0.05
      }
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
            Function = BBGetManaOrHealth,
            Params = {
              DestVar = "TargetMaxMana",
              OwnerVar = "Target",
              Function = GetMaxMana
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "TargetMaxMana",
              Src2Var = "SpellLevel",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "ManaDrainAmount",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "ManaDrainAmount",
              Src1Value = 0,
              Src2Value = -2,
              DestVar = "ManaGainAmount",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBIncMana,
            Params = {
              TargetVar = "Target",
              Delta = 0,
              DeltaVar = "ManaDrainAmount"
            }
          },
          {
            Function = BBIncMana,
            Params = {
              TargetVar = "Owner",
              Delta = 0,
              DeltaVar = "ManaGainAmount"
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Attacker",
              EffectName = "Netherblade_cas.troy",
              Flags = 0,
              EffectIDVar = "num",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWVisibilityRadius = 0,
              SendIfOnScreenOrDiscard = false
            }
          }
        }
      }
    }
  }
}
CanCastBuildingBlocks = {
  {
    Function = BBSetReturnValue,
    Params = {SrcValue = false}
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "netherblade_cas.troy"
    }
  }
}
