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
      SrcValue = 42
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "damagePerMinute",
      DestVarTable = "NextBuffVars",
      SrcValue = 0.84
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "goldPerMinute",
      DestVarTable = "NextBuffVars",
      SrcValue = 0.15
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "areaDmgReduction",
      DestVarTable = "NextBuffVars",
      SrcValue = 0.2
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "expPerMinute",
      DestVarTable = "NextBuffVars",
      SrcValue = 1.08
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
      TargetVar = "Attacker",
      AttackerVar = "Attacker",
      BuffName = "GlobalMonsterBuff",
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
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "globalmonsterbuff"
    }
  }
}
