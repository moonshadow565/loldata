NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = ""
BuffName = ""
AutoBuffActivateEffect = ""
AutoBuffActivateEffect2 = ""
SpellToggleSlot = 4
PopupMessage1 = "game_floatingtext_Snared"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetSpell,
    Params = {
      SlotNumber = 3,
      SlotType = SpellSlots,
      SlotBook = SPELLBOOK_CHAMPION,
      SpellName = "FizzMarinerDoomBoom",
      TargetVar = "Owner"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetSpell,
    Params = {
      SlotNumber = 3,
      SlotType = SpellSlots,
      SlotBook = SPELLBOOK_CHAMPION,
      SpellName = "FizzMarinerDoom",
      TargetVar = "Owner"
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetPercentCooldownMod,
      TargetVar = "Owner",
      DestVar = "CDReduction"
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 3,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BaseCD",
      SrcValueByLevel = {
        40,
        35,
        30
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BaseCD",
      Src2Var = "CDReduction",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "LowerCD",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BaseCD",
      Src2Var = "LowerCD",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "NewCD",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBSetSlotSpellCooldownTimeVer2,
    Params = {
      Src = 0,
      SrcVar = "NewCD",
      SlotNumber = 3,
      SlotType = SpellSlots,
      SpellbookType = SPELLBOOK_CHAMPION,
      OwnerVar = "Owner",
      BroadcastEvent = false
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBSpellBuffClear,
    Params = {
      TargetVar = "Owner",
      BuffName = "FizzMarinerDoomMissile"
    }
  },
  {
    Function = BBForEachChampion,
    Params = {
      IteratorVar = "Unit",
      Team = TEAM_UNKNOWN,
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Unit",
          AttackerVar = "Owner",
          BuffName = "FizzMarinerDoomBomb"
        },
        SubBlocks = {
          {
            Function = BBSpellBuffClear,
            Params = {
              TargetVar = "Unit",
              BuffName = "FizzMarinerDoomBomb"
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
      Name = "fizzmarinerdoomboom"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "fizzmarinerdoom"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "fizzmarinerdoommissile"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "fizzmarinerdoombomb"
    }
  }
}
