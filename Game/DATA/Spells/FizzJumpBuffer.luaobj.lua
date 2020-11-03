NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
BuffTextureName = "AkaliCrescentSlash.dds"
BuffName = "RenekthonCleaveReady"
SpellToggleSlot = 1
SpellDamageRatio = 0.5
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetSpell,
    Params = {
      SlotNumber = 2,
      SlotType = SpellSlots,
      SlotBook = SPELLBOOK_CHAMPION,
      SpellName = "FizzJumpBuffer",
      TargetVar = "Owner"
    }
  },
  {
    Function = BBSetSlotSpellCooldownTimeVer2,
    Params = {
      Src = 0.15,
      SlotNumber = 2,
      SlotType = SpellSlots,
      SpellbookType = SPELLBOOK_CHAMPION,
      OwnerVar = "Owner",
      BroadcastEvent = false
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBGetCastSpellTargetPos,
    Params = {DestVar = "JumpBuffer"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "JumpBuffer",
      DestVarTable = "CharVars",
      SrcVar = "JumpBuffer"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "FizzJumpBuffered",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 1,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "fizzjumpbuffer"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "fizzjumpbuffered"
    }
  }
}
