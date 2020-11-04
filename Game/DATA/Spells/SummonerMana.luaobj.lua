NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
AdjustCooldownBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "SummonerCooldownBonus",
      Src1VarTable = "AvatarVars",
      Value2 = 0,
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src2Var = "SummonerCooldownBonus",
          Src2VarTable = "AvatarVars",
          Src1Value = 1,
          Src2Value = 0,
          DestVar = "CooldownMultiplier",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "CooldownMultiplier",
          Src1Value = 240,
          Src2Value = 0,
          DestVar = "BaseCooldown",
          MathOp = MO_MULTIPLY
        }
      }
    }
  },
  {
    Function = BBSetReturnValue,
    Params = {
      SrcVar = "BaseCooldown"
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Summoner_Cast.troy",
      Flags = 0,
      EffectIDVar = "CastParticle",
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
    Function = BBGetLevel,
    Params = {TargetVar = "Owner", DestVar = "OwnerLevel"}
  },
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "ManaBonus", SrcValue = 0}
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "ManaBonus",
      Src1VarTable = "AvatarVars",
      Src2Var = "ManaBonus",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "ManaBonus",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "OwnerLevel",
      Src1Value = 0,
      Src2Value = 25,
      DestVar = "BonusMana",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BonusMana",
      Src1Value = 0,
      Src2Value = 100,
      DestVar = "TotalMana",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "TotalMana",
      Src1Value = 0,
      Src2Value = 0.5,
      DestVar = "SecondaryMana",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "ManaBonus",
      Value2 = 0,
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "SecondaryMana",
          Src1Value = 0,
          Src2Value = 2,
          DestVar = "SecondaryMana",
          MathOp = MO_MULTIPLY
        }
      }
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 600,
      Flags = "AffectFriends AffectHeroes ",
      IteratorVar = "Unit"
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Unit",
          EffectName = "Summoner_Mana.troy",
          Flags = 0,
          EffectIDVar = "CastParticle",
          TargetObjectVar = "Unit",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = false
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Unit",
          Src2Var = "Owner",
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBIncMana,
            Params = {
              TargetVar = "Unit",
              Delta = 0,
              DeltaVar = "TotalMana"
            }
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBIncMana,
            Params = {
              TargetVar = "Unit",
              Delta = 0,
              DeltaVar = "SecondaryMana"
            }
          }
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "summoner_cast.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "summoner_mana.troy"
    }
  }
}
