PersistsThroughDeath = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 1,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Attacker",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "CooldownBonus",
      DestVarTable = "InstanceVars",
      SrcValue = 0,
      SrcValueByLevel = {
        -0.02,
        -0.04,
        -0.06,
        -0.08,
        -0.1
      }
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentCooldownMod,
      TargetVar = "Owner",
      DeltaVar = "CooldownBonus",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
