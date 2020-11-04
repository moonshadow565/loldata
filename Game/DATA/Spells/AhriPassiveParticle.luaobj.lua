BuffTextureName = "Ahri_SoulEater.dds"
BuffName = "AhriSoulCrusher"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
PersistsThroughDeath = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ParticleAlive",
      DestVarTable = "InstanceVars",
      SrcValue = false
    }
  },
  {
    Function = BBIf,
    Params = {Src1Var = "Owner", CompareOp = CO_IS_NOT_DEAD},
    SubBlocks = {
      {
        Function = BBGetTeamID,
        Params = {TargetVar = "Owner", DestVar = "TeamID"}
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "Ahri_Passive.troy",
          Flags = 0,
          EffectIDVar = "Particle1",
          EffectIDVarTable = "InstanceVars",
          BoneName = "BUFFBONE_GLB_WEAPON_1",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWTeamOverrideVar = "TeamID",
          FOWVisibilityRadius = 10,
          SendIfOnScreenOrDiscard = false,
          PersistsThroughReconnect = false,
          BindFlexToOwnerPAR = false,
          FollowsGroundTilt = false,
          FacesTarget = false
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "ParticleAlive",
          DestVarTable = "InstanceVars",
          SrcValue = true
        }
      }
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "Particle1",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
BuffOnDeathBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "Particle1",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ParticleAlive",
      DestVarTable = "InstanceVars",
      SrcValue = false
    }
  }
}
BuffOnResurrectBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "ParticleAlive",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectRemove,
        Params = {
          EffectIDVar = "Particle1",
          EffectIDVarTable = "InstanceVars"
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "ParticleAlive",
          DestVarTable = "InstanceVars",
          SrcValue = false
        }
      }
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Ahri_Passive.troy",
      Flags = 0,
      EffectIDVar = "Particle1",
      EffectIDVarTable = "InstanceVars",
      BoneName = "BUFFBONE_GLB_WEAPON_1",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false,
      PersistsThroughReconnect = false,
      BindFlexToOwnerPAR = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "ahri_passive.troy"
    }
  }
}
