Nondispellable = true
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Owner", CompareOp = CO_IS_NOT_DEAD},
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "HeimerdingerTurretReady",
          BuffAddType = BUFF_STACKS_AND_RENEWS,
          StacksExclusive = false,
          BuffType = BUFF_Aura,
          MaxStack = 2,
          NumberOfStacks = 1,
          Duration = 25000,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      }
    }
  }
}
