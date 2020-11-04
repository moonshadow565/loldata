BuffTextureName = "3041_Mejais_Soulstealer.dds"
BuffName = "MejaisCap"
Nondispellable = true
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
        Function = BBIfNotHasBuff,
        Params = {
          OwnerVar = "Owner",
          CasterVar = "Owner",
          BuffName = "MejaisCheck"
        },
        SubBlocks = {
          {
            Function = BBSpellBuffRemoveCurrent,
            Params = {TargetVar = "Owner"}
          }
        }
      },
      {
        Function = BBGetBuffCountFromAll,
        Params = {
          DestVar = "Count",
          TargetVar = "Owner",
          BuffName = "MejaisStats"
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
BuffOnKillBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_HERO},
    SubBlocks = {
      {
        Function = BBIncHealth,
        Params = {
          TargetVar = "Owner",
          Delta = 250,
          HealerVar = "Owner"
        }
      },
      {
        Function = BBIncMana,
        Params = {TargetVar = "Owner", Delta = 250}
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "TearoftheGoddess_itm.troy",
          Flags = 0,
          EffectIDVar = "a",
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
BuffOnAssistBuildingBlocks = {
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Attacker",
      AttackerVar = "Attacker",
      BuffName = "MejaisStats",
      BuffAddType = BUFF_STACKS_AND_RENEWS,
      BuffType = BUFF_Internal,
      MaxStack = 12,
      NumberStacks = 1,
      Duration = 25000,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "TearoftheGoddess_itm.troy",
      Flags = 0,
      EffectIDVar = "b",
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
    Function = BBIncHealth,
    Params = {
      TargetVar = "Owner",
      Delta = 250,
      HealerVar = "Owner"
    }
  },
  {
    Function = BBIncMana,
    Params = {TargetVar = "Owner", Delta = 250}
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "mejaischeck"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "mejaisstats"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "tearofthegoddess_itm.troy"
    }
  }
}
