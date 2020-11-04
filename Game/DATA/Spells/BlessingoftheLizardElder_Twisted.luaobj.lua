BuffTextureName = "48thSlave_WaveOfLoathing.dds"
BuffName = "BlessingoftheLizardElder"
AutoBuffActivateEffect = ""
Nondispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "ParticlePosition",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "NeutralMonster_buf_red_offense.troy",
      Flags = 0,
      EffectIDVar = "buffParticle",
      EffectIDVarTable = "InstanceVars",
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
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ParticlePosition",
      SrcVar = "ParticlePosition",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "teamID"}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "teamID",
      Value2 = TEAM_ORDER,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Nothing",
          PosVar = "ParticlePosition",
          EffectName = "ClairvoyanceEyeLong.troy",
          Flags = 0,
          EffectIDVar = "CastParticle",
          EffectIDVarTable = "InstanceVars",
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
        Function = BBAddPosPerceptionBubble,
        Params = {
          TeamVar = "teamID",
          Radius = 2200,
          PosVar = "ParticlePosition",
          Duration = 180,
          SpecificUnitsClientOnlyVar = "Nothing",
          RevealSteath = false,
          BubbleIDVar = "Bubble",
          BubbleIDVarTable = "InstanceVars"
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "teamID",
      Value2 = TEAM_CHAOS,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Nothing",
          PosVar = "ParticlePosition",
          EffectName = "ClairvoyanceEyeLong.troy",
          Flags = 0,
          EffectIDVar = "CastParticle",
          EffectIDVarTable = "InstanceVars",
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
        Function = BBAddPosPerceptionBubble,
        Params = {
          TeamVar = "teamID",
          Radius = 2200,
          PosVar = "ParticlePosition",
          Duration = 180,
          SpecificUnitsClientOnlyVar = "Nothing",
          RevealSteath = false,
          BubbleIDVar = "Bubble",
          BubbleIDVarTable = "InstanceVars"
        }
      }
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "buffParticle",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "CastParticle",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRemovePerceptionBubble,
    Params = {
      BubbleIDVar = "Bubble",
      BubbleIDVarTable = "InstanceVars"
    }
  }
}
BuffOnDeathBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Attacker", CompareOp = CO_IS_NOT_DEAD},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Attacker", CompareOp = CO_IS_TYPE_HERO},
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "NewDuration",
              SrcValue = 90
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "ParticlePosition",
              DestVarTable = "NextBuffVars",
              SrcVar = "ParticlePosition",
              SrcVarTable = "InstanceVars"
            }
          },
          {
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Attacker",
              AttackerVar = "Attacker",
              BuffName = "MonsterBuffs"
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src2Var = "NewDuration",
                  Src1Value = 1.15,
                  Src2Value = 0,
                  DestVar = "NewDuration",
                  MathOp = MO_MULTIPLY
                }
              }
            }
          },
          {
            Function = BBElse,
            Params = {},
            SubBlocks = {
              {
                Function = BBIfHasBuff,
                Params = {
                  OwnerVar = "Attacker",
                  AttackerVar = "Attacker",
                  BuffName = "MonsterBuffs2"
                },
                SubBlocks = {
                  {
                    Function = BBMath,
                    Params = {
                      Src2Var = "NewDuration",
                      Src1Value = 1.3,
                      Src2Value = 0,
                      DestVar = "NewDuration",
                      MathOp = MO_MULTIPLY
                    }
                  }
                }
              }
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Attacker",
              AttackerVar = "Attacker",
              BuffName = "BlessingoftheLizardElder_Twisted",
              BuffAddType = BUFF_REPLACE_EXISTING,
              BuffType = BUFF_CombatEnchancer,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 0,
              BuffVarsTable = "NextBuffVars",
              DurationVar = "NewDuration",
              TickRate = 0
            }
          }
        }
      }
    }
  }
}
BuffOnHitUnitBuildingBlocks = {
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
            Params = {Src1Var = "Owner", CompareOp = CO_IS_TYPE_HERO},
            SubBlocks = {
              {
                Function = BBIf,
                Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
                SubBlocks = {
                  {
                    Function = BBIf,
                    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_TURRET}
                  },
                  {
                    Function = BBElse,
                    Params = {},
                    SubBlocks = {
                      {
                        Function = BBGetLevel,
                        Params = {TargetVar = "Owner", DestVar = "Level"}
                      },
                      {
                        Function = BBSetVarInTable,
                        Params = {
                          DestVar = "TickDamage",
                          DestVarTable = "NextBuffVars",
                          SrcValue = 0,
                          SrcValueByLevel = {
                            15,
                            15,
                            20,
                            20,
                            25,
                            25,
                            30,
                            30,
                            35,
                            35,
                            40,
                            40,
                            45,
                            45,
                            50,
                            50,
                            55,
                            55
                          }
                        }
                      },
                      {
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Target",
                          AttackerVar = "Attacker",
                          BuffName = "Burning",
                          BuffAddType = BUFF_RENEW_EXISTING,
                          BuffType = BUFF_Damage,
                          MaxStack = 1,
                          NumberOfStacks = 1,
                          Duration = 3,
                          BuffVarsTable = "NextBuffVars",
                          TickRate = 1
                        }
                      },
                      {
                        Function = BBSetVarInTable,
                        Params = {
                          DestVar = "MoveSpeedMod",
                          DestVarTable = "NextBuffVars",
                          SrcValue = 0,
                          SrcValueByLevel = {
                            -0.15,
                            -0.15,
                            -0.15,
                            -0.15,
                            -0.15,
                            -0.2,
                            -0.2,
                            -0.2,
                            -0.2,
                            -0.2,
                            -0.25,
                            -0.25,
                            -0.25,
                            -0.25,
                            -0.25,
                            -0.3,
                            -0.3,
                            -0.3
                          }
                        }
                      },
                      {
                        Function = BBSetVarInTable,
                        Params = {
                          DestVar = "AttackSpeedMod",
                          DestVarTable = "NextBuffVars",
                          SrcValue = 0,
                          SrcValueByLevel = {
                            0,
                            0,
                            0,
                            0,
                            0,
                            0,
                            0,
                            0,
                            0,
                            0,
                            0,
                            0,
                            0,
                            0,
                            0,
                            0,
                            0,
                            0
                          }
                        }
                      },
                      {
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Target",
                          AttackerVar = "Attacker",
                          BuffName = "Slow",
                          BuffAddType = BUFF_RENEW_EXISTING,
                          BuffType = BUFF_Slow,
                          MaxStack = 1,
                          NumberOfStacks = 1,
                          Duration = 3,
                          BuffVarsTable = "NextBuffVars",
                          TickRate = 0
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
      Name = "neutralmonster_buf_red_offense.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "clairvoyanceeyelong.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "monsterbuffs"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "monsterbuffs2"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "blessingofthelizardelder_twisted"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "burning"}
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "slow"}
  }
}
