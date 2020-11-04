NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = ""
BuffName = ""
AutoBuffActivateEffect = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetGhosted
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetTargetable
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetSuppressCallForHelp
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetIgnoreCallForHelp
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
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetCallForHelpSuppresser
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetNoRender
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Attacker",
      EffectName = "Global_Slow.troy",
      Flags = 0,
      EffectIDVar = "AParticle",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Attacker",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Attacker",
      EffectName = "swain_disintegrationBeam_beam.troy",
      Flags = 0,
      EffectIDVar = "BParticle",
      EffectIDVarTable = "InstanceVars",
      BoneName = "head",
      TargetObjectVar = "Owner",
      TargetBoneName = "Bird_head",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Attacker",
      EffectName = "swain_disintegrationBeam_tar.troy",
      Flags = 0,
      EffectIDVar = "CParticle",
      EffectIDVarTable = "InstanceVars",
      BoneName = "head",
      TargetObjectVar = "Owner",
      TargetBoneName = "Bird_head",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "swain_disintegrationBeam_beam_idle.troy",
      Flags = 0,
      EffectIDVar = "DParticle",
      EffectIDVarTable = "InstanceVars",
      BoneName = "Bird_head",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "SlowPercent",
      RequiredVarTable = "InstanceVars"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "swain_disintegrationBeam_cas_end.troy",
      Flags = 0,
      EffectIDVar = "a",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = true
    }
  },
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
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "AParticle",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "DParticle",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetNoRender
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "SwainBeamExpirationTimer",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 0.25,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMultiplicativeMovementSpeedMod,
      TargetVar = "Attacker",
      DeltaVar = "SlowPercent",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBFaceDirection,
    Params = {TargetVar = "Owner", LocationVar = "Attacker"}
  },
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 0.25,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBDistanceBetweenObjects,
        Params = {
          DestVar = "Distance",
          ObjectVar1 = "Attacker",
          ObjectVar2 = "Owner"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Distance",
          Value2 = 675,
          CompareOp = CO_GREATER_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellBuffRemoveCurrent,
            Params = {TargetVar = "Owner"}
          },
          {
            Function = BBSpellBuffRemove,
            Params = {
              TargetVar = "Attacker",
              AttackerVar = "Nothing",
              BuffName = "SwainBeamDamage"
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {Src1Var = "Attacker", CompareOp = CO_IS_DEAD},
        SubBlocks = {
          {
            Function = BBSpellBuffRemoveCurrent,
            Params = {TargetVar = "Owner"}
          },
          {
            Function = BBSpellBuffRemove,
            Params = {
              TargetVar = "Attacker",
              AttackerVar = "Nothing",
              BuffName = "SwainBeamDamage"
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
      Name = "global_slow.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "swain_disintegrationbeam_beam.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "swain_disintegrationbeam_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "swain_disintegrationbeam_beam_idle.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "swain_disintegrationbeam_cas_end.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "swainbeamexpirationtimer"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "swainbeamdamage"
    }
  }
}
