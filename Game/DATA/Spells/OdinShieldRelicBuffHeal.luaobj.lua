BuffTextureName = "JarvanIV_GoldenAegis.dds"
BuffName = "OdinShieldRelic"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetLevel,
    Params = {TargetVar = "Owner", DestVar = "Level"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "HealAmount",
      SrcValueByLevel = {
        90,
        99,
        108,
        117,
        126,
        135,
        144,
        153,
        162,
        171,
        180,
        189,
        198,
        207,
        216,
        225,
        234,
        243
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "HealAmount",
      Src1Value = 0,
      Src2Value = 0.5,
      DestVar = "ManaAmount",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncPAR,
    Params = {
      TargetVar = "Owner",
      Delta = 0,
      PARType = PAR_MANA,
      DeltaVar = "ManaAmount"
    }
  },
  {
    Function = BBIncPAR,
    Params = {
      TargetVar = "Owner",
      Delta = 20,
      PARType = PAR_ENERGY
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "OdinPlayerBuff"
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src2Var = "HealAmount",
          Src1Value = 1.25,
          Src2Value = 0,
          DestVar = "HealAmount",
          MathOp = MO_MULTIPLY
        }
      }
    }
  },
  {
    Function = BBIncHealth,
    Params = {
      TargetVar = "Owner",
      Delta = 0,
      DeltaVar = "HealAmount",
      HealerVar = "Owner"
    }
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Odin_HealthPackHeal.troy",
      Flags = 0,
      EffectIDVar = "asdf",
      BoneName = "root",
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
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Summoner_Mana.troy",
      Flags = 0,
      EffectIDVar = "asdf",
      BoneName = "root",
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
    Function = BBSpellBuffClear,
    Params = {
      TargetVar = "Owner",
      BuffName = "OdinShieldRelicBuffHeal"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinplayerbuff"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "odin_healthpackheal.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "summoner_mana.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinshieldrelicbuffheal"
    }
  }
}
