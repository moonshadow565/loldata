NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Riven_Buffer.dds"
BuffName = "RivenTriCleaveBuff"
SpellToggleSlot = 1
SpellDamageRatio = 0.5
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetSpell,
    Params = {
      SlotNumber = 0,
      SlotType = SpellSlots,
      SlotBook = SPELLBOOK_CHAMPION,
      SpellName = "RivenTriCleave",
      TargetVar = "Owner"
    }
  },
  {
    Function = BBGetBuffRemainingDuration,
    Params = {
      DestVar = "Duration",
      TargetVar = "Owner",
      BuffName = "RivenTriCleaveCooldown"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Duration",
      Src1Value = 0,
      Src2Value = 1,
      DestVar = "Duration",
      MathOp = MO_DIVIDE
    }
  },
  {
    Function = BBSetSlotSpellCooldownTimeVer2,
    Params = {
      Src = 0,
      SrcVar = "Duration",
      SlotNumber = 0,
      SlotType = SpellSlots,
      SpellbookType = SPELLBOOK_CHAMPION,
      OwnerVar = "Owner",
      BroadcastEvent = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "riventricleave"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "riventricleavecooldown"
    }
  }
}
