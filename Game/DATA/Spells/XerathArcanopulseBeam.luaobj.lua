OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {
      TargetVar = "Owner",
      DestVar = "TeamOfOwner"
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetForceRenderParticles
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Attacker",
      SrcValue = true,
      Status = SetForceRenderParticles
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "TeamOfOwner",
      Value2 = TEAM_ORDER,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "XerathR_beam_warning_green.troy",
          EffectNameForOtherTeam = "XerathR_beam_warning_red.troy",
          Flags = 0,
          EffectIDVar = "ParticleID",
          EffectIDVarTable = "InstanceVars",
          EffectID2Var = "ParticleID2",
          EffectID2VarTable = "InstanceVars",
          BoneName = "bottom",
          TargetObjectVar = "Attacker",
          TargetBoneName = "bottom",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWTeamOverrideVar = "TeamOfOwner",
          FOWVisibilityRadius = 550,
          SendIfOnScreenOrDiscard = true,
          PersistsThroughReconnect = false,
          BindFlexToOwnerPAR = false,
          FollowsGroundTilt = false,
          FacesTarget = false
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "XerathR_beam_warning_green.troy",
          EffectNameForOtherTeam = "XerathR_beam_warning_red.troy",
          Flags = 0,
          EffectIDVar = "ParticleID",
          EffectIDVarTable = "InstanceVars",
          EffectID2Var = "ParticleID2",
          EffectID2VarTable = "InstanceVars",
          BoneName = "bottom",
          TargetObjectVar = "Attacker",
          TargetBoneName = "bottom",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWTeamOverrideVar = "TeamOfOwner",
          FOWVisibilityRadius = 550,
          SendIfOnScreenOrDiscard = true,
          PersistsThroughReconnect = false,
          BindFlexToOwnerPAR = false,
          FollowsGroundTilt = false,
          FacesTarget = false
        }
      }
    }
  }
}
OnBuffDeactivateBuildingBlocks = {}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "xerathr_beam_warning_green.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "xerathr_beam_warning_red.troy"
    }
  }
}
