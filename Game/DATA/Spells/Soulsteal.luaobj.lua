PersistsThroughDeath = true
NonDispellable = true
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatMagicDamageMod,
      TargetVar = "Owner",
      DeltaVar = "MagicDamageMod",
      DeltaVarTable = "CharVars",
      Delta = 0
    }
  }
}
BuffOnKillBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_HERO},
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "MagicDamageMod",
          Src1VarTable = "CharVars",
          Src1Value = 0,
          Src2Value = 10,
          DestVar = "MagicDamageMod",
          DestVarTable = "CharVars",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "MagicDamageMod",
          Src1VarTable = "CharVars",
          Src1Value = 0,
          Src2Value = 70,
          DestVar = "MagicDamageMod",
          DestVarTable = "CharVars",
          MathOp = MO_MIN
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "MejaisSoulstealer_itm.troy",
          Flags = 0,
          EffectIDVar = "ar",
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
        Function = BBGetManaOrHealth,
        Params = {
          DestVar = "tempMana",
          OwnerVar = "Target",
          Function = GetMana
        }
      },
      {
        Function = BBIncMana,
        Params = {
          TargetVar = "Owner",
          Delta = 0,
          DeltaVar = "tempMana"
        }
      }
    }
  }
}
BuffOnAssistBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_HERO},
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "MagicDamageMod",
          Src1VarTable = "CharVars",
          Src1Value = 0,
          Src2Value = 5,
          DestVar = "MagicDamageMod",
          DestVarTable = "CharVars",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "MagicDamageMod",
          Src1VarTable = "CharVars",
          Src1Value = 0,
          Src2Value = 70,
          DestVar = "MagicDamageMod",
          DestVarTable = "CharVars",
          MathOp = MO_MIN
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "MejaisSoulstealer_itm.troy",
          Flags = 0,
          EffectIDVar = "ar",
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
      Name = "mejaissoulstealer_itm.troy"
    }
  }
}
