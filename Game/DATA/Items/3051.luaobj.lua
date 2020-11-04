ItemOnBeingHitBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Value1 = DAMAGESOURCE_ATTACK,
      Value2 = DAMAGESOURCE_ATTACK,
      CompareOp = CO_DAMAGE_SOURCETYPE_IS
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "RenewalTunic",
          BuffAddType = BUFF_RENEW_EXISTING,
          BuffType = BUFF_Heal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 5,
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
      Name = "renewaltunic"
    }
  }
}
