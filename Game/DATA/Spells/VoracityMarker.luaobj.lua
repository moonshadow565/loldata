BuffTextureName = ""
BuffName = ""
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Owner", CompareOp = CO_IS_TYPE_HERO}
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSpellBuffRemoveCurrent,
        Params = {TargetVar = "Owner"}
      }
    }
  }
}
BuffOnDeathBuildingBlocks = {
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 25000,
      Flags = "AffectEnemies AffectHeroes ",
      IteratorVar = "Unit"
    },
    SubBlocks = {
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Unit",
          AttackerVar = "Unit",
          BuffName = "Voracity"
        },
        SubBlocks = {
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Unit",
              EffectName = "katarina_spell_refresh_indicator.troy",
              Flags = 0,
              EffectIDVar = "Placeholder",
              TargetObjectVar = "Unit",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWVisibilityRadius = 0,
              SendIfOnScreenOrDiscard = false
            }
          },
          {
            Function = BBIncGold,
            Params = {TargetVar = "Unit", Delta = 50}
          },
          {
            Function = BBSetSlotSpellCooldownTime,
            Params = {
              SrcValue = 0,
              SpellbookType = SPELLBOOK_CHAMPION,
              SlotType = SpellSlots,
              SpellSlotValue = 0,
              OwnerVar = "Unit"
            }
          },
          {
            Function = BBSetSlotSpellCooldownTime,
            Params = {
              SrcValue = 0,
              SpellbookType = SPELLBOOK_CHAMPION,
              SlotType = SpellSlots,
              SpellSlotValue = 1,
              OwnerVar = "Unit"
            }
          },
          {
            Function = BBSetSlotSpellCooldownTime,
            Params = {
              SrcValue = 0,
              SpellbookType = SPELLBOOK_CHAMPION,
              SlotType = SpellSlots,
              SpellSlotValue = 2,
              OwnerVar = "Unit"
            }
          },
          {
            Function = BBGetSlotSpellInfo,
            Params = {
              DestVar = "DLCooldown",
              SpellSlotValue = 3,
              SpellbookType = SPELLBOOK_CHAMPION,
              SlotType = SpellSlots,
              OwnerVar = "Unit",
              Function = GetSlotSpellCooldownTime
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "DLCooldown",
              Value2 = 15,
              CompareOp = CO_GREATER_THAN
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src1Var = "DLCooldown",
                  Src1Value = 0,
                  Src2Value = 15,
                  DestVar = "DLCooldown",
                  MathOp = MO_SUBTRACT
                }
              },
              {
                Function = BBSetSlotSpellCooldownTime,
                Params = {
                  SrcVar = "DLCooldown",
                  SrcValue = 0,
                  SpellbookType = SPELLBOOK_CHAMPION,
                  SlotType = SpellSlots,
                  SpellSlotValue = 3,
                  OwnerVar = "Unit"
                }
              }
            }
          },
          {
            Function = BBElse,
            Params = {},
            SubBlocks = {
              {
                Function = BBSetSlotSpellCooldownTime,
                Params = {
                  SrcValue = 0,
                  SpellbookType = SPELLBOOK_CHAMPION,
                  SlotType = SpellSlots,
                  SpellSlotValue = 3,
                  OwnerVar = "Unit"
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
    Params = {Name = "voracity"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "katarina_spell_refresh_indicator.troy"
    }
  }
}
