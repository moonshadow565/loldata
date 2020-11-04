BuffTextureName = "Poppy_DiplomaticImmunity.dds"
BuffName = "PoppyDiplomaticImmunityDmg"
BuffOnPreDamageBuildingBlocks = {
  {
    Function = BBSetBuffCasterUnit,
    Params = {CasterVar = "Attacker"}
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Attacker",
      AttackerVar = "Owner",
      BuffName = "PoppyDiplomaticImmunity"
    },
    SubBlocks = {
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "Level",
          SpellSlotValue = 3,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          OwnerVar = "Attacker",
          Function = GetSlotSpellLevel
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "LevelMultiplier",
          SrcValueByLevel = {
            1.2,
            1.3,
            1.4
          }
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "DamageAmount",
          Src2Var = "LevelMultiplier",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "DamageAmount",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Target",
          AttackerVar = "Target",
          BuffName = "UndyingRage"
        },
        SubBlocks = {
          {
            Function = BBGetPAROrHealth,
            Params = {
              DestVar = "CurHealth",
              OwnerVar = "Target",
              Function = GetHealth,
              PARType = PAR_MANA
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "CurHealth",
              Src2Var = "DamageAmount",
              CompareOp = CO_LESS_THAN_OR_EQUAL
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src1Var = "CurHealth",
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
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "poppydiplomaticimmunity"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "undyingrage"
    }
  }
}
