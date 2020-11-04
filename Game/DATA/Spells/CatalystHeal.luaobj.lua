BuffTextureName = "3010_Catalyst_the_Protector.dds"
BuffName = "CatalystHeal"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "env_manaheal.troy",
      Flags = 0,
      EffectIDVar = "cp1",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false,
      FollowsGroundTilt = false
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "cp1",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 0.5,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBIncHealth,
        Params = {
          TargetVar = "Owner",
          Delta = 15.625,
          HealerVar = "Owner"
        }
      },
      {
        Function = BBIncPAR,
        Params = {
          TargetVar = "Owner",
          Delta = 12.5,
          PARType = PAR_MANA
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "env_manaheal.troy"
    }
  }
}
