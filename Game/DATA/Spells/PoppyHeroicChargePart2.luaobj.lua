BuffTextureName = "Poppy_HeroicCharge.dds"
AutoBuffActivateEffect = "HeroicCharge_cas2.troy"
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
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Caster",
      Function = GetSlotSpellLevel
    }
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
      DestVar = "DamageTwo",
      DestVarTable = "InstanceVars",
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
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetGhosted
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
      EffectIDVar = "ParticleCharge2",
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
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "ParticleCharge2",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetGhosted
    }
  }
}
BuffOnMoveEndBuildingBlocks = {
  {
    Function = BBSetBuffCasterUnit,
    Params = {CasterVar = "Caster"}
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
      Value2 = 75,
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
            Function = BBElse,
            Params = {}
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
              NumberOfStacks = 1,
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
    Function = BBSpellBuffRemoveCurrent,
    Params = {TargetVar = "Owner"}
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
