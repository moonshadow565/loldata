BuffTextureName = "48thSlave_RenderingCry.dds"
BuffName = "Suppression"
PopupMessage1 = "game_floatingtext_Suppressed"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetStunned
    }
  },
  {
    Function = BBIf,
    Params = {Src1Var = "Owner", CompareOp = CO_IS_TYPE_HERO},
    SubBlocks = {
      {
        Function = BBSealSpellSlot,
        Params = {
          SpellSlot = 0,
          SpellbookType = SPELLBOOK_SUMMONER,
          SlotType = SpellSlots,
          TargetVar = "Owner",
          State = true
        }
      },
      {
        Function = BBSealSpellSlot,
        Params = {
          SpellSlot = 1,
          SpellbookType = SPELLBOOK_SUMMONER,
          SlotType = SpellSlots,
          TargetVar = "Owner",
          State = true
        }
      },
      {
        Function = BBSealSpellSlot,
        Params = {
          SpellSlot = 0,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          TargetVar = "Owner",
          State = true
        }
      },
      {
        Function = BBSealSpellSlot,
        Params = {
          SpellSlot = 1,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          TargetVar = "Owner",
          State = true
        }
      },
      {
        Function = BBSealSpellSlot,
        Params = {
          SpellSlot = 2,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          TargetVar = "Owner",
          State = true
        }
      }
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetStunned
    }
  },
  {
    Function = BBIf,
    Params = {Src1Var = "Owner", CompareOp = CO_IS_TYPE_HERO},
    SubBlocks = {
      {
        Function = BBSealSpellSlot,
        Params = {
          SpellSlot = 0,
          SpellbookType = SPELLBOOK_SUMMONER,
          SlotType = SpellSlots,
          TargetVar = "Owner",
          State = false
        }
      },
      {
        Function = BBSealSpellSlot,
        Params = {
          SpellSlot = 1,
          SpellbookType = SPELLBOOK_SUMMONER,
          SlotType = SpellSlots,
          TargetVar = "Owner",
          State = false
        }
      },
      {
        Function = BBSealSpellSlot,
        Params = {
          SpellSlot = 0,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          TargetVar = "Owner",
          State = false
        }
      },
      {
        Function = BBSealSpellSlot,
        Params = {
          SpellSlot = 1,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          TargetVar = "Owner",
          State = false
        }
      },
      {
        Function = BBSealSpellSlot,
        Params = {
          SpellSlot = 2,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          TargetVar = "Owner",
          State = false
        }
      }
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetStunned
    }
  },
  {
    Function = BBIf,
    Params = {Src1Var = "Owner", CompareOp = CO_IS_TYPE_HERO},
    SubBlocks = {
      {
        Function = BBSealSpellSlot,
        Params = {
          SpellSlot = 0,
          SpellbookType = SPELLBOOK_SUMMONER,
          SlotType = SpellSlots,
          TargetVar = "Owner",
          State = true
        }
      },
      {
        Function = BBSealSpellSlot,
        Params = {
          SpellSlot = 1,
          SpellbookType = SPELLBOOK_SUMMONER,
          SlotType = SpellSlots,
          TargetVar = "Owner",
          State = true
        }
      },
      {
        Function = BBSealSpellSlot,
        Params = {
          SpellSlot = 0,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          TargetVar = "Owner",
          State = true
        }
      },
      {
        Function = BBSealSpellSlot,
        Params = {
          SpellSlot = 1,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          TargetVar = "Owner",
          State = true
        }
      },
      {
        Function = BBSealSpellSlot,
        Params = {
          SpellSlot = 2,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          TargetVar = "Owner",
          State = true
        }
      }
    }
  }
}
