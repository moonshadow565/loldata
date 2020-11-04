UpdateSelfBuffActionsBuildingBlocks = {
  {
    Function = BBGetLevel,
    Params = {TargetVar = "Owner", DestVar = "TempLevel"}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "TempLevel",
      Src2Var = "OwnerLevel",
      Src2VarTable = "InstanceVars",
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Attacker",
          BuffName = "CatalystHeal",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_CombatEnchancer,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 8.5,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "OwnerLevel",
          DestVarTable = "InstanceVars",
          SrcVar = "TempLevel"
        }
      }
    }
  }
}
OnActivateBuildingBlocks = {
  {
    Function = BBGetLevel,
    Params = {
      TargetVar = "Owner",
      DestVar = "OwnerLevel",
      DestVarTable = "InstanceVars"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "catalystheal"
    }
  }
}
