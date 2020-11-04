BuffTextureName = "Sona_AriaofPerseverance.dds"
BuffName = "RegenerationRune"
AutoBuffActivateEffect = "Regenerationpotion_itm.troy"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Meditate_eff.troy",
      Flags = 0,
      EffectIDVar = "arr",
      TargetObjectVar = "Target",
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
  },
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "healthPercent",
      OwnerVar = "Owner",
      Function = GetHealthPercent,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "healthPercent",
      Src1Value = 1,
      Src2Value = 0,
      DestVar = "missingHealthPercent",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "missingHealthPercent",
      Src1Value = 20,
      Src2Value = 0,
      DestVar = "healthToRestore",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "healthToRestore",
      Src1Value = 5,
      Src2Value = 0,
      DestVar = "healthToRestore",
      MathOp = MO_MAX
    }
  },
  {
    Function = BBIncHealth,
    Params = {
      TargetVar = "Owner",
      Delta = 0,
      DeltaVar = "healthToRestore",
      HealerVar = "Owner"
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 1,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBGetPAROrHealth,
        Params = {
          DestVar = "healthPercent",
          OwnerVar = "Owner",
          Function = GetHealthPercent,
          PARType = PAR_MANA
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "healthPercent",
          Src1Value = 1,
          Src2Value = 0,
          DestVar = "missingHealthPercent",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "missingHealthPercent",
          Src1Value = 5,
          Src2Value = 0,
          DestVar = "healthToRestore",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "healthToRestore",
          Src1Value = 1,
          Src2Value = 0,
          DestVar = "healthToRestore",
          MathOp = MO_MAX
        }
      },
      {
        Function = BBIncHealth,
        Params = {
          TargetVar = "Owner",
          Delta = 0,
          DeltaVar = "healthToRestore",
          HealerVar = "Owner"
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "meditate_eff.troy"
    }
  }
}
