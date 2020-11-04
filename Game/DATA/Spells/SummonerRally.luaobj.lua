NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
AdjustCooldownBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "SummonerCooldownBonus",
      Src1VarTable = "AvatarVars",
      Value2 = 0,
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src2Var = "SummonerCooldownBonus",
          Src2VarTable = "AvatarVars",
          Src1Value = 1,
          Src2Value = 0,
          DestVar = "CooldownMultiplier",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "CooldownMultiplier",
          Src1Value = 270,
          Src2Value = 0,
          DestVar = "BaseCooldown",
          MathOp = MO_MULTIPLY
        }
      }
    }
  },
  {
    Function = BBSetReturnValue,
    Params = {
      SrcVar = "BaseCooldown"
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Summoner_Cast.troy",
      Flags = 0,
      EffectIDVar = "CastParticle",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false
    }
  },
  {
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Owner",
      Distance = 200,
      OffsetAngle = 0,
      PositionVar = "MinionPos"
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Nothing",
      PosVar = "MinionPos",
      EffectName = "summoner_flash.troy",
      Flags = 0,
      EffectIDVar = "ba",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false
    }
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "OwnerID"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "WillPumpAP",
      DestVarTable = "NextBuffVars",
      SrcValue = false
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "RallyAPMod",
      Src1VarTable = "AvatarVars",
      Value2 = 70,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "WillPumpAP",
          DestVarTable = "NextBuffVars",
          SrcValue = true
        }
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "Duration", SrcValue = 15}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "RallyDurationBonus",
      Src1VarTable = "AvatarVars",
      Value2 = 5,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "RallyDurationBonus",
          Src1VarTable = "AvatarVars",
          Src2Var = "Duration",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "Duration",
          MathOp = MO_ADD
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "RallyDurationBonus",
      Src1VarTable = "AvatarVars",
      Value2 = 10,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "RallyDurationBonus",
          Src1VarTable = "AvatarVars",
          Src2Var = "Duration",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "Duration",
          MathOp = MO_ADD
        }
      }
    }
  },
  {
    Function = BBSpawnMinion,
    Params = {
      Name = "Beacon",
      Skin = "SummonerBeacon",
      AiScript = "idle.lua",
      PosVar = "MinionPos",
      Team = TEAM_ORDER,
      TeamVar = "OwnerID",
      Stunned = true,
      Rooted = true,
      Silenced = false,
      Invulnerable = false,
      MagicImmune = true,
      IgnoreCollision = false,
      VisibilitySize = 0,
      DestVar = "Other3",
      GoldRedirectTargetVar = "Nothing"
    }
  },
  {
    Function = BBGetLevel,
    Params = {TargetVar = "Owner", DestVar = "OwnerLevel"}
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "OwnerLevel",
      Src1Value = 0,
      Src2Value = 25,
      DestVar = "BonusHealth",
      DestVarTable = "NextBuffVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "OwnerLevel",
      Src1Value = 0,
      Src2Value = 1.5,
      DestVar = "BonusRegen",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BonusRegen",
      Src1Value = 0,
      Src2Value = 15,
      DestVar = "FinalHPRegen",
      DestVarTable = "NextBuffVars",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Other3",
      AttackerVar = "Owner",
      BuffName = "BeaconAura",
      BuffAddType = BUFF_RENEW_EXISTING,
      BuffType = BUFF_Aura,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 0,
      BuffVarsTable = "NextBuffVars",
      DurationVar = "Duration",
      TickRate = 0
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "summoner_cast.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "summoner_flash.troy"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "summonerbeacon"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "beaconaura"}
  }
}
