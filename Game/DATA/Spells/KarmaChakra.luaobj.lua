NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "KarmaMantraActivate.dds"
BuffName = "KarmaMantraEnergized"
AutoBuffActivateEffect = "karma_matraCharge_self.troy"
SpellToggleSlot = 4
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Cooldown",
      SpellSlotValue = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellCooldownTime
    }
  },
  {
    Function = BBSetSpell,
    Params = {
      SlotNumber = 0,
      SlotType = SpellSlots,
      SlotBook = SPELLBOOK_CHAMPION,
      SpellName = "KarmaHeavenlyWaveC",
      TargetVar = "Owner"
    }
  },
  {
    Function = BBSetSlotSpellCooldownTimeVer2,
    Params = {
      Src = 0,
      SrcVar = "Cooldown",
      SlotNumber = 0,
      SlotType = SpellSlots,
      SpellbookType = SPELLBOOK_CHAMPION,
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Cooldown2",
      SpellSlotValue = 1,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellCooldownTime
    }
  },
  {
    Function = BBSetSpell,
    Params = {
      SlotNumber = 1,
      SlotType = SpellSlots,
      SlotBook = SPELLBOOK_CHAMPION,
      SpellName = "KarmaSpiritBondC",
      TargetVar = "Owner"
    }
  },
  {
    Function = BBSetSlotSpellCooldownTimeVer2,
    Params = {
      Src = 0,
      SrcVar = "Cooldown2",
      SlotNumber = 1,
      SlotType = SpellSlots,
      SpellbookType = SPELLBOOK_CHAMPION,
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Cooldown3",
      SpellSlotValue = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellCooldownTime
    }
  },
  {
    Function = BBSetSpell,
    Params = {
      SlotNumber = 2,
      SlotType = SpellSlots,
      SlotBook = SPELLBOOK_CHAMPION,
      SpellName = "KarmaSoulShieldC",
      TargetVar = "Owner"
    }
  },
  {
    Function = BBSetSlotSpellCooldownTimeVer2,
    Params = {
      Src = 0,
      SrcVar = "Cooldown3",
      SlotNumber = 2,
      SlotType = SpellSlots,
      SpellbookType = SPELLBOOK_CHAMPION,
      OwnerVar = "Owner"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBGetBuffCountFromCaster,
    Params = {
      DestVar = "Count",
      TargetVar = "Owner",
      CasterVar = "Owner",
      BuffName = "KarmaChakra"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Count",
      Value2 = 0,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "Cooldown",
          SpellSlotValue = 0,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          OwnerVar = "Owner",
          Function = GetSlotSpellCooldownTime
        }
      },
      {
        Function = BBSetSpell,
        Params = {
          SlotNumber = 0,
          SlotType = SpellSlots,
          SlotBook = SPELLBOOK_CHAMPION,
          SpellName = "KarmaHeavenlyWave",
          TargetVar = "Owner"
        }
      },
      {
        Function = BBSetSlotSpellCooldownTimeVer2,
        Params = {
          Src = 0,
          SrcVar = "Cooldown",
          SlotNumber = 0,
          SlotType = SpellSlots,
          SpellbookType = SPELLBOOK_CHAMPION,
          OwnerVar = "Owner"
        }
      },
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "Cooldown2",
          SpellSlotValue = 1,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          OwnerVar = "Owner",
          Function = GetSlotSpellCooldownTime
        }
      },
      {
        Function = BBSetSpell,
        Params = {
          SlotNumber = 1,
          SlotType = SpellSlots,
          SlotBook = SPELLBOOK_CHAMPION,
          SpellName = "KarmaSpiritBond",
          TargetVar = "Owner"
        }
      },
      {
        Function = BBSetSlotSpellCooldownTimeVer2,
        Params = {
          Src = 0,
          SrcVar = "Cooldown2",
          SlotNumber = 1,
          SlotType = SpellSlots,
          SpellbookType = SPELLBOOK_CHAMPION,
          OwnerVar = "Owner"
        }
      },
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "Cooldown3",
          SpellSlotValue = 2,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          OwnerVar = "Owner",
          Function = GetSlotSpellCooldownTime
        }
      },
      {
        Function = BBSetSpell,
        Params = {
          SlotNumber = 2,
          SlotType = SpellSlots,
          SlotBook = SPELLBOOK_CHAMPION,
          SpellName = "KarmaSoulShield",
          TargetVar = "Owner"
        }
      },
      {
        Function = BBSetSlotSpellCooldownTimeVer2,
        Params = {
          Src = 0,
          SrcVar = "Cooldown3",
          SlotNumber = 2,
          SlotType = SpellSlots,
          SpellbookType = SPELLBOOK_CHAMPION,
          OwnerVar = "Owner"
        }
      }
    }
  }
}
CanCastBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "KarmaChakraCharge"
    },
    SubBlocks = {
      {
        Function = BBSetReturnValue,
        Params = {SrcValue = true}
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSetReturnValue,
        Params = {SrcValue = false}
      }
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBSpellBuffRemoveStacks,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "KarmaChakraCharge",
      NumStacks = 1
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffAddType = BUFF_STACKS_AND_OVERLAPS,
      StacksExclusive = false,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 2,
      NumberOfStacks = 1,
      Duration = 8,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBSetSlotSpellCooldownTimeVer2,
    Params = {
      Src = 0.1,
      SlotNumber = 3,
      SlotType = SpellSlots,
      SpellbookType = SPELLBOOK_CHAMPION,
      OwnerVar = "Owner"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "karmaheavenlywavec"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "karmaspiritbondc"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "karmasoulshieldc"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "karmachakra"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "karmaheavenlywave"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "karmaspiritbond"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "karmasoulshield"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "karmachakracharge"
    }
  }
}
