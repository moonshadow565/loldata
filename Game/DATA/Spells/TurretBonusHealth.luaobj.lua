OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "BonusHealth",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "BubbleSize",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBAddUnitPerceptionBubble,
    Params = {
      TeamVar = "TeamID",
      Radius = 0,
      RadiusVar = "BubbleSize",
      RadiusVarTable = "InstanceVars",
      TargetVar = "Owner",
      Duration = 25000,
      SpecificUnitsClientOnlyVar = "Nothing",
      RevealSpecificUnitOnlyVar = "Nothing",
      RevealSteath = true,
      BubbleIDVar = "ThisBubble",
      BubbleIDVarTable = "InstanceVars"
    }
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
          Team = TEAM_CHAOS,
          ConnectedFromStart = true,
          IncludeBots = true,
          DestVar = "NumChampions"
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBGetNumberOfHeroesOnTeam,
        Params = {
          Team = TEAM_ORDER,
          ConnectedFromStart = true,
          IncludeBots = true,
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
    Function = BBMath,
    Params = {
      Src1Var = "NumChampions",
      Src2Var = "BonusHealth",
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "BonusHealth",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatHPPoolMod,
      TargetVar = "Owner",
      DeltaVar = "BonusHealth",
      Delta = 0
    }
  },
  {
    Function = BBSpellBuffRemoveCurrent,
    Params = {TargetVar = "Owner"}
  }
}
