BuffName = "LeonaZenithBladeBuffOrder"
AutoBuffActivateEffect = ""
PersistsThroughDeath = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetUnitPosition,
    Params = {UnitVar = "Owner", PositionVar = "OwnerPos"}
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Nothing",
      PosVar = "OwnerPos",
      EffectName = "Leona_ZenithBlade_tar.troy",
      Flags = 0,
      EffectIDVar = "b",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Nothing",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "b",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "Leona_ZenithBlade_tar.troy"
    }
  }
}
