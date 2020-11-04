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
    Function = BBGetSkinID,
    Params = {
      UnitVar = "Attacker",
      SkinIDVar = "AttackerSkinID"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "AttackerSkinID",
      Value2 = 3,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "talon_ult_blade_hold_dragon.troy",
          EffectNameForOtherTeam = "talon_ult_blade_hold_team_ID_red_dragon.troy",
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
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
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
      Name = "talon_ult_blade_hold_dragon.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "talon_ult_blade_hold_team_id_red_dragon.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
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
  }
}
