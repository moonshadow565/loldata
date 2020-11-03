OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "AttackCounter",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  }
}
BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
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
            Params = {
              Src1Var = "HitResult",
              Value2 = HIT_Dodge,
              CompareOp = CO_NOT_EQUAL
            },
            SubBlocks = {
              {
                Function = BBIf,
                Params = {
                  Src1Var = "HitResult",
                  Value2 = HIT_Miss,
                  CompareOp = CO_NOT_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBIf,
                    Params = {
                      Src1Var = "AttackCounter",
                      Src1VarTable = "InstanceVars",
                      Value2 = 3,
                      CompareOp = CO_EQUAL
                    },
                    SubBlocks = {
                      {
                        Function = BBSetBuffCasterUnit,
                        Params = {CasterVar = "Caster"}
                      },
                      {
                        Function = BBIf,
                        Params = {Src1Var = "Attacker", CompareOp = CO_IS_NOT_HERO},
                        SubBlocks = {
                          {
                            Function = BBGetPetOwner,
                            Params = {PetVar = "Attacker", DestVar = "Caster"}
                          }
                        }
                      },
                      {
                        Function = BBSpellEffectCreate,
                        Params = {
                          BindObjectVar = "Attacker",
                          EffectName = "kennen_btl_beam.troy",
                          Flags = 0,
                          EffectIDVar = "ParticleID",
                          EffectIDVarTable = "InstanceVars",
                          BoneName = "head",
                          TargetObjectVar = "Target",
                          TargetBoneName = "root",
                          SpecificUnitOnlyVar = "Target",
                          SpecificTeamOnly = TEAM_UNKNOWN,
                          UseSpecificUnit = false,
                          FOWTeam = TEAM_UNKNOWN,
                          FOWTeamOverrideVar = "TeamID",
                          FOWVisibilityRadius = 10,
                          SendIfOnScreenOrDiscard = true,
                          PersistsThroughReconnect = false,
                          BindFlexToOwnerPAR = false,
                          FollowsGroundTilt = false,
                          FacesTarget = false
                        }
                      },
                      {
                        Function = BBSetVarInTable,
                        Params = {
                          DestVar = "BounceCounter",
                          DestVarTable = "NextBuffVars",
                          SrcValue = 1
                        }
                      },
                      {
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Target",
                          AttackerVar = "Attacker",
                          BuffName = "LightningRodChain",
                          BuffAddType = BUFF_REPLACE_EXISTING,
                          StacksExclusive = true,
                          BuffType = BUFF_Internal,
                          MaxStack = 1,
                          NumberOfStacks = 1,
                          Duration = 1.5,
                          BuffVarsTable = "NextBuffVars",
                          TickRate = 0,
                          CanMitigateDuration = false,
                          IsHiddenOnClient = false
                        }
                      },
                      {
                        Function = BBSetVarInTable,
                        Params = {
                          DestVar = "AttackCounter",
                          DestVarTable = "InstanceVars",
                          SrcValue = 0
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
                          Src1Var = "AttackCounter",
                          Src1VarTable = "InstanceVars",
                          Src1Value = 0,
                          Src2Value = 1,
                          DestVar = "AttackCounter",
                          DestVarTable = "InstanceVars",
                          MathOp = MO_ADD
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
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "kennen_btl_beam.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "lightningrodchain"
    }
  }
}
