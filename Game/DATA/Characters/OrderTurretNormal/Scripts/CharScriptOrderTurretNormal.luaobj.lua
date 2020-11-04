CharOnActivateBuildingBlocks = {
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "TurretBonus",
      BuffAddType = BUFF_RENEW_EXISTING,
      BuffType = BUFF_Aura,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 480.1,
      BuffVarsTable = "NextBuffVars",
      TickRate = 60
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BonusHealth",
      DestVarTable = "NextBuffVars",
      SrcValue = 250
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BubbleSize",
      DestVarTable = "NextBuffVars",
      SrcValue = 800
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "TurretBonusHealth",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 1,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "TurretChampionDelta",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 25000,
      BuffVarsTable = "NextBuffVars",
      TickRate = 10
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "TurretAssistManager",
      BuffAddType = BUFF_RENEW_EXISTING,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 25000,
      BuffVarsTable = "NextBuffVars",
      TickRate = 1
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "TurretDamageManager",
      BuffAddType = BUFF_RENEW_EXISTING,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 25000,
      BuffVarsTable = "NextBuffVars",
      TickRate = 1
    }
  },
  {
    Function = BBSetDodgePiercing,
    Params = {TargetVar = "Owner", Value = true}
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "turretbonus"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "turretbonushealth"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "turretchampiondelta"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "turretassistmanager"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "turretdamagemanager"
    }
  }
}
