BuffTextureName = "AkaliShadowDance.dds"
BuffName = "AkaliShadowDance"
IsDeathRecapSource = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "dashSpeed",
      RequiredVarTable = "InstanceVars"
    }
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
      RequiredVar = "Distance",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "DamageVar",
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
    Function = BBDistanceBetweenObjects,
    Params = {
      DestVar = "Distance",
      ObjectVar1 = "Attacker",
      ObjectVar2 = "Owner"
    }
  },
  {
    Function = BBMoveToUnit,
    Params = {
      UnitVar = "Owner",
      TargetVar = "Attacker",
      Speed = 0,
      SpeedVar = "dashSpeed",
      SpeedVarTable = "InstanceVars",
      Gravity = 0,
      MovementOrdersType = CANCEL_ORDER,
      MoveBackBy = 0,
      MaxTrackDistance = 2000,
      IdealDistance = 0,
      IdealDistanceVar = "Distance",
      TimeOverride = 0
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "blindMonk_Q_resonatingStrike_mis.troy",
      Flags = 0,
      EffectIDVar = "SelfParticle",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false,
      PersistsThroughReconnect = false,
      BindFlexToOwnerPAR = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  },
  {
    Function = BBPlayAnimation,
    Params = {
      AnimationName = "Spell1b",
      ScaleTime = 0,
      TargetVar = "Owner",
      Loop = true,
      Blend = false,
      Lock = true
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
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetGhosted
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "SelfParticle",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBUnlockAnimation,
    Params = {OwnerVar = "Owner", Blend = true}
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
BuffOnUpdateActionsBuildingBlocks = {
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
    Function = BBSetVarInTable,
    Params = {
      DestVar = "WillRemove",
      DestVarTable = "InstanceVars",
      SrcValue = true
    }
  }
}
BuffOnMoveSuccessBuildingBlocks = {
  {
    Function = BBSetBuffCasterUnit,
    Params = {CasterVar = "Caster"}
  },
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "CasterHealth",
      OwnerVar = "Caster",
      Function = GetMaxHealth,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "HealthPercent",
      OwnerVar = "Caster",
      Function = GetHealthPercent,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "HealthPercent",
      Src1Value = 1,
      Src2Value = 0,
      DestVar = "MissingHealthPerc",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "CasterHealth",
      Src2Var = "MissingHealthPerc",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "MissingHealth",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "MissingHealth",
      Src1Value = 0.1,
      Src2Value = 0,
      DestVar = "BonusDamage",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Caster", DestVar = "CasterID"}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "CasterID",
      Value2 = TEAM_NEUTRAL,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "BonusDamage",
          Src1Value = 0,
          Src2Value = 400,
          DestVar = "BonusDamage",
          MathOp = MO_MIN
        }
      }
    }
  },
  {
    Function = BBBreakSpellShields,
    Params = {TargetVar = "Caster"}
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BonusDamage",
      Src2Var = "DamageVar",
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "DamageVar",
      DestVarTable = "InstanceVars",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Caster",
      AttackerVar = "Owner",
      BuffName = "BlindMonkQTwoDashParticle",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 0.1,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Owner",
      CallForHelpAttackerVar = "Owner",
      TargetVar = "Caster",
      Damage = 0,
      DamageVar = "DamageVar",
      DamageVarTable = "InstanceVars",
      DamageType = PHYSICAL_DAMAGE,
      SourceDamageType = DAMAGESOURCE_SPELL,
      PercentOfAttack = 1,
      SpellDamageRatio = 0,
      PhysicalDamageRatio = 0,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = true
    }
  },
  {
    Function = BBSpellBuffRemoveCurrent,
    Params = {TargetVar = "Owner"}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Owner",
      Src2Var = "Caster",
      CompareOp = CO_DIFFERENT_TEAM
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Caster", CompareOp = CO_IS_TYPE_HERO},
        SubBlocks = {
          {
            Function = BBIssueOrder,
            Params = {
              WhomToOrderVar = "Owner",
              TargetOfOrderVar = "Caster",
              Order = AI_ATTACKTO
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
      Name = "blindmonk_q_resonatingstrike_mis.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "blindmonkqtwodashparticle"
    }
  }
}
