BuffName = "TalonShadowAssaultMarker"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {
      TargetVar = "Attacker",
      DestVar = "AttackerTeam"
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "talon_ult_blade_hold.troy",
      EffectNameForOtherTeam = "talon_ult_blade_hold_team_ID_red.troy",
      Flags = 0,
      EffectIDVar = "ParticleZ",
      EffectIDVarTable = "InstanceVars",
      EffectID2Var = "ParticleY",
      EffectID2VarTable = "InstanceVars",
      BoneName = "root",
      TargetObjectVar = "Attacker",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      SpecificTeamOnlyOverrideVar = "AttackerTeam",
      UseSpecificUnit = false,
      FOWTeam = TEAM_CASTER,
      FOWTeamOverrideVar = "AttackerTeam",
      FOWVisibilityRadius = 1,
      SendIfOnScreenOrDiscard = false,
      PersistsThroughReconnect = false,
      BindFlexToOwnerPAR = false,
      FollowsGroundTilt = false,
      FacesTarget = true
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "ParticleZ",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "ParticleY",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "talon_ult_blade_hold.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "talon_ult_blade_hold_team_id_red.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  }
}
