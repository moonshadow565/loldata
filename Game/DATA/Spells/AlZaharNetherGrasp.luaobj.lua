NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
ChannelDuration = 2.5
BuffTextureName = "AlZahar_NetherGrasp.dds"
BuffName = "AlZaharNetherGrasp"
AutoBuffActivateEffect = "Stun_glb.troy"
AutoBuffActivateAttachBoneName = "head"
AutoBuffActivateEffect2 = "AlZaharNetherGrasp_tar.troy"
AutoBuffActivateAttachBoneName2 = "root"
PopupMessage1 = "game_floatingtext_Stunned"
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetStunned
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetStunned
    }
  }
}
ChannelingStartBuildingBlocks = {
  {
    Function = BBIfNotHasBuff,
    Params = {
      OwnerVar = "Attacker",
      CasterVar = "Attacker",
      BuffName = "IfHasBuffCheck"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "AlZaharVoidlingCount",
          BuffAddType = BUFF_STACKS_AND_RENEWS,
          StacksExclusive = true,
          BuffType = BUFF_CombatEnchancer,
          MaxStack = 4,
          NumberOfStacks = 1,
          Duration = 25000,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false
        }
      }
    }
  },
  {
    Function = BBBreakSpellShields,
    Params = {TargetVar = "Target"}
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "AlZaharNetherGraspSound",
      BuffAddType = BUFF_STACKS_AND_RENEWS,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 4,
      NumberOfStacks = 1,
      Duration = 2.5,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DamageToDeal",
      SrcValueByLevel = {
        50,
        80,
        110
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DamageToDeal",
      DestVarTable = "CharVars",
      SrcVar = "DamageToDeal"
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "AlzaharNetherGrasp_beam.troy",
      Flags = 0,
      EffectIDVar = "ParticleID",
      EffectIDVarTable = "InstanceVars",
      BoneName = "head",
      TargetObjectVar = "Target",
      TargetBoneName = "root",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Owner",
      BuffName = "AlZaharNetherGrasp",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Stun,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 2.5,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = true
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Owner",
      TargetVar = "Target",
      Damage = 0,
      DamageVar = "DamageToDeal",
      DamageType = MAGIC_DAMAGE,
      SourceDamageType = DAMAGESOURCE_SPELL,
      PercentOfAttack = 1,
      SpellDamageRatio = 0.3,
      PhysicalDamageRatio = 1,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  }
}
ChannelingUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 0.5,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBDistanceBetweenObjects,
        Params = {
          DestVar = "Distance",
          ObjectVar1 = "Target",
          ObjectVar2 = "Owner"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Distance",
          Value2 = 1000,
          CompareOp = CO_GREATER_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBStopChanneling,
            Params = {
              CasterVar = "Owner",
              StopCondition = ChannelingStopCondition_Cancel,
              StopSource = ChannelingStopSource_LostTarget
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_DEAD},
        SubBlocks = {
          {
            Function = BBStopChanneling,
            Params = {
              CasterVar = "Owner",
              StopCondition = ChannelingStopCondition_Cancel,
              StopSource = ChannelingStopSource_LostTarget
            }
          }
        }
      },
      {
        Function = BBIfNotHasBuff,
        Params = {
          OwnerVar = "Target",
          CasterVar = "Owner",
          BuffName = "AlZaharNetherGrasp"
        },
        SubBlocks = {
          {
            Function = BBStopChanneling,
            Params = {
              CasterVar = "Owner",
              StopCondition = ChannelingStopCondition_Cancel,
              StopSource = ChannelingStopSource_LostTarget
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
            Params = {Src1Var = "Owner", CompareOp = CO_IS_DEAD},
            SubBlocks = {
              {
                Function = BBSpellEffectRemove,
                Params = {
                  EffectIDVar = "ParticleID",
                  EffectIDVarTable = "InstanceVars"
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
                  AttackerVar = "Owner",
                  TargetVar = "Target",
                  Damage = 0,
                  DamageVar = "DamageToDeal",
                  DamageVarTable = "CharVars",
                  DamageType = MAGIC_DAMAGE,
                  SourceDamageType = DAMAGESOURCE_SPELL,
                  PercentOfAttack = 1,
                  SpellDamageRatio = 0.3,
                  PhysicalDamageRatio = 1,
                  IgnoreDamageIncreaseMods = false,
                  IgnoreDamageCrit = false
                }
              }
            }
          }
        }
      }
    }
  }
}
ChannelingSuccessStopBuildingBlocks = {
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffName = "AlZaharNetherGrasp"
    }
  },
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "AlZaharNetherGraspSound"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "ParticleID",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
ChannelingCancelStopBuildingBlocks = {
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffName = "AlZaharNetherGrasp"
    }
  },
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "AlZaharNetherGraspSound"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "ParticleID",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "ifhasbuffcheck"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "alzaharvoidlingcount"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "alzaharnethergraspsound"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "alzaharnethergrasp_beam.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "alzaharnethergrasp"
    }
  }
}
