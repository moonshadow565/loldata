BuffTextureName = "Heimerdinger_HextechMicroRockets.dds"
BuffName = "RumbleGrenadeAmmo"
AutoBuffActivateEffect = "Aegis_buf.troy"
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
AutoBuffActivateEffect3 = ""
AutoBuffActivateAttachBoneName3 = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "RumbleGrenadeDZ"
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Attacker",
          EffectName = "rumble_taze_tar_dangerZone_02.troy",
          Flags = 0,
          EffectIDVar = "BParticle",
          EffectIDVarTable = "InstanceVars",
          BoneName = "spike",
          TargetObjectVar = "Owner",
          TargetBoneName = "spine",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = false,
          FollowsGroundTilt = false
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Attacker",
          EffectName = "rumble_taze_tar_dangerZone.troy",
          Flags = 0,
          EffectIDVar = "CParticle",
          EffectIDVarTable = "InstanceVars",
          BoneName = "spike",
          TargetObjectVar = "Owner",
          TargetBoneName = "Bird_head",
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
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Attacker",
          EffectName = "rumble_taze_beam.troy",
          Flags = 0,
          EffectIDVar = "BParticle",
          EffectIDVarTable = "InstanceVars",
          BoneName = "spike",
          TargetObjectVar = "Owner",
          TargetBoneName = "spine",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = false,
          FollowsGroundTilt = false
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Attacker",
          EffectName = "rumble_taze_beam_tar.troy",
          Flags = 0,
          EffectIDVar = "CParticle",
          EffectIDVarTable = "InstanceVars",
          BoneName = "spike",
          TargetObjectVar = "Owner",
          TargetBoneName = "Bird_head",
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
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "CParticle",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "BParticle",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rumblegrenadedz"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "rumble_taze_tar_dangerzone_02.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "rumble_taze_tar_dangerzone.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "rumble_taze_beam.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "rumble_taze_beam_tar.troy"
    }
  }
}
