NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "Renekton_Dice.dds"
BuffName = "RenekthonSliceAndDiceDelay"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
AutoBuffActivateEffect3 = ""
SpellToggleSlot = 3
PersistsThroughDeath = true
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetSpell,
    Params = {
      SlotNumber = 2,
      SlotType = SpellSlots,
      SlotBook = SPELLBOOK_CHAMPION,
      SpellName = "RenektonDice",
      TargetVar = "Owner"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBGetBuffRemainingDuration,
    Params = {
      DestVar = "Duration",
      TargetVar = "Owner",
      BuffName = "RenektonSliceAndDiceTimer"
    }
  },
  {
    Function = BBSpellBuffClear,
    Params = {
      TargetVar = "Owner",
      BuffName = "RenektonSliceAndDiceTimer"
    }
  },
  {
    Function = BBSetSpell,
    Params = {
      SlotNumber = 2,
      SlotType = SpellSlots,
      SlotBook = SPELLBOOK_CHAMPION,
      SpellName = "RenektonSliceAndDice",
      TargetVar = "Owner"
    }
  },
  {
    Function = BBSetSlotSpellCooldownTimeVer2,
    Params = {
      Src = 0,
      SrcVar = "Duration",
      SlotNumber = 2,
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
      Name = "renektondice"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "renektonsliceanddicetimer"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "renektonsliceanddice"
    }
  }
}
