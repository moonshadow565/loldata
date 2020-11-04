NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "FallenAngel_Purgatory.dds"
BuffName = "Soul Shackles"
AutoBuffActivateEffect = "SoulShackle_buf.troy"
AutoBuffActivateEffect2 = "SoulShackle_tar.troy"
AutoCooldownByLevel = {
  80,
  80,
  80
}
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "BreakDamage",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "BreakStun",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "Broken",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Attacker",
      EffectName = "SoulShackle_beam.troy",
      Flags = 0,
      EffectIDVar = "ParticleID",
      EffectIDVarTable = "InstanceVars",
      BoneName = "spine",
      TargetObjectVar = "Owner",
      TargetBoneName = "spine",
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
      EffectIDVar = "ParticleID",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Broken",
      Src1VarTable = "InstanceVars",
      Value2 = false,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          TargetVar = "Owner",
          Damage = 0,
          DamageVar = "BreakDamage",
          DamageVarTable = "InstanceVars",
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELL,
          PercentOfAttack = 1,
          SpellDamageRatio = 1
        }
      },
      {
        Function = BBApplyStun,
        Params = {
          AttackerVar = "Attacker",
          TargetVar = "Owner",
          Duration = 0,
          DurationVar = "BreakStun",
          DurationVarTable = "InstanceVars"
        }
      }
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMultiplicativeMovementSpeedMod,
      TargetVar = "Owner",
      Delta = -0.2
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 0.5,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = true
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Attacker", CompareOp = CO_IS_DEAD},
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "Broken",
              DestVarTable = "InstanceVars",
              SrcValue = true
            }
          },
          {
            Function = BBSpellBuffRemoveCurrent,
            Params = {TargetVar = "Owner"}
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBIf,
            Params = {Src1Var = "Owner", CompareOp = CO_IS_DEAD},
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "Broken",
                  DestVarTable = "InstanceVars",
                  SrcValue = true
                }
              },
              {
                Function = BBSpellBuffRemoveCurrent,
                Params = {TargetVar = "Owner"}
              }
            }
          },
          {
            Function = BBElse,
            Params = {},
            SubBlocks = {
              {
                Function = BBDistanceBetweenObjects,
                Params = {
                  DestVar = "Distance",
                  ObjectVar1 = "Owner",
                  ObjectVar2 = "Attacker"
                }
              },
              {
                Function = BBIf,
                Params = {
                  Src1Var = "Distance",
                  Value2 = 600,
                  CompareOp = CO_GREATER_THAN
                },
                SubBlocks = {
                  {
                    Function = BBSetVarInTable,
                    Params = {
                      DestVar = "Broken",
                      DestVarTable = "InstanceVars",
                      SrcValue = true
                    }
                  },
                  {
                    Function = BBSpellBuffRemoveCurrent,
                    Params = {TargetVar = "Owner"}
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
CanCastBuildingBlocks = {
  {
    Function = BBSetReturnValue,
    Params = {SrcValue = false}
  },
  {
    Function = BBForEachUnitInTargetAreaRandom,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 600,
      Flags = "AffectEnemies AffectHeroes ",
      IteratorVar = "Unit",
      MaximumUnitsToPick = 1
    },
    SubBlocks = {
      {
        Function = BBSetReturnValue,
        Params = {SrcValue = true}
      }
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BreakDamage",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        175,
        250,
        350
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BreakStun",
      DestVarTable = "NextBuffVars",
      SrcValue = 0,
      SrcValueByLevel = {
        2,
        2.5,
        3
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Broken",
      DestVarTable = "NextBuffVars",
      SrcValue = false
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_CombatDehancer,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 4,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      TargetVar = "Target",
      Damage = 0,
      DamageVar = "BreakDamage",
      DamageVarTable = "NextBuffVars",
      DamageType = MAGIC_DAMAGE,
      SourceDamageType = DAMAGESOURCE_SPELL,
      PercentOfAttack = 1,
      SpellDamageRatio = 1
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "soulshackle_beam.troy"
    }
  }
}
