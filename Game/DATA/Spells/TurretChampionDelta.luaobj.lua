PersistsThroughDeath = true
NonDispellable = true
OnBuffActivateBuildingBlocks = {
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
        Function = BBGetNumberOfHeroesOnTeam,
        Params = {
          Team = TEAM_ORDER,
          ConnectedFromStart = false,
          IncludeBots = false,
          DestVar = "NumChampions",
          DestVarTable = "InstanceVars"
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "TeamID",
      Value2 = TEAM_CHAOS,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetNumberOfHeroesOnTeam,
        Params = {
          Team = TEAM_CHAOS,
          ConnectedFromStart = false,
          IncludeBots = false,
          DestVar = "NumChampions",
          DestVarTable = "InstanceVars"
        }
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "NumChampions",
      Src2VarTable = "InstanceVars",
      Src1Value = 5,
      Src2Value = 0,
      DestVar = "NumChampions",
      DestVarTable = "InstanceVars",
      MathOp = MO_MIN
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
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
        Function = BBGetNumberOfHeroesOnTeam,
        Params = {
          Team = TEAM_ORDER,
          ConnectedFromStart = false,
          IncludeBots = false,
          DestVar = "NumChampions"
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "TeamID",
      Value2 = TEAM_CHAOS,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetNumberOfHeroesOnTeam,
        Params = {
          Team = TEAM_CHAOS,
          ConnectedFromStart = false,
          IncludeBots = false,
          DestVar = "NumChampions"
        }
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "NumChampions",
      Src1Value = 5,
      Src2Value = 0,
      DestVar = "NumChampions",
      MathOp = MO_MIN
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "NumChampions",
      Src2Var = "NumChampions",
      Src2VarTable = "InstanceVars",
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "NumChampions",
          Src1VarTable = "InstanceVars",
          Src2Var = "NumChampions",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "ChampionDelta",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "ChampionDelta",
          Src1Value = 0,
          Src2Value = 10,
          DestVar = "BonusDamage",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "ChampionDelta",
          Src1Value = 0,
          Src2Value = 10,
          DestVar = "BonusArmor",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBIncPermanentStat,
        Params = {
          Stat = IncPermanentFlatPhysicalDamageMod,
          TargetVar = "Owner",
          DeltaVar = "BonusDamage",
          Delta = 0
        }
      },
      {
        Function = BBIncPermanentStat,
        Params = {
          Stat = IncPermanentFlatArmorMod,
          TargetVar = "Owner",
          DeltaVar = "BonusArmor",
          Delta = 0
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "NumChampions",
          DestVarTable = "InstanceVars",
          SrcVar = "NumChampions"
        }
      }
    }
  }
}
