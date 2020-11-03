UpdateSelfBuffActionsBuildingBlocks = {
  {
    Function = BBIfNotHasBuff,
    Params = {
      OwnerVar = "Owner",
      CasterVar = "Owner",
      BuffName = "MasteryBlastBuff"
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "Level",
          SrcVar = "TalentLevel"
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "PercentMod",
          DestVarTable = "NextBuffVars",
          SrcValueByLevel = {
            0.0125,
            0.025,
            0.0375,
            0.05
          }
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "MasteryBlastBuff",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
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
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "masteryblastbuff"
    }
  }
}
