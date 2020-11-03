CharOnActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "spawnTime",
      DestVarTable = "NextBuffVars",
      SrcValue = 101
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "healthPerMinute",
      DestVarTable = "NextBuffVars",
      SrcValue = 31
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "damagePerMinute",
      DestVarTable = "NextBuffVars",
      SrcValue = 0.44
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "goldPerMinute",
      DestVarTable = "NextBuffVars",
      SrcValue = 0.238
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "expPerMinute",
      DestVarTable = "NextBuffVars",
      SrcValue = 1.65
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "upgradeTimer",
      DestVarTable = "NextBuffVars",
      SrcValue = false
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "GlobalMonsterBuff",
      BuffAddType = BUFF_RENEW_EXISTING,
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
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "RegenerationRuneAura",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Aura,
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
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "globalmonsterbuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "regenerationruneaura"
    }
  }
}
