BuffTextureName = "MasterYi_LeapStrike.dds"
BuffName = "Alpha Strike"
AutoBuffActivateEffect = "AlphaStrike_prison.troy"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "BaseDamage",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "WillDamage",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "WillToggleStatus",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "ChanceToKill",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSetStatus,
        Params = {
          TargetVar = "Owner",
          SrcValue = false,
          Status = SetCanCast
        }
      },
      {
        Function = BBSetStatus,
        Params = {
          TargetVar = "Owner",
          SrcValue = false,
          Status = SetCanAttack
        }
      },
      {
        Function = BBSetStatus,
        Params = {
          TargetVar = "Owner",
          SrcValue = false,
          Status = SetCanMove
        }
      },
      {
        Function = BBSetStatus,
        Params = {
          TargetVar = "Owner",
          SrcValue = false,
          Status = SetTargetable
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "WillDamage",
      Src1VarTable = "InstanceVars",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "WillToggleStatus",
          Src1VarTable = "InstanceVars",
          Value2 = true,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "WillToggleStatus",
              DestVarTable = "InstanceVars",
              SrcValue = false
            }
          },
          {
            Function = BBSetStatus,
            Params = {
              TargetVar = "Owner",
              SrcValue = true,
              Status = SetCanCast
            }
          },
          {
            Function = BBSetStatus,
            Params = {
              TargetVar = "Owner",
              SrcValue = true,
              Status = SetCanAttack
            }
          },
          {
            Function = BBSetStatus,
            Params = {
              TargetVar = "Owner",
              SrcValue = true,
              Status = SetCanMove
            }
          },
          {
            Function = BBSetStatus,
            Params = {
              TargetVar = "Owner",
              SrcValue = true,
              Status = SetTargetable
            }
          }
        }
      }
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "WillDamage",
      Src1VarTable = "InstanceVars",
      Value2 = false,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetBuffCountFromAll,
        Params = {
          DestVar = "Count",
          TargetVar = "Attacker",
          BuffName = "AlphaStrike"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Count",
          Value2 = 0,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "WillDamage",
              DestVarTable = "InstanceVars",
              SrcValue = true
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "WillToggleStatus",
              DestVarTable = "InstanceVars",
              SrcValue = true
            }
          },
          {
            Function = BBSetStatus,
            Params = {
              TargetVar = "Owner",
              SrcValue = true,
              Status = SetTargetable
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Owner",
              EffectName = "AlphaStrike_Slash.troy",
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
          },
          {
            Function = BBSetStatus,
            Params = {
              TargetVar = "Owner",
              SrcValue = true,
              Status = SetCanCast
            }
          },
          {
            Function = BBSetStatus,
            Params = {
              TargetVar = "Owner",
              SrcValue = true,
              Status = SetCanAttack
            }
          },
          {
            Function = BBSetStatus,
            Params = {
              TargetVar = "Owner",
              SrcValue = true,
              Status = SetCanMove
            }
          },
          {
            Function = BBIf,
            Params = {Src1Var = "Owner", CompareOp = CO_IS_TYPE_HERO},
            SubBlocks = {
              {
                Function = BBApplyDamage,
                Params = {
                  AttackerVar = "Attacker",
                  TargetVar = "Owner",
                  Damage = 0,
                  DamageVar = "BaseDamage",
                  DamageVarTable = "InstanceVars",
                  DamageType = MAGIC_DAMAGE,
                  SourceDamageType = DAMAGESOURCE_SPELL,
                  PercentOfAttack = 1,
                  SpellDamageRatio = 1
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
                  Src1Var = "ChanceToKill",
                  Src1VarTable = "InstanceVars",
                  CompareOp = CO_RANDOM_CHANCE_LESS_THAN
                },
                SubBlocks = {
                  {
                    Function = BBMath,
                    Params = {
                      Src1Var = "BaseDamage",
                      Src1VarTable = "InstanceVars",
                      Src1Value = 0,
                      Src2Value = 400,
                      DestVar = "BonusDamage",
                      MathOp = MO_ADD
                    }
                  },
                  {
                    Function = BBApplyDamage,
                    Params = {
                      AttackerVar = "Attacker",
                      TargetVar = "Owner",
                      Damage = 0,
                      DamageVar = "BonusDamage",
                      DamageType = MAGIC_DAMAGE,
                      SourceDamageType = DAMAGESOURCE_SPELL,
                      PercentOfAttack = 1,
                      SpellDamageRatio = 1
                    }
                  }
                }
              },
              {
                Function = BBElse,
                Params = {},
                SubBlocks = {
                  {
                    Function = BBApplyDamage,
                    Params = {
                      AttackerVar = "Attacker",
                      TargetVar = "Owner",
                      Damage = 0,
                      DamageVar = "BaseDamage",
                      DamageVarTable = "InstanceVars",
                      DamageType = MAGIC_DAMAGE,
                      SourceDamageType = DAMAGESOURCE_SPELL,
                      PercentOfAttack = 1,
                      SpellDamageRatio = 1
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
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "alphastrike"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "alphastrike_slash.troy"
    }
  }
}
