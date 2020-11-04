NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Minotaur_TriumphantRoar.dds"
BuffName = "Triumphant Roar"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "movementSpeed",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMovementSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "movementSpeed",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Owner",
      DestVar = "AbilityPower"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "AbilityPower",
      Src1Value = 0,
      Src2Value = 0.4,
      DestVar = "AbilityPower",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BaseHeal",
      SrcValueByLevel = {
        60,
        90,
        120,
        150,
        180
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BaseHeal",
      Src2Var = "AbilityPower",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "FinalHeal",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBIncHealth,
    Params = {
      TargetVar = "Owner",
      Delta = 0,
      DeltaVar = "FinalHeal",
      HealerVar = "Owner"
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Meditate_eff.troy",
      Flags = 0,
      EffectIDVar = "par",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = true,
      FollowsGroundTilt = false
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "FinalHeal",
      Src1Value = 0,
      Src2Value = 2,
      DestVar = "FinalHeal",
      MathOp = MO_DIVIDE
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 575,
      Flags = "AffectFriends AffectMinions AffectHeroes NotAffectSelf ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBGetPAROrHealth,
        Params = {
          DestVar = "Temp1",
          OwnerVar = "Target",
          Function = GetHealthPercent,
          PARType = PAR_MANA
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Temp1",
          Value2 = 1,
          CompareOp = CO_LESS_THAN
        },
        SubBlocks = {
          {
            Function = BBApplyAssistMarker,
            Params = {
              Duration = 10,
              TargetVar = "Target",
              SourceVar = "Attacker"
            }
          }
        }
      },
      {
        Function = BBIncHealth,
        Params = {
          TargetVar = "Unit",
          Delta = 0,
          DeltaVar = "FinalHeal",
          HealerVar = "Owner"
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Unit",
          EffectName = "Meditate_eff.troy",
          Flags = 0,
          EffectIDVar = "par",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = true,
          FollowsGroundTilt = false
        }
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "AlistarTrample",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = false,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 3,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "meditate_eff.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "alistartrample"
    }
  }
}
