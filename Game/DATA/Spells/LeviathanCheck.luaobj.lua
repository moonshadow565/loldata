PersistsThroughDeath = true
Nondispellable = true
BuffOnKillBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_HERO},
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Attacker",
          AttackerVar = "Attacker",
          BuffName = "LeviathanStats",
          BuffAddType = BUFF_STACKS_AND_RENEWS,
          BuffType = BUFF_Internal,
          MaxStack = 10,
          NumberStacks = 1,
          Duration = 25000,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      }
    }
  }
}
BuffOnAssistBuildingBlocks = {
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "LeviathanStats",
      BuffAddType = BUFF_STACKS_AND_RENEWS,
      BuffType = BUFF_Internal,
      MaxStack = 10,
      NumberStacks = 1,
      Duration = 25000,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "leviathanstats"
    }
  }
}
