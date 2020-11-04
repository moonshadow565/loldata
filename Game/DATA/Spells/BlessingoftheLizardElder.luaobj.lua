BuffTextureName = "48thSlave_WaveOfLoathing.dds"
BuffName = "BlessingoftheLizardElder"
AutoBuffActivateEffect = ""
OnBuffActivateBuildingBlocks = {
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
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "buffParticle",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
BuffOnDeathBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Attacker", CompareOp = CO_IS_TYPE_HERO},
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Attacker",
          AttackerVar = "Attacker",
          BuffAddType = BUFF_REPLACE_EXISTING,
          BuffType = BUFF_CombatEnchancer,
          MaxStack = 1,
          NumberStacks = 1,
          Duration = 150,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
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
                          NumberStacks = 1,
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
                          BuffType = BUFF_Internal,
                          MaxStack = 1,
                          NumberStacks = 1,
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
    Function = BBPreloadSpell,
    Params = {Name = "burning"}
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "slow"}
  }
}
