ItemOnPreDamageBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBIfNotHasBuff,
    Params = {
      OwnerVar = "Owner",
      CasterVar = "Owner",
      BuffName = "HexdrinkerTimer"
    },
    SubBlocks = {
      {
        Function = BBIfNotHasBuff,
        Params = {
          OwnerVar = "Owner",
          CasterVar = "Owner",
          BuffName = "Hexdrinker"
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "DamageType",
              Value2 = MAGIC_DAMAGE,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBIf,
                Params = {
                  Src1Var = "DamageAmount",
                  Value2 = 0,
                  CompareOp = CO_GREATER_THAN
                },
                SubBlocks = {
                  {
                    Function = BBGetPAROrHealth,
                    Params = {
                      DestVar = "HP",
                      OwnerVar = "Owner",
                      Function = GetHealth,
                      PARType = PAR_MANA
                    }
                  },
                  {
                    Function = BBMath,
                    Params = {
                      Src1Var = "HP",
                      Src2Var = "DamageAmount",
                      Src1Value = 0,
                      Src2Value = 0,
                      DestVar = "ProjectedHP",
                      MathOp = MO_SUBTRACT
                    }
                  },
                  {
                    Function = BBGetPAROrHealth,
                    Params = {
                      DestVar = "MaxHP",
                      OwnerVar = "Owner",
                      Function = GetMaxHealth,
                      PARType = PAR_MANA
                    }
                  },
                  {
                    Function = BBMath,
                    Params = {
                      Src1Var = "ProjectedHP",
                      Src2Var = "MaxHP",
                      Src1Value = 0,
                      Src2Value = 0,
                      DestVar = "NewPercentHP",
                      MathOp = MO_DIVIDE
                    }
                  },
                  {
                    Function = BBIf,
                    Params = {
                      Src1Var = "NewPercentHP",
                      Value2 = 0.3,
                      CompareOp = CO_LESS_THAN
                    },
                    SubBlocks = {
                      {
                        Function = BBSpellEffectCreate,
                        Params = {
                          BindObjectVar = "Owner",
                          EffectName = "hexTech_dmg_shield_birth.troy",
                          Flags = 0,
                          EffectIDVar = "c",
                          TargetObjectVar = "Target",
                          SpecificUnitOnlyVar = "Owner",
                          SpecificTeamOnly = TEAM_UNKNOWN,
                          UseSpecificUnit = false,
                          FOWTeam = TEAM_UNKNOWN,
                          FOWTeamOverrideVar = "TeamID",
                          FOWVisibilityRadius = 10,
                          SendIfOnScreenOrDiscard = true
                        }
                      },
                      {
                        Function = BBSpellEffectCreate,
                        Params = {
                          BindObjectVar = "Owner",
                          EffectName = "hexTech_dmg_shield_onHit_01.troy",
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
                        Function = BBSpellEffectCreate,
                        Params = {
                          BindObjectVar = "Owner",
                          EffectName = "hexTech_dmg_shield_onHit_02.troy",
                          Flags = 0,
                          EffectIDVar = "b",
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
                          DestVar = "ShieldHealth",
                          SrcValue = 300
                        }
                      },
                      {
                        Function = BBIf,
                        Params = {
                          Src1Var = "ShieldHealth",
                          Src2Var = "DamageAmount",
                          CompareOp = CO_GREATER_THAN_OR_EQUAL
                        },
                        SubBlocks = {
                          {
                            Function = BBMath,
                            Params = {
                              Src1Var = "ShieldHealth",
                              Src2Var = "DamageAmount",
                              Src1Value = 0,
                              Src2Value = 0,
                              DestVar = "ShieldHealth",
                              MathOp = MO_SUBTRACT
                            }
                          },
                          {
                            Function = BBSetVarInTable,
                            Params = {
                              DestVar = "ShieldHealth",
                              DestVarTable = "NextBuffVars",
                              SrcVar = "ShieldHealth",
                              SrcValue = 0
                            }
                          },
                          {
                            Function = BBSetVarInTable,
                            Params = {
                              DestVar = "DamageAmount",
                              SrcValue = 0
                            }
                          },
                          {
                            Function = BBSpellBuffAdd,
                            Params = {
                              TargetVar = "Owner",
                              AttackerVar = "Owner",
                              BuffName = "Hexdrinker",
                              BuffAddType = BUFF_REPLACE_EXISTING,
                              StacksExclusive = true,
                              BuffType = BUFF_CombatEnchancer,
                              MaxStack = 1,
                              NumberOfStacks = 1,
                              Duration = 4,
                              BuffVarsTable = "NextBuffVars",
                              TickRate = 0,
                              CanMitigateDuration = false
                            }
                          },
                          {
                            Function = BBSpellBuffAdd,
                            Params = {
                              TargetVar = "Owner",
                              AttackerVar = "Owner",
                              BuffName = "HexdrinkerTimer",
                              BuffAddType = BUFF_REPLACE_EXISTING,
                              StacksExclusive = true,
                              BuffType = BUFF_Internal,
                              MaxStack = 1,
                              NumberOfStacks = 1,
                              Duration = 60,
                              BuffVarsTable = "NextBuffVars",
                              TickRate = 0,
                              CanMitigateDuration = false
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
                              Src1Var = "DamageAmount",
                              Src2Var = "ShieldHealth",
                              Src1Value = 0,
                              Src2Value = 0,
                              DestVar = "DamageAmount",
                              MathOp = MO_SUBTRACT
                            }
                          },
                          {
                            Function = BBSetVarInTable,
                            Params = {
                              DestVar = "ShieldHealth",
                              DestVarTable = "NextBuffVars",
                              SrcValue = 0
                            }
                          },
                          {
                            Function = BBSpellBuffAdd,
                            Params = {
                              TargetVar = "Owner",
                              AttackerVar = "Owner",
                              BuffName = "Hexdrinker",
                              BuffAddType = BUFF_REPLACE_EXISTING,
                              StacksExclusive = true,
                              BuffType = BUFF_CombatEnchancer,
                              MaxStack = 1,
                              NumberOfStacks = 1,
                              Duration = 4,
                              BuffVarsTable = "NextBuffVars",
                              TickRate = 0,
                              CanMitigateDuration = false
                            }
                          },
                          {
                            Function = BBSpellBuffAdd,
                            Params = {
                              TargetVar = "Owner",
                              AttackerVar = "Owner",
                              BuffName = "HexdrinkerTimer",
                              BuffAddType = BUFF_REPLACE_EXISTING,
                              StacksExclusive = true,
                              BuffType = BUFF_Internal,
                              MaxStack = 1,
                              NumberOfStacks = 1,
                              Duration = 60,
                              BuffVarsTable = "NextBuffVars",
                              TickRate = 0,
                              CanMitigateDuration = false
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
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "hexdrinkertimer"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "hexdrinker"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "hextech_dmg_shield_birth.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "hextech_dmg_shield_onhit_01.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "hextech_dmg_shield_onhit_02.troy"
    }
  }
}
