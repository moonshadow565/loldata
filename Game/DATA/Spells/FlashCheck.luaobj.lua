PersistsThroughDeath = true
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "flashSlot",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnPreDamageBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Attacker", CompareOp = CO_IS_TYPE_TURRET},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "flashSlot",
          Src1VarTable = "InstanceVars",
          Value2 = 0,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBGetSlotSpellInfo,
            Params = {
              DestVar = "CurrentCooldown",
              SpellSlotValue = 0,
              SpellbookType = SPELLBOOK_SUMMONER,
              SlotType = SpellSlots,
              OwnerVar = "Owner",
              Function = GetSlotSpellCooldownTime
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "CurrentCooldown",
              Value2 = 3,
              CompareOp = CO_LESS_THAN_OR_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSetSlotSpellCooldownTime,
                Params = {
                  SrcValue = 3,
                  SpellbookType = SPELLBOOK_SUMMONER,
                  SlotType = SpellSlots,
                  SpellSlotValue = 0,
                  OwnerVar = "Owner"
                }
              }
            }
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBGetSlotSpellInfo,
            Params = {
              DestVar = "CurrentCooldown",
              SpellSlotValue = 1,
              SpellbookType = SPELLBOOK_SUMMONER,
              SlotType = SpellSlots,
              OwnerVar = "Owner",
              Function = GetSlotSpellCooldownTime
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "CurrentCooldown",
              Value2 = 3,
              CompareOp = CO_LESS_THAN_OR_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSetSlotSpellCooldownTime,
                Params = {
                  SrcValue = 3,
                  SpellbookType = SPELLBOOK_SUMMONER,
                  SlotType = SpellSlots,
                  SpellSlotValue = 1,
                  OwnerVar = "Owner"
                }
              }
            }
          }
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {Src1Var = "Attacker", CompareOp = CO_IS_TYPE_HERO},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "flashSlot",
          Src1VarTable = "InstanceVars",
          Value2 = 0,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBGetSlotSpellInfo,
            Params = {
              DestVar = "CurrentCooldown",
              SpellSlotValue = 0,
              SpellbookType = SPELLBOOK_SUMMONER,
              SlotType = SpellSlots,
              OwnerVar = "Owner",
              Function = GetSlotSpellCooldownTime
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "CurrentCooldown",
              Value2 = 3,
              CompareOp = CO_LESS_THAN_OR_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSetSlotSpellCooldownTime,
                Params = {
                  SrcValue = 3,
                  SpellbookType = SPELLBOOK_SUMMONER,
                  SlotType = SpellSlots,
                  SpellSlotValue = 0,
                  OwnerVar = "Owner"
                }
              }
            }
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBGetSlotSpellInfo,
            Params = {
              DestVar = "CurrentCooldown",
              SpellSlotValue = 1,
              SpellbookType = SPELLBOOK_SUMMONER,
              SlotType = SpellSlots,
              OwnerVar = "Owner",
              Function = GetSlotSpellCooldownTime
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "CurrentCooldown",
              Value2 = 3,
              CompareOp = CO_LESS_THAN_OR_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSetSlotSpellCooldownTime,
                Params = {
                  SrcValue = 3,
                  SpellbookType = SPELLBOOK_SUMMONER,
                  SlotType = SpellSlots,
                  SpellSlotValue = 1,
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
