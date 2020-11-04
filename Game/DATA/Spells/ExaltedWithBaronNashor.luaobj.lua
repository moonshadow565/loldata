BuffTextureName = "Averdrian_AstralBeam.dds"
BuffName = "Exalted with Baron Nashor"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatMPRegenMod,
      TargetVar = "Owner",
      Delta = 3
    }
  },
  {
    Function = BBGetGameTime,
    Params = {SecondsVar = "GameTime"}
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "GameTime",
      Src1Value = 0,
      Src2Value = 30,
      DestVar = "BonusAttack",
      MathOp = MO_DIVIDE
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BonusAttack",
      Src1Value = 0,
      Src2Value = 15,
      DestVar = "BonusAttack",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BonusAttack",
      Src1Value = 0,
      Src2Value = 60,
      DestVar = "BonusAttack",
      MathOp = MO_MIN
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BonusAttack",
      Src1Value = 0,
      Src2Value = 20,
      DestVar = "BonusAttack",
      MathOp = MO_MAX
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BonusAttack",
      DestVarTable = "InstanceVars",
      SrcVar = "BonusAttack"
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatMagicDamageMod,
      TargetVar = "Owner",
      DeltaVar = "BonusAttack",
      Delta = 0
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatPhysicalDamageMod,
      TargetVar = "Owner",
      DeltaVar = "BonusAttack",
      Delta = 0
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "nashor_rune_buf.troy",
      Flags = 0,
      EffectIDVar = "buffParticle",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatMPRegenMod,
      TargetVar = "Owner",
      Delta = -3
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "BonusAttack",
      Src2VarTable = "InstanceVars",
      Src1Value = -1,
      Src2Value = 0,
      DestVar = "BonusAttack",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatPhysicalDamageMod,
      TargetVar = "Owner",
      DeltaVar = "BonusAttack",
      Delta = 0
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatMagicDamageMod,
      TargetVar = "Owner",
      DeltaVar = "BonusAttack",
      Delta = 0
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "buffParticle",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 5,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBGetManaOrHealth,
        Params = {
          DestVar = "Health",
          OwnerVar = "Owner",
          Function = GetMaxHealth
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "Health",
          Src1Value = 0,
          Src2Value = 0.03,
          DestVar = "HealthInc",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBIncHealth,
        Params = {
          TargetVar = "Owner",
          Delta = 0,
          DeltaVar = "HealthInc",
          HealerVar = "Owner"
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "InnervatingLocket_itm.troy",
          Flags = 0,
          EffectIDVar = "Particle",
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
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nashor_rune_buf.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "innervatinglocket_itm.troy"
    }
  }
}
