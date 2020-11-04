NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = false
IsDamagingSpell = false
BuffTextureName = "Ryze_SpellStrike.dds"
BuffName = "Arcane Mastery"
PersistsThroughDeath = true
NonDispellable = true
BuffOnSpellCastBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "DoesntTriggerSpellCasts",
      Src1VarTable = "SpellVars",
      Value2 = true,
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetCastInfo,
        Params = {DestVar = "slot", Info = GetSpellSlot}
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "slot",
          Value2 = 0,
          CompareOp = CO_NOT_EQUAL
        },
        SubBlocks = {
          {
            Function = BBGetSlotSpellInfo,
            Params = {
              DestVar = "cooldown",
              SpellSlotValue = 0,
              SpellbookType = SPELLBOOK_CHAMPION,
              SlotType = SpellSlots,
              OwnerVar = "Owner",
              Function = GetSlotSpellCooldownTime
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "cooldown",
              Value2 = 0,
              CompareOp = CO_GREATER_THAN
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src1Var = "cooldown",
                  Src1Value = 0,
                  Src2Value = 1,
                  DestVar = "newCooldown",
                  MathOp = MO_SUBTRACT
                }
              },
              {
                Function = BBSetSlotSpellCooldownTimeVer2,
                Params = {
                  Src = 0,
                  SrcVar = "newCooldown",
                  SlotNumber = 0,
                  SlotType = SpellSlots,
                  SpellbookType = SPELLBOOK_CHAMPION,
                  OwnerVar = "Owner"
                }
              }
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "slot",
          Value2 = 1,
          CompareOp = CO_NOT_EQUAL
        },
        SubBlocks = {
          {
            Function = BBGetSlotSpellInfo,
            Params = {
              DestVar = "cooldown",
              SpellSlotValue = 1,
              SpellbookType = SPELLBOOK_CHAMPION,
              SlotType = SpellSlots,
              OwnerVar = "Owner",
              Function = GetSlotSpellCooldownTime
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "cooldown",
              Value2 = 0,
              CompareOp = CO_GREATER_THAN
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src1Var = "cooldown",
                  Src1Value = 0,
                  Src2Value = 1,
                  DestVar = "newCooldown",
                  MathOp = MO_SUBTRACT
                }
              },
              {
                Function = BBSetSlotSpellCooldownTimeVer2,
                Params = {
                  Src = 0,
                  SrcVar = "newCooldown",
                  SlotNumber = 1,
                  SlotType = SpellSlots,
                  SpellbookType = SPELLBOOK_CHAMPION,
                  OwnerVar = "Owner"
                }
              }
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "slot",
          Value2 = 2,
          CompareOp = CO_NOT_EQUAL
        },
        SubBlocks = {
          {
            Function = BBGetSlotSpellInfo,
            Params = {
              DestVar = "cooldown",
              SpellSlotValue = 2,
              SpellbookType = SPELLBOOK_CHAMPION,
              SlotType = SpellSlots,
              OwnerVar = "Owner",
              Function = GetSlotSpellCooldownTime
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "cooldown",
              Value2 = 0,
              CompareOp = CO_GREATER_THAN
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src1Var = "cooldown",
                  Src1Value = 0,
                  Src2Value = 1,
                  DestVar = "newCooldown",
                  MathOp = MO_SUBTRACT
                }
              },
              {
                Function = BBSetSlotSpellCooldownTimeVer2,
                Params = {
                  Src = 0,
                  SrcVar = "newCooldown",
                  SlotNumber = 2,
                  SlotType = SpellSlots,
                  SpellbookType = SPELLBOOK_CHAMPION,
                  OwnerVar = "Owner"
                }
              }
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "slot",
          Value2 = 3,
          CompareOp = CO_NOT_EQUAL
        },
        SubBlocks = {
          {
            Function = BBGetSlotSpellInfo,
            Params = {
              DestVar = "cooldown",
              SpellSlotValue = 3,
              SpellbookType = SPELLBOOK_CHAMPION,
              SlotType = SpellSlots,
              OwnerVar = "Owner",
              Function = GetSlotSpellCooldownTime
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "cooldown",
              Value2 = 0,
              CompareOp = CO_GREATER_THAN
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src1Var = "cooldown",
                  Src1Value = 0,
                  Src2Value = 1,
                  DestVar = "newCooldown",
                  MathOp = MO_SUBTRACT
                }
              },
              {
                Function = BBSetSlotSpellCooldownTimeVer2,
                Params = {
                  Src = 0,
                  SrcVar = "newCooldown",
                  SlotNumber = 3,
                  SlotType = SpellSlots,
                  SpellbookType = SPELLBOOK_CHAMPION,
                  OwnerVar = "Owner"
                }
              }
            }
          }
        }
      }
    }
  }
}
