BuffTextureName = "GSB_invulnerability.dds"
BuffName = "SwainTacticalSupremacy"
PersistsThroughDeath = true
Nondispellable = true
BuffOnKillBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ManaRegenPercent",
      DestVarTable = "NextBuffVars",
      SrcValue = 1
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "SwainDampeningFieldMana",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 5,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "swaindampeningfieldmana"
    }
  }
}
