BuffTextureName = "Sejuani_Permafrost.dds"
BuffName = "SejuaniFrostArctic"
AutoBuffActivateEffect = "Sejuani_Frost_Arctic.troy"
PopupMessage1 = "game_floatingtext_Slowed"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetBuffCasterUnit,
    Params = {CasterVar = "Caster"}
  },
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Caster",
      BuffName = "SejuaniFrostChaos",
      ResetDuration = 0
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "MovementSpeedMod",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMultiplicativeMovementSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "MovementSpeedMod",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBApplyAssistMarker,
    Params = {
      Duration = 10,
      TargetVar = "Owner",
      SourceVar = "Attacker"
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Sejuani_Frost_Arctic_Overhead.troy",
      Flags = 0,
      EffectIDVar = "Overhead",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Attacker",
      TargetBoneName = "Bird_head",
      SpecificUnitOnlyVar = "Attacker",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = true,
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
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "Overhead",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Caster",
      BuffName = "SejuaniFrostTracker"
    },
    SubBlocks = {
      {
        Function = BBGetBuffRemainingDuration,
        Params = {
          DestVar = "Duration",
          TargetVar = "Owner",
          BuffName = "SejuaniFrostTracker"
        }
      },
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Attacker",
          BuffName = "SejuaniFrostTracker",
          ResetDuration = 0
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "MovementSpeedMod",
          DestVarTable = "NextBuffVars",
          SrcValue = -0.1
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Attacker",
          BuffName = "SejuaniFrostChaos",
          BuffAddType = BUFF_RENEW_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Slow,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 0,
          BuffVarsTable = "NextBuffVars",
          DurationVar = "Duration",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      }
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMultiplicativeMovementSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "MovementSpeedMod",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "sejuani_frost_arctic_overhead.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sejuanifrostchaos"
    }
  }
}
