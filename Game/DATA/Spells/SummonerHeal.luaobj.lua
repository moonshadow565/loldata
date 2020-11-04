NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
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
          Src1Value = 270,
          Src2Value = 0,
          DestVar = "BaseCooldown",
          MathOp = MO_MULTIPLY
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "HealCooldownBonus",
      Src1VarTable = "AvatarVars",
      Value2 = 30,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "BaseCooldown",
          Src2Var = "HealCooldownBonus",
          Src2VarTable = "AvatarVars",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "BaseCooldown",
          MathOp = MO_SUBTRACT
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
      EffectName = "summoner_cast.troy",
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
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetLevel,
    Params = {TargetVar = "Owner", DestVar = "OwnerLevel"}
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "OwnerLevel",
      Src1Value = 0,
      Src2Value = 20,
      DestVar = "BonusHeal",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BonusHeal",
      Src1Value = 0,
      Src2Value = 140,
      DestVar = "TotalHeal",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "TotalHeal",
      Src1Value = 0,
      Src2Value = 0.5,
      DestVar = "SecondaryHeal",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Target",
      AttackerVar = "Target",
      BuffName = "SummonerHealCheck"
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "Target",
          Src2Var = "Owner",
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBIncHealth,
            Params = {
              TargetVar = "Target",
              Delta = 0,
              DeltaVar = "TotalHeal",
              HealerVar = "Owner"
            }
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "SecondaryHeal",
              Src1Value = 0,
              Src2Value = 0.5,
              DestVar = "SecondaryHeal",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBIncHealth,
            Params = {
              TargetVar = "Target",
              Delta = 0,
              DeltaVar = "SecondaryHeal",
              HealerVar = "Owner"
            }
          },
          {
            Function = BBApplyAssistMarker,
            Params = {
              Duration = 10,
              TargetVar = "Target",
              SourceVar = "Attacker"
            }
          }
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "Target",
          Src2Var = "Owner",
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBIncHealth,
            Params = {
              TargetVar = "Target",
              Delta = 0,
              DeltaVar = "TotalHeal",
              HealerVar = "Owner"
            }
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBIncHealth,
            Params = {
              TargetVar = "Target",
              Delta = 0,
              DeltaVar = "SecondaryHeal",
              HealerVar = "Owner"
            }
          },
          {
            Function = BBApplyAssistMarker,
            Params = {
              Duration = 10,
              TargetVar = "Target",
              SourceVar = "Attacker"
            }
          }
        }
      }
    }
  },
  {
    Function = BBIfNotHasBuff,
    Params = {
      OwnerVar = "Target",
      CasterVar = "Target",
      BuffName = "SummonerHealCheck"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Target",
          BuffName = "SummonerHealCheck",
          BuffAddType = BUFF_RENEW_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_CombatDehancer,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 25,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false
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
    Function = BBPreloadSpell,
    Params = {
      Name = "summonerhealcheck"
    }
  }
}
