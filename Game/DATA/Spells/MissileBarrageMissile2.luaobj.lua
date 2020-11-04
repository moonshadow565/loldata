DoesntBreakShields = true
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetStatus,
    Params = {
      TargetVar = "Target",
      DestVar = "IsStealthed",
      Status = GetStealthed
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "IsStealthed",
      Value2 = false,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Target",
          PosVar = "Target",
          EffectName = "corki_MissleBarrage_DD_tar.troy",
          Flags = 0,
          EffectIDVar = "part",
          BoneName = "spine",
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
        Function = BBSetVarInTable,
        Params = {
          DestVar = "DamageAmount",
          SrcValueByLevel = {
            200,
            350,
            500
          }
        }
      },
      {
        Function = BBGetUnitPosition,
        Params = {UnitVar = "Target", PositionVar = "TargetPos"}
      },
      {
        Function = BBForEachUnitInTargetArea,
        Params = {
          AttackerVar = "Attacker",
          CenterVar = "TargetPos",
          Range = 350,
          Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
          IteratorVar = "Unit"
        },
        SubBlocks = {
          {
            Function = BBBreakSpellShields,
            Params = {TargetVar = "Unit"}
          },
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              TargetVar = "Unit",
              Damage = 0,
              DamageVar = "DamageAmount",
              DamageType = MAGIC_DAMAGE,
              SourceDamageType = DAMAGESOURCE_DEFAULT,
              PercentOfAttack = 1,
              SpellDamageRatio = 0.6,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          }
        }
      },
      {
        Function = BBDestroyMissile,
        Params = {
          MissileIDVar = "MissileNetworkID"
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
        Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_HERO},
        SubBlocks = {
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Target",
              PosVar = "Target",
              EffectName = "corki_MissleBarrage_DD_tar.troy",
              Flags = 0,
              EffectIDVar = "part",
              BoneName = "spine",
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
            Function = BBSetVarInTable,
            Params = {
              DestVar = "DamageAmount",
              SrcValueByLevel = {
                200,
                350,
                500
              }
            }
          },
          {
            Function = BBGetUnitPosition,
            Params = {UnitVar = "Target", PositionVar = "TargetPos"}
          },
          {
            Function = BBForEachUnitInTargetArea,
            Params = {
              AttackerVar = "Attacker",
              CenterVar = "TargetPos",
              Range = 350,
              Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
              IteratorVar = "Unit"
            },
            SubBlocks = {
              {
                Function = BBBreakSpellShields,
                Params = {TargetVar = "Unit"}
              },
              {
                Function = BBApplyDamage,
                Params = {
                  AttackerVar = "Attacker",
                  TargetVar = "Unit",
                  Damage = 0,
                  DamageVar = "DamageAmount",
                  DamageType = MAGIC_DAMAGE,
                  SourceDamageType = DAMAGESOURCE_DEFAULT,
                  PercentOfAttack = 1,
                  SpellDamageRatio = 0.6,
                  IgnoreDamageIncreaseMods = false,
                  IgnoreDamageCrit = false
                }
              }
            }
          },
          {
            Function = BBDestroyMissile,
            Params = {
              MissileIDVar = "MissileNetworkID"
            }
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBCanSeeTarget,
            Params = {
              ViewerVar = "Owner",
              TargetVar = "Target",
              ResultVar = "CanSee"
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "CanSee",
              Value2 = true,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Target",
                  PosVar = "Target",
                  EffectName = "corki_MissleBarrage_DD_tar.troy",
                  Flags = 0,
                  EffectIDVar = "part",
                  BoneName = "spine",
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
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "DamageAmount",
                  SrcValueByLevel = {
                    200,
                    350,
                    500
                  }
                }
              },
              {
                Function = BBGetUnitPosition,
                Params = {UnitVar = "Target", PositionVar = "TargetPos"}
              },
              {
                Function = BBForEachUnitInTargetArea,
                Params = {
                  AttackerVar = "Attacker",
                  CenterVar = "TargetPos",
                  Range = 350,
                  Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
                  IteratorVar = "Unit"
                },
                SubBlocks = {
                  {
                    Function = BBBreakSpellShields,
                    Params = {TargetVar = "Unit"}
                  },
                  {
                    Function = BBApplyDamage,
                    Params = {
                      AttackerVar = "Attacker",
                      TargetVar = "Unit",
                      Damage = 0,
                      DamageVar = "DamageAmount",
                      DamageType = MAGIC_DAMAGE,
                      SourceDamageType = DAMAGESOURCE_DEFAULT,
                      PercentOfAttack = 1,
                      SpellDamageRatio = 0.6,
                      IgnoreDamageIncreaseMods = false,
                      IgnoreDamageCrit = false
                    }
                  }
                }
              },
              {
                Function = BBDestroyMissile,
                Params = {
                  MissileIDVar = "MissileNetworkID"
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
    Function = BBPreloadParticle,
    Params = {
      Name = "corki_misslebarrage_dd_tar.troy"
    }
  }
}
