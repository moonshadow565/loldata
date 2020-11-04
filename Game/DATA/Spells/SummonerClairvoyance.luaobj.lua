NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = false
IsDamagingSpell = false
AutoBuffActivateEffect = "GuinsoosRodofOblivion_buf.troy"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "ParticleID",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "ParticleID2",
      RequiredVarTable = "InstanceVars"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBRemovePerceptionBubble,
    Params = {
      BubbleIDVar = "Bubble",
      BubbleIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "ParticleID",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "ParticleID2",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
AdjustCooldownBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "SummonerCooldownBonus",
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
          Src1Value = 55,
          Src2Value = 0,
          DestVar = "BaseCooldown",
          MathOp = MO_MULTIPLY
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "ClairvoyanceCooldownBonus",
      Src1VarTable = "AvatarVars",
      Value2 = 0,
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "BaseCooldown",
          Src2Var = "ClairvoyanceCooldownBonus",
          Src2VarTable = "AvatarVars",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "BaseCooldown",
          MathOp = MO_SUBTRACT
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
SelfExecuteBuildingBlocks = {
  {
    Function = BBGetCastSpellTargetPos,
    Params = {DestVar = "TargetPos"}
  },
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
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "TeamID",
      Value2 = TEAM_ORDER,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Nothing",
          PosVar = "TargetPos",
          EffectName = "ClairvoyanceEyeLong_red.troy",
          Flags = 0,
          EffectIDVar = "ParticleID",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Nothing",
          SpecificTeamOnly = TEAM_CHAOS,
          UseSpecificUnit = true,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = false
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Nothing",
          PosVar = "TargetPos",
          EffectName = "ClairvoyanceEyeLong_green.troy",
          Flags = 0,
          EffectIDVar = "ParticleID2",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Nothing",
          SpecificTeamOnly = TEAM_ORDER,
          UseSpecificUnit = true,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = false
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
          BindObjectVar = "Nothing",
          PosVar = "TargetPos",
          EffectName = "ClairvoyanceEyeLong_red.troy",
          Flags = 0,
          EffectIDVar = "ParticleID",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Nothing",
          SpecificTeamOnly = TEAM_ORDER,
          UseSpecificUnit = true,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = false
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Nothing",
          PosVar = "TargetPos",
          EffectName = "ClairvoyanceEyeLong_green.troy",
          Flags = 0,
          EffectIDVar = "ParticleID2",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Nothing",
          SpecificTeamOnly = TEAM_CHAOS,
          UseSpecificUnit = true,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = false
        }
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ParticleID",
      DestVarTable = "NextBuffVars",
      SrcVar = "ParticleID"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ParticleID2",
      DestVarTable = "NextBuffVars",
      SrcVar = "ParticleID2"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "Duration", SrcValue = 6}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "ClairvoyanceDurationBonus",
      Src1VarTable = "AvatarVars",
      Value2 = 4,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "ClairvoyanceDurationBonus",
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
    Function = BBAddPosPerceptionBubble,
    Params = {
      TeamVar = "TeamID",
      Radius = 1400,
      PosVar = "TargetPos",
      Duration = 0,
      DurationVar = "Duration",
      SpecificUnitsClientOnlyVar = "Nothing",
      RevealSteath = false,
      BubbleIDVar = "Bubble",
      BubbleIDVarTable = "NextBuffVars"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Attacker",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 0,
      BuffVarsTable = "NextBuffVars",
      DurationVar = "Duration",
      TickRate = 0,
      CanMitigateDuration = false
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
      Name = "clairvoyanceeyelong_red.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "clairvoyanceeyelong_green.troy"
    }
  }
}
