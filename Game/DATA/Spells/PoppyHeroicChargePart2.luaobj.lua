OnBuffActivateBuildingBlocks = {
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
      RequiredVar = "NewTargetPos",
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
    Function = BBSetBuffCasterUnit,
    Params = {CasterVar = "Caster"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "NewTargetPos",
      SrcVar = "NewTargetPos",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Damage",
      DestVarTable = "InstanceVars",
      SrcValueByLevel = {
        40,
        80,
        120,
        160,
        200
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "WillRemove",
      DestVarTable = "InstanceVars",
      SrcValue = false
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "WillMove",
      DestVarTable = "InstanceVars",
      SrcValue = true
    }
  },
  {
    Function = BBMove,
    Params = {
      UnitVar = "Owner",
      TargetVar = "NewTargetPos",
      Speed = 0,
      SpeedVar = "SlashSpeed",
      SpeedVarTable = "InstanceVars",
      Gravity = 0,
      MoveBackBy = 0,
      MovementType = FIRST_COLLISION_HIT,
      MovementOrdersType = CANCEL_ORDER
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "HeroicCharge_cas2.troy",
      Flags = 0,
      EffectIDVar = "SelfParticle2",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Target",
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
    Function = BBSetBuffCasterUnit,
    Params = {CasterVar = "Caster"}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Caster",
      Src2Var = "Owner",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBStopCurrentOverrideAnimation,
        Params = {AnimationName = "RunUlt", TargetVar = "Owner"}
      }
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBSetBuffCasterUnit,
    Params = {CasterVar = "Caster"}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Caster",
      Src2Var = "Owner",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
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
            Function = BBPlayAnimation,
            Params = {
              AnimationName = "RunUlt",
              ScaleTime = 0,
              TargetVar = "Owner",
              Loop = true
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "WillMove",
              DestVarTable = "InstanceVars",
              SrcValue = false
            }
          }
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
BuffOnMoveEndBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "SelfParticle2",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBDistanceBetweenObjectAndPoint,
    Params = {
      DestVar = "DistanceVar",
      ObjectVar = "Owner",
      PointVar = "NewTargetPos",
      PointVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "DistanceVar",
      Value2 = 50,
      CompareOp = CO_LESS_THAN_OR_EQUAL
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBIfNotHasBuff,
        Params = {
          OwnerVar = "Owner",
          CasterVar = "Owner",
          BuffName = "PoppyHeroicChargePart2Check"
        },
        SubBlocks = {
          {
            Function = BBSetBuffCasterUnit,
            Params = {CasterVar = "Caster"}
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "Owner",
              Src2Var = "Caster",
              CompareOp = CO_NOT_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Owner",
                  EffectName = "HeroicCharge_tar2.troy",
                  Flags = 0,
                  EffectIDVar = "TargetParticle",
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
                Function = BBApplyDamage,
                Params = {
                  AttackerVar = "Caster",
                  TargetVar = "Owner",
                  Damage = 0,
                  DamageVar = "DamageTwo",
                  DamageVarTable = "InstanceVars",
                  DamageType = MAGIC_DAMAGE,
                  SourceDamageType = DAMAGESOURCE_SPELL,
                  PercentOfAttack = 1,
                  SpellDamageRatio = 0.4,
                  IgnoreDamageIncreaseMods = false,
                  IgnoreDamageCrit = false
                }
              },
              {
                Function = BBApplyStun,
                Params = {
                  AttackerVar = "Caster",
                  TargetVar = "Owner",
                  Duration = 1.5
                }
              }
            }
          },
          {
            Function = BBSpellBuffRemoveCurrent,
            Params = {TargetVar = "Owner"}
          },
          {
            Function = BBSpellEffectRemove,
            Params = {
              EffectIDVar = "SelfParticle2",
              EffectIDVarTable = "InstanceVars"
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "PoppyHeroicChargePart2Check",
              BuffAddType = BUFF_RENEW_EXISTING,
              BuffType = BUFF_Internal,
              MaxStack = 1,
              NumberStacks = 1,
              Duration = 2,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0
            }
          }
        }
      }
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "SelfParticle2",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "heroiccharge_cas2.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "poppyheroicchargepart2check"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "heroiccharge_tar2.troy"
    }
  }
}
