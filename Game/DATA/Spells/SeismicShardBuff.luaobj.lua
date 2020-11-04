BuffTextureName = "Malphite_SeismicShard.dds"
BuffName = "SeismicShard"
PopupMessage1 = "game_floatingtext_Slowed"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "Level",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Global_Slow.troy",
      Flags = 0,
      EffectIDVar = "SSSlow",
      EffectIDVarTable = "InstanceVars",
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
    Function = BBGetStat,
    Params = {
      Stat = GetMovementSpeed,
      TargetVar = "Owner",
      DestVar = "Value",
      DestVarTable = "InstanceVars"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "SSSlow",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Level",
      SrcVar = "Level",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Modifier",
      SrcValueByLevel = {
        0.1,
        0.15,
        0.2,
        0.25,
        0.3
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Value",
      Src1VarTable = "InstanceVars",
      Src2Var = "Modifier",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "Result",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatMovementSpeedMod,
      TargetVar = "Attacker",
      DeltaVar = "Result",
      Delta = 0
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "Result",
      Src1Value = -1,
      Src2Value = 0,
      DestVar = "Result",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatMovementSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "Result",
      Delta = 0
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "global_slow.troy"
    }
  }
}
