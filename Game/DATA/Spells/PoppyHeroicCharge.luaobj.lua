NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "MasterYi_LeapStrike.dds"
BuffName = "Alpha Striking"
AutoBuffActivateEffect = ""
ChainMissileParameters = {
  MaximumHits = {
    4,
    4,
    4,
    4,
    4
  },
  CanHitCaster = 0,
  CanHitSameTarget = 0,
  CanHitSameTargetConsecutively = 0
}
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "TargetPos",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "Damage",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "DamageTwo",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "WillRemove",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "SlashSpeed",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "TargetPos",
      SrcVar = "TargetPos",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBMove,
    Params = {
      UnitVar = "Owner",
      TargetVar = "TargetPos",
      Speed = 0,
      SpeedVar = "SlashSpeed",
      SpeedVarTable = "InstanceVars",
      Gravity = 0,
      MoveBackBy = 0,
      MovementType = FURTHEST_WITHIN_RANGE,
      MovementOrdersType = CANCEL_ORDER,
      IdealDistance = 0
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "HeroicCharge_cas.troy",
      Flags = 0,
      EffectIDVar = "ParticleCharge",
      EffectIDVarTable = "InstanceVars",
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
    Function = BBPlayAnimation,
    Params = {
      AnimationName = "RunUlt",
      ScaleTime = 0,
      TargetVar = "Owner",
      Loop = true,
      Blend = false
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBStopCurrentOverrideAnimation,
    Params = {
      AnimationName = "RunUlt",
      TargetVar = "Owner",
      Blend = false
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "ParticleCharge",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "WillMove",
      Src1VarTable = "InstanceVars",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "WillMove",
          DestVarTable = "InstanceVars",
          SrcValue = false
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "WillRemove",
      Src1VarTable = "InstanceVars",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemoveCurrent,
        Params = {TargetVar = "Owner"}
      }
    }
  }
}
CanCastBuildingBlocks = {
  {
    Function = BBGetStatus,
    Params = {
      TargetVar = "Owner",
      DestVar = "CanMove",
      Status = GetCanMove
    }
  },
  {
    Function = BBGetStatus,
    Params = {
      TargetVar = "Owner",
      DestVar = "CanCast",
      Status = GetCanCast
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "CanMove",
      Value2 = true,
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetReturnValue,
        Params = {SrcValue = false}
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "CanCast",
      Value2 = true,
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetReturnValue,
        Params = {SrcValue = false}
      }
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetCastSpellTargetPos,
    Params = {DestVar = "TargetPos"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "TargetPos",
      DestVarTable = "NextBuffVars",
      SrcVar = "TargetPos"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Damage",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        50,
        75,
        100,
        125,
        150
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DamageTwo",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        75,
        125,
        175,
        225,
        275
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "WillMove",
      DestVarTable = "NextBuffVars",
      SrcValue = true
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "WillRemove",
      DestVarTable = "NextBuffVars",
      SrcValue = false
    }
  },
  {
    Function = BBGetUnitPosition,
    Params = {UnitVar = "Owner", PositionVar = "OwnerPos"}
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetMovementSpeed,
      TargetVar = "Owner",
      DestVar = "MoveSpeed"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "MoveSpeed",
      Src1Value = 0,
      Src2Value = 1200,
      DestVar = "SlashSpeed",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBDistanceBetweenPoints,
    Params = {
      DestVar = "Distance",
      Point1Var = "OwnerPos",
      Point2Var = "TargetPos"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Distance",
      Src2Var = "SlashSpeed",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "Duration",
      MathOp = MO_DIVIDE
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "SlashSpeed",
      DestVarTable = "NextBuffVars",
      SrcVar = "SlashSpeed"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Target",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 0.05,
      BuffVarsTable = "NextBuffVars",
      DurationVar = "Duration",
      TickRate = 0,
      CanMitigateDuration = false
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "PoppyHeroicChargePoppyFix",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 3,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  }
}
BuffOnMoveEndBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "PoppyHeroicChargePart2Fix",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 0.01,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  },
  {
    Function = BBIfNotHasBuff,
    Params = {
      OwnerVar = "Owner",
      CasterVar = "Owner",
      BuffName = "PoppyHeroicChargeCheck"
    },
    SubBlocks = {
      {
        Function = BBSetBuffCasterUnit,
        Params = {CasterVar = "Caster"}
      },
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Caster",
          AttackerVar = "Caster",
          BuffName = "PoppyHeroicChargePoppyFix"
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "DamageTwo",
              Src1VarTable = "InstanceVars",
              Src2Var = "Damage",
              Src2VarTable = "InstanceVars",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "DamageTwo",
              DestVarTable = "InstanceVars",
              MathOp = MO_ADD
            }
          },
          {
            Function = BBBreakSpellShields,
            Params = {TargetVar = "Caster"}
          },
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Owner",
              CallForHelpAttackerVar = "Attacker",
              TargetVar = "Caster",
              Damage = 0,
              DamageVar = "DamageTwo",
              DamageVarTable = "InstanceVars",
              DamageType = MAGIC_DAMAGE,
              SourceDamageType = DAMAGESOURCE_SPELL,
              PercentOfAttack = 1,
              SpellDamageRatio = 0.8,
              PhysicalDamageRatio = 1,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          },
          {
            Function = BBApplyStun,
            Params = {
              AttackerVar = "Owner",
              TargetVar = "Caster",
              Duration = 1.5
            }
          },
          {
            Function = BBUnlockAnimation,
            Params = {OwnerVar = "Owner", Blend = false}
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "PoppyHeroicChargeCheck",
              BuffAddType = BUFF_RENEW_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Internal,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 2,
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
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Owner",
              EffectName = "HeroicCharge_tar.troy",
              Flags = 0,
              EffectIDVar = "TargetParticle",
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
            Function = BBForEachUnitInTargetArea,
            Params = {
              AttackerVar = "Owner",
              CenterVar = "Owner",
              Range = 325,
              Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
              IteratorVar = "Unit",
              InclusiveBuffFilter = true
            },
            SubBlocks = {
              {
                Function = BBIf,
                Params = {
                  Src1Var = "Caster",
                  Src2Var = "Unit",
                  CompareOp = CO_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBIf,
                    Params = {
                      Src1Var = "Unit",
                      Src2Var = "Owner",
                      CompareOp = CO_DIFFERENT_TEAM
                    },
                    SubBlocks = {
                      {
                        Function = BBApplyDamage,
                        Params = {
                          AttackerVar = "Owner",
                          CallForHelpAttackerVar = "Attacker",
                          TargetVar = "Unit",
                          Damage = 0,
                          DamageVar = "Damage",
                          DamageVarTable = "InstanceVars",
                          DamageType = MAGIC_DAMAGE,
                          SourceDamageType = DAMAGESOURCE_SPELL,
                          PercentOfAttack = 1,
                          SpellDamageRatio = 0.4,
                          PhysicalDamageRatio = 1,
                          IgnoreDamageIncreaseMods = false,
                          IgnoreDamageCrit = false
                        }
                      },
                      {
                        Function = BBApplySilence,
                        Params = {
                          AttackerVar = "Owner",
                          TargetVar = "Unit",
                          Duration = 0.01
                        }
                      },
                      {
                        Function = BBGetPointByUnitFacingOffset,
                        Params = {
                          UnitVar = "Owner",
                          Distance = 400,
                          OffsetAngle = 0,
                          PositionVar = "NewTargetPos"
                        }
                      },
                      {
                        Function = BBSetVarInTable,
                        Params = {
                          DestVar = "SlashSpeed",
                          DestVarTable = "NextBuffVars",
                          SrcVar = "SlashSpeed",
                          SrcVarTable = "InstanceVars"
                        }
                      },
                      {
                        Function = BBSetVarInTable,
                        Params = {
                          DestVar = "NewTargetPos",
                          DestVarTable = "NextBuffVars",
                          SrcVar = "NewTargetPos"
                        }
                      },
                      {
                        Function = BBSetVarInTable,
                        Params = {
                          DestVar = "DamageTwo",
                          DestVarTable = "NextBuffVars",
                          SrcVar = "DamageTwo",
                          SrcVarTable = "InstanceVars"
                        }
                      },
                      {
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Owner",
                          AttackerVar = "Owner",
                          BuffName = "PoppyHeroicChargePart2",
                          BuffAddType = BUFF_REPLACE_EXISTING,
                          StacksExclusive = true,
                          BuffType = BUFF_Internal,
                          MaxStack = 1,
                          NumberOfStacks = 1,
                          Duration = 2,
                          BuffVarsTable = "NextBuffVars",
                          TickRate = 0,
                          CanMitigateDuration = false
                        }
                      },
                      {
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Unit",
                          AttackerVar = "Owner",
                          BuffName = "PoppyHeroicChargePart2",
                          BuffAddType = BUFF_REPLACE_EXISTING,
                          StacksExclusive = true,
                          BuffType = BUFF_Stun,
                          MaxStack = 1,
                          NumberOfStacks = 1,
                          Duration = 2,
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
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "PoppyHeroicChargeCheck",
              BuffAddType = BUFF_RENEW_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Internal,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 2,
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
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "heroiccharge_cas.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "poppyheroicchargepoppyfix"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "poppyheroicchargepart2fix"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "poppyheroicchargecheck"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "heroiccharge_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "poppyheroicchargepart2"
    }
  }
}
