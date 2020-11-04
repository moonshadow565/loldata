OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Ready",
      DestVarTable = "InstanceVars",
      SrcValue = 1
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "CassiopeiaDeath.troy",
      Flags = 0,
      EffectIDVar = "particle1",
      EffectIDVarTable = "InstanceVars",
      BoneName = "head",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "particle1",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBGetUnitPosition,
    Params = {UnitVar = "Owner", PositionVar = "CurrentPos"}
  },
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 3.25,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "Ready",
          Src1VarTable = "InstanceVars",
          Value2 = 1,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBGetPointByUnitFacingOffset,
            Params = {
              UnitVar = "Owner",
              Distance = 1,
              OffsetAngle = 220,
              PositionVar = "ForwardPosition"
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Nothing",
              PosVar = "CurrentPos",
              EffectName = "CassDeathDust.troy",
              Flags = 0,
              EffectIDVar = "particle2",
              EffectIDVarTable = "InstanceVars",
              BoneName = "BUFFBONE_CSTM_DUST",
              TargetObjectVar = "Nothing",
              SpecificUnitOnlyVar = "Nothing",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWVisibilityRadius = 0,
              SendIfOnScreenOrDiscard = true,
              OrientTowardsVar = "ForwardPosition"
            }
          },
          {
            Function = BBPushCharacterData,
            Params = {
              SkinName = "Cassiopeia_Death",
              TargetVar = "Owner",
              IDVar = "CasterID",
              IDVarTable = "InstanceVars",
              OverrideSpells = false
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "Ready",
              DestVarTable = "InstanceVars",
              SrcValue = 2
            }
          }
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "cassiopeiadeath.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "cassdeathdust.troy"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "cassiopeia_death"
    }
  }
}
