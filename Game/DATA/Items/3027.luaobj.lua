UpdateSelfBuffStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatHPPoolMod,
      TargetVar = "Owner",
      DeltaVar = "BonusHealth",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatMagicDamageMod,
      TargetVar = "Owner",
      DeltaVar = "BonusAbilityPower",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncFlatPARPoolMod,
    Params = {
      PARType = PAR_MANA,
      TargetVar = "Owner",
      DeltaVar = "BonusMana",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
UpdateSelfBuffActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 60,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "BonusHealth",
          Src1VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 18,
          DestVar = "BonusHealth",
          DestVarTable = "InstanceVars",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "BonusMana",
          Src1VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 20,
          DestVar = "BonusMana",
          DestVarTable = "InstanceVars",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "BonusAbilityPower",
          Src1VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 2,
          DestVar = "BonusAbilityPower",
          DestVarTable = "InstanceVars",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "BonusHealth",
          Src1VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 180,
          DestVar = "BonusHealth",
          DestVarTable = "InstanceVars",
          MathOp = MO_MIN
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "BonusMana",
          Src1VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 200,
          DestVar = "BonusMana",
          DestVarTable = "InstanceVars",
          MathOp = MO_MIN
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "BonusAbilityPower",
          Src1VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 20,
          DestVar = "BonusAbilityPower",
          DestVarTable = "InstanceVars",
          MathOp = MO_MIN
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "RodofAges_itm.troy",
          Flags = 0,
          EffectIDVar = "ThisParticle",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = false
        }
      }
    }
  }
}
OnActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BonusHealth",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BonusMana",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BonusAbilityPower",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "rodofages_itm.troy"
    }
  }
}
