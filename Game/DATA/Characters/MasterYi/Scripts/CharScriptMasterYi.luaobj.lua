UpdateSelfBuffActionsBuildingBlocks = {
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
    Function = BBIf,
    Params = {
      Src1Var = "Level",
      Value2 = 0,
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "Cooldown",
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
          Src1Var = "Cooldown",
          Value2 = 0,
          CompareOp = CO_LESS_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "WujuStyle"
            }
          },
          {
            Function = BBElse,
            Params = {},
            SubBlocks = {
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Owner",
                  BuffName = "WujuStyle",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  BuffType = BUFF_CombatEnchancer,
                  MaxStack = 1,
                  NumberStacks = 1,
                  Duration = 25000,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0
                }
              }
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
      Value2 = "AlphaStrike",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "AlphaStrike",
          BuffAddType = BUFF_REPLACE_EXISTING,
          BuffType = BUFF_Aura,
          MaxStack = 1,
          NumberStacks = 1,
          Duration = 5,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      }
    }
  }
}
CharOnActivateBuildingBlocks = {
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Owner",
      BuffName = "DoubleStrikeIcon",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_Aura,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 25000,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "ChampionChampionDelta",
      BuffAddType = BUFF_RENEW_EXISTING,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 25000,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "APBonusDamageToTowers",
      BuffAddType = BUFF_RENEW_EXISTING,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 25000,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
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
      SlotNumber = 6,
      SlotType = InventorySlots,
      OverrideForceLevel = 1,
      OverrideCoolDownCheck = true,
      FireWithoutCasting = false,
      UseAutoAttackSpell = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "wujustyle"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "alphastrike"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "doublestrikeicon"
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
  }
}
