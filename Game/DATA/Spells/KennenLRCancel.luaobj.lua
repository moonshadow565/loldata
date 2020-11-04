NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
IsDamagingSpell = true
AutoBuffActivateEffect = ""
SpellToggleSlot = 3
SelfExecuteBuildingBlocks = {
  {
    Function = BBSetSlotSpellCooldownTime,
    Params = {
      SrcValue = 0.5,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      SpellSlotValue = 2,
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "KennenLightningRush"
    }
  },
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "KennenLightningRushDamage"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "kennenlightningrush"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "kennenlightningrushdamage"
    }
  }
}
