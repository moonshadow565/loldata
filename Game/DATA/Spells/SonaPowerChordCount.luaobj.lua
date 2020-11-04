BuffTextureName = "Sona_PowerChord.dds"
BuffName = "SonaPowerChordCount"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetBuffCountFromCaster,
    Params = {
      DestVar = "Count",
      TargetVar = "Owner",
      CasterVar = "Owner",
      BuffName = "SonaPowerChordCount"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Count",
      Value2 = 3,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "SonaPowerChord",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_CombatEnchancer,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 25000,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false
        }
      },
      {
        Function = BBSpellBuffRemoveStacks,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "SonaPowerChordCount",
          NumStacks = 0
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sonapowerchordcount"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sonapowerchord"
    }
  }
}
