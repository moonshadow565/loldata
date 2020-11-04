BuffTextureName = "Judicator_DivineBlessing.dds"
BuffName = "Holy Fervor Aura"
AutoBuffActivateEffect = "Divineblessing_buf.troy"
AutoBuffActivateAttachBoneName = ""
PersistsThroughDeath = true
NonDispellable = true
BuffOnKillBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_HERO},
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "HolyFervorAuraDuplicate",
          BuffAddType = BUFF_STACKS_AND_RENEWS,
          BuffType = BUFF_CombatEnchancer,
          MaxStack = 4,
          NumberStacks = 1,
          Duration = 10,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "holyfervorauraduplicate"
    }
  }
}
