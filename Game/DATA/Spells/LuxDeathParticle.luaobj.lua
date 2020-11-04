PersistsThroughDeath = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Lux_death.troy",
      Flags = 0,
      EffectIDVar = "particle2",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Target",
      TargetBoneName = "C_BUFFBONE_GLB_CENTER_LOC",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "lux_death.troy"
    }
  }
}
