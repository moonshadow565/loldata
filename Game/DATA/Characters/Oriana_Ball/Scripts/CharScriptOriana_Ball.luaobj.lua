CharOnActivateBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBGetChampionBySkinName,
    Params = {
      Skin = "Oriana",
      Team = TEAM_UNKNOWN,
      TeamVar = "TeamID",
      DestVar = "Caster"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Caster",
      BuffName = "OrianaGhost",
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
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Caster",
      BuffName = "OrianaGhostMinion",
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
  },
  {
    Function = BBGetUnitPosition,
    Params = {UnitVar = "Owner", PositionVar = "MyPosition"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MyPosition",
      DestVarTable = "NextBuffVars",
      SrcVar = "MyPosition"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Caster",
      AttackerVar = "Owner",
      BuffName = "OriannaBallTracker",
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
    Function = BBPreloadCharacter,
    Params = {Name = "oriana"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "orianaghost"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "orianaghostminion"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "oriannaballtracker"
    }
  }
}
