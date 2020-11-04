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
        -0.03,
        -0.06,
        -0.09,
        -0.12,
        -0.15
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
