UpdateSelfBuffStatsBuildingBlocks = {
  {
    Function = BBIfNotHasBuff,
    Params = {
      OwnerVar = "Owner",
      CasterVar = "Owner",
      BuffName = "EnhancedRegen"
    },
    SubBlocks = {
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
          Value2 = 1,
          CompareOp = CO_GREATER_THAN_OR_EQUAL
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
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "ManaRegenBonus",
                  DestVarTable = "NextBuffVars",
                  SrcValueByLevel = {
                    0.4,
                    0.8,
                    1.2,
                    1.6,
                    2
                  }
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Owner",
                  BuffName = "EnhancedRegen",
                  BuffAddType = BUFF_RENEW_EXISTING,
                  BuffType = BUFF_Aura,
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
  },
  {
    Function = BBGetStatus,
    Params = {
      TargetVar = "Owner",
      DestVar = "temp",
      Status = IsMoving
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "temp",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIncStat,
        Params = {
          Stat = IncFlatDodgeMod,
          TargetVar = "Owner",
          DeltaVar = "DodgeChance",
          DeltaVarTable = "CharVars",
          Delta = 0
        }
      }
    }
  }
}
SetVarsByLevelBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DodgeChance",
      DestVarTable = "CharVars",
      SrcValueByLevel = {
        0.1,
        0.1,
        0.1,
        0.1,
        0.1,
        0.15,
        0.15,
        0.15,
        0.15,
        0.15,
        0.2,
        0.2,
        0.2,
        0.2,
        0.2,
        0.25,
        0.25,
        0.25,
        0.25,
        0.25
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
      Value2 = "SpiralBlade",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "percentOfAttack",
          DestVarTable = "CharVars",
          SrcValue = 1
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
      AttackerVar = "Attacker",
      BuffName = "FleetOfFoot",
      BuffAddType = BUFF_RENEW_EXISTING,
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
      BuffName = "APBonusDamageToTowers",
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
      BuffName = "ChampionChampionDelta",
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
    Params = {
      Name = "enhancedregen"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "fleetoffoot"
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
      Name = "championchampiondelta"
    }
  }
}
