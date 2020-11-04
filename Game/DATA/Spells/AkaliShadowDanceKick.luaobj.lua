BuffTextureName = "AkaliShadowDance.dds"
BuffName = "AkaliShadowDance"
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
    Function = BBMove,
    Params = {
      UnitVar = "Owner",
      TargetVar = "TargetPos",
      Speed = 0,
      SpeedVar = "dashSpeed",
      SpeedVarTable = "InstanceVars",
      Gravity = 0,
      MoveBackBy = 0,
      MovementType = FURTHEST_WITHIN_RANGE,
      MovementOrdersType = CANCEL_ORDER,
      IdealDistance = 0,
      IdealDistanceVar = "Distance",
      IdealDistanceVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "akali_shadowDance_mis.troy",
      Flags = 0,
      EffectIDVar = "SelfParticle",
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
    Function = BBPlayAnimation,
    Params = {
      AnimationName = "Spell4",
      ScaleTime = 0,
      TargetVar = "Owner",
      Loop = true,
      Blend = false
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
    Function = BBSetBuffCasterUnit,
    Params = {CasterVar = "Caster"}
  },
  {
    Function = BBBreakSpellShields,
    Params = {TargetVar = "Caster"}
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Caster",
      AttackerVar = "Owner",
      BuffName = "AkaliShadowDanceKickParticle",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 0.1,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Owner",
      TargetVar = "Caster",
      Damage = 0,
      DamageVar = "DamageVar",
      DamageVarTable = "InstanceVars",
      DamageType = MAGIC_DAMAGE,
      SourceDamageType = DAMAGESOURCE_SPELL,
      PercentOfAttack = 1,
      SpellDamageRatio = 0.5,
      PhysicalDamageRatio = 1,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "VampPercent",
      Src1VarTable = "CharVars",
      Value2 = 0,
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBGetStat,
        Params = {
          Stat = GetFlatSpellBlockMod,
          TargetVar = "Caster",
          DestVar = "MR"
        }
      },
      {
        Function = BBGetStat,
        Params = {
          Stat = GetFlatMagicDamageMod,
          TargetVar = "Owner",
          DestVar = "APCoeff"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "APCoeff",
          Src1Value = 0,
          Src2Value = 0.5,
          DestVar = "APCoeff",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "MR",
          Src1Value = 100,
          Src2Value = 0,
          DestVar = "Denominator",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "MR",
          Src2Var = "Denominator",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "Right",
          MathOp = MO_DIVIDE
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "Right",
          Src1Value = 1,
          Src2Value = 0,
          DestVar = "DR",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "APCoeff",
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
        Function = BBMath,
        Params = {
          Src1Var = "DR",
          Src2Var = "DamageVar",
          Src2VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "DmgDealt",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "VampPercent",
          Src1VarTable = "CharVars",
          Src2Var = "DmgDealt",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "Health",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBIncHealth,
        Params = {
          TargetVar = "Owner",
          Delta = 0,
          DeltaVar = "Health",
          HealerVar = "Owner"
        }
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "WillRemove",
      DestVarTable = "InstanceVars",
      SrcValue = true
    }
  },
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "AkaliShadowDanceKick"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "akali_shadowdance_mis.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "akalishadowdancekickparticle"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "akalishadowdancekick"
    }
  }
}
