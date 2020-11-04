OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Attacker", DestVar = "TeamID"}
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "ManaToRestore",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIncPAR,
    Params = {
      TargetVar = "Attacker",
      Delta = 0,
      PARType = PAR_MANA,
      DeltaVar = "ManaToRestore",
      DeltaVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Attacker",
      EffectName = "soraka_infuse_ally_tar.troy",
      Flags = 0,
      EffectIDVar = "a",
      TargetObjectVar = "Attacker",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "TeamID",
      FOWVisibilityRadius = 10,
      SendIfOnScreenOrDiscard = true
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "soraka_infuse_ally_tar.troy"
    }
  }
}
