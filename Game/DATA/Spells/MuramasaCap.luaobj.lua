BuffTextureName = "3034_Kenyus_Kukri.dds"
BuffName = "MuramasaCap"
AutoBuffActivateEffect = "Aura_Offense.troy"
Nondispellable = true
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMultiplicativeMovementSpeedMod,
      TargetVar = "Owner",
      Delta = 0.2
    }
  },
  {
    Function = BBIfNotHasBuff,
    Params = {
      OwnerVar = "Owner",
      CasterVar = "Owner",
      BuffName = "MuramasaCheck"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemoveCurrent,
        Params = {TargetVar = "Owner"}
      }
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 0.3,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBGetBuffCountFromAll,
        Params = {
          DestVar = "Count",
          TargetVar = "Owner",
          BuffName = "MuramasaStats"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Count",
          Value2 = 12,
          CompareOp = CO_NOT_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellBuffRemoveCurrent,
            Params = {TargetVar = "Owner"}
          }
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "muramasacheck"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "muramasastats"
    }
  }
}
