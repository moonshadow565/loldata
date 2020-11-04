ItemOnSpellCastBuildingBlocks = {
  {
    Function = BBGetCastInfo,
    Params = {DestVar = "IsAttack", Info = GetIsAttackOverride}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "IsAttack",
      Value2 = false,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "DoesntTriggerSpellCasts",
          Src1VarTable = "SpellVars",
          Value2 = true,
          CompareOp = CO_NOT_EQUAL
        },
        SubBlocks = {
          {
            Function = BBGetTime,
            Params = {DestVar = "CurCast"}
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "CurCast",
              Src2Var = "LastCast",
              Src2VarTable = "InstanceVars",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "TimeSinceLastCast",
              MathOp = MO_SUBTRACT
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "TimeSinceLastCast",
              Src1Value = 0,
              Src2Value = 4,
              DestVar = "TimeCapped",
              MathOp = MO_MIN
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "TimeSinceLastCast",
              DestVarTable = "InstanceVars",
              SrcVar = "TimeCapped"
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "LastCast",
              DestVarTable = "InstanceVars",
              SrcVar = "CurCast"
            }
          }
        }
      }
    }
  }
}
ItemOnSpellHitBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "Owner",
      Src2Var = "Target",
      CompareOp = CO_DIFFERENT_TEAM
    },
    SubBlocks = {
      {
        Function = BBGetCastInfo,
        Params = {DestVar = "IsAttack", Info = GetIsAttackOverride}
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "IsAttack",
          Value2 = false,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "DoesntTriggerSpellCasts",
              Src1VarTable = "SpellVars",
              Value2 = true,
              CompareOp = CO_NOT_EQUAL
            },
            SubBlocks = {
              {
                Function = BBIf,
                Params = {
                  Src1Var = "NotSingleTargetSpell",
                  Src1VarTable = "SpellVars",
                  Value2 = true,
                  CompareOp = CO_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBSetVarInTable,
                    Params = {DestVar = "DmgMult", SrcValue = 0.05}
                  }
                }
              },
              {
                Function = BBElse,
                Params = {},
                SubBlocks = {
                  {
                    Function = BBSetVarInTable,
                    Params = {DestVar = "DmgMult", SrcValue = 0.1}
                  }
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "TimeSinceLastCast",
                  Src1VarTable = "InstanceVars",
                  Src1Value = 0,
                  Src2Value = 0.25,
                  DestVar = "TimeMultiplier",
                  MathOp = MO_MULTIPLY
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "DmgMult",
                  Src2Var = "TimeMultiplier",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "DmgMult",
                  MathOp = MO_MULTIPLY
                }
              },
              {
                Function = BBGetManaOrHealth,
                Params = {
                  DestVar = "HP",
                  OwnerVar = "Target",
                  Function = GetHealth
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "HP",
                  Src2Var = "DmgMult",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "DmgToDeal",
                  MathOp = MO_MULTIPLY
                }
              },
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Target",
                  EffectName = "AnnieSparks.troy",
                  Flags = 0,
                  EffectIDVar = "id",
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
                Function = BBApplyDamage,
                Params = {
                  AttackerVar = "Owner",
                  TargetVar = "Target",
                  Damage = 0,
                  DamageVar = "DmgToDeal",
                  DamageType = TRUE_DAMAGE,
                  SourceDamageType = DAMAGESOURCE_SPELL,
                  PercentOfAttack = 1,
                  SpellDamageRatio = 0
                }
              }
            }
          }
        }
      }
    }
  }
}
OnActivateBuildingBlocks = {
  {
    Function = BBGetTime,
    Params = {
      DestVar = "LastCast",
      DestVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "TimeSinceLastCast",
      DestVarTable = "InstanceVars",
      SrcValue = 4
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "anniesparks.troy"
    }
  }
}
