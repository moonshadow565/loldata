BuffTextureName = "GSB_invulnerability.dds"
BuffName = "SwainTacticalSupremacy"
PersistsThroughDeath = true
Nondispellable = true
BuffOnKillBuildingBlocks = {
  {
    Function = BBGetLevel,
    Params = {TargetVar = "Owner", DestVar = "Level"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BaseManaRegen",
      DestVarTable = "NextBuffVars",
      SrcValue = 0,
      SrcValueByLevel = {
        0.95,
        1.04,
        1.12,
        1.21,
        1.3,
        1.39,
        1.48,
        1.57,
        1.66,
        1.75,
        1.84,
        1.93,
        2.02,
        2.11,
        2.2,
        2.29,
        2.38,
        2.47
      }
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
