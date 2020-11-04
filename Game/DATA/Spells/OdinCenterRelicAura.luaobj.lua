BuffTextureName = "48thSlave_Tattoo.dds"
BuffName = "OdinCenterShrineBuff"
PersistsThroughDeath = true
Nondispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetTargetable
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetInvulnerable
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetForceRenderParticles
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetNoRender
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "NeutralMonster_buf_blue_defense.troy",
      Flags = 0,
      EffectIDVar = "buffParticle",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false,
      PersistsThroughReconnect = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "KillMe",
      DestVarTable = "InstanceVars",
      SrcValue = false
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "PotionofGiantStrength_itm.troy",
      Flags = 0,
      EffectIDVar = "Particle",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Nothing",
      SpecificTeamOnly = TEAM_CHAOS,
      UseSpecificUnit = true,
      FOWTeam = TEAM_ORDER,
      FOWVisibilityRadius = 10,
      SendIfOnScreenOrDiscard = false,
      PersistsThroughReconnect = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "PlaceholderShield.troy",
      Flags = 0,
      EffectIDVar = "Particle",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Nothing",
      SpecificTeamOnly = TEAM_CHAOS,
      UseSpecificUnit = true,
      FOWTeam = TEAM_ORDER,
      FOWVisibilityRadius = 10,
      SendIfOnScreenOrDiscard = false,
      PersistsThroughReconnect = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "PotionofElusiveness_itm.troy",
      Flags = 0,
      EffectIDVar = "Particle2",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Nothing",
      SpecificTeamOnly = TEAM_ORDER,
      UseSpecificUnit = true,
      FOWTeam = TEAM_ORDER,
      FOWVisibilityRadius = 10,
      SendIfOnScreenOrDiscard = false,
      PersistsThroughReconnect = false,
      FollowsGroundTilt = false,
      FacesTarget = false
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
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetTargetable
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetInvulnerable
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Owner",
      CallForHelpAttackerVar = "Owner",
      TargetVar = "Owner",
      Damage = 250000,
      DamageType = TRUE_DAMAGE,
      SourceDamageType = DAMAGESOURCE_INTERNALRAW,
      PercentOfAttack = 1,
      SpellDamageRatio = 0,
      PhysicalDamageRatio = 0,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetNoRender
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "KillMe",
      Src1VarTable = "InstanceVars",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "OdinCenterRelicAura",
          ResetDuration = 0
        }
      }
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 0.25,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBForNClosestUnitsInTargetArea,
        Params = {
          AttackerVar = "Owner",
          CenterVar = "Owner",
          Range = 175,
          Flags = "AffectHeroes ",
          IteratorVar = "Unit",
          MaximumUnitsToPick = 1,
          InclusiveBuffFilter = true
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "KillMe",
              Src1VarTable = "InstanceVars",
              Value2 = false,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBGetTeamID,
                Params = {TargetVar = "Unit", DestVar = "TeamID"}
              },
              {
                Function = BBIf,
                Params = {
                  Src1Var = "TeamID",
                  Value2 = TEAM_ORDER,
                  CompareOp = CO_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBSetVarInTable,
                    Params = {
                      DestVar = "NewDuration",
                      SrcValue = 60
                    }
                  },
                  {
                    Function = BBIfHasBuff,
                    Params = {
                      OwnerVar = "Unit",
                      AttackerVar = "Unit",
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
                          OwnerVar = "Unit",
                          AttackerVar = "Unit",
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
                      TargetVar = "Unit",
                      AttackerVar = "Unit",
                      BuffName = "OdinCenterRelicBuff",
                      BuffAddType = BUFF_RENEW_EXISTING,
                      StacksExclusive = true,
                      BuffType = BUFF_CombatEnchancer,
                      MaxStack = 1,
                      NumberOfStacks = 1,
                      Duration = 0,
                      BuffVarsTable = "NextBuffVars",
                      DurationVar = "NewDuration",
                      TickRate = 0,
                      CanMitigateDuration = false,
                      IsHiddenOnClient = false
                    }
                  },
                  {
                    Function = BBSetVarInTable,
                    Params = {
                      DestVar = "KillMe",
                      DestVarTable = "InstanceVars",
                      SrcValue = true
                    }
                  },
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Unit",
                      AttackerVar = "Unit",
                      BuffName = "OdinScoreBigRelic",
                      BuffAddType = BUFF_RENEW_EXISTING,
                      StacksExclusive = true,
                      BuffType = BUFF_Internal,
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
      Name = "neutralmonster_buf_blue_defense.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "potionofgiantstrength_itm.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "placeholdershield.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "potionofelusiveness_itm.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odincenterrelicaura"
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
      Name = "odincenterrelicbuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinscorebigrelic"
    }
  }
}
