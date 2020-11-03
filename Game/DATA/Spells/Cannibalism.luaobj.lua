NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Sion_Cannibalism.dds"
AutoBuffActivateEffect = "Cannibalism_buf.troy"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "HealPercent",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "LifestealPercent",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "AttackSpeedMod",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentLifeStealMod,
      TargetVar = "Owner",
      DeltaVar = "LifestealPercent",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentAttackSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "AttackSpeedMod",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
BuffOnPreDealDamageBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_NOT_TURRET},
        SubBlocks = {
          {
            Function = BBIf,
            Params = {Value1 = DAMAGESOURCE_ATTACK, CompareOp = CO_DAMAGE_SOURCETYPE_IS},
            SubBlocks = {
              {
                Function = BBIf,
                Params = {
                  Src1Var = "Target",
                  Src2Var = "Owner",
                  CompareOp = CO_DIFFERENT_TEAM
                },
                SubBlocks = {
                  {
                    Function = BBSpellEffectCreate,
                    Params = {
                      BindObjectVar = "Owner",
                      EffectName = "EternalThirst_buf.troy",
                      Flags = 0,
                      EffectIDVar = "Particle",
                      TargetObjectVar = "Owner",
                      SpecificUnitOnlyVar = "Owner",
                      SpecificTeamOnly = TEAM_UNKNOWN,
                      UseSpecificUnit = false,
                      FOWTeam = TEAM_UNKNOWN,
                      FOWVisibilityRadius = 0,
                      SendIfOnScreenOrDiscard = false
                    }
                  },
                  {
                    Function = BBMath,
                    Params = {
                      Src1Var = "DamageAmount",
                      Src2Var = "HealPercent",
                      Src2VarTable = "InstanceVars",
                      Src1Value = 0,
                      Src2Value = 0,
                      DestVar = "HealAmount",
                      MathOp = MO_MULTIPLY
                    }
                  },
                  {
                    Function = BBForEachUnitInTargetArea,
                    Params = {
                      AttackerVar = "Owner",
                      CenterVar = "Owner",
                      Range = 350,
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
                            Function = BBIncHealth,
                            Params = {
                              TargetVar = "Unit",
                              Delta = 0,
                              DeltaVar = "HealAmount",
                              HealerVar = "Owner"
                            }
                          },
                          {
                            Function = BBApplyAssistMarker,
                            Params = {
                              Duration = 10,
                              TargetVar = "Unit",
                              SourceVar = "Owner"
                            }
                          }
                        }
                      },
                      {
                        Function = BBSpellEffectCreate,
                        Params = {
                          BindObjectVar = "Unit",
                          EffectName = "EternalThirst_buf.troy",
                          Flags = 0,
                          EffectIDVar = "Particle2",
                          TargetObjectVar = "Unit",
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
              }
            }
          }
        }
      }
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "LifestealPercent",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        0.5,
        0.75,
        1
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "HealPercent",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        0.25,
        0.375,
        0.5
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "AttackSpeedMod",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        0.5,
        0.5,
        0.5
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffName = "Cannibalism",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 20,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "eternalthirst_buf.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "cannibalism"
    }
  }
}
