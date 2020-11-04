NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
AutoCooldownByLevel = {
  22,
  18,
  14,
  10,
  6
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "katarina_shadowStep_cas.troy",
      Flags = 0,
      EffectIDVar = "SmokeBomb",
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
    Function = BBGetUnitPosition,
    Params = {UnitVar = "Owner", PositionVar = "CastPos"}
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Nothing",
      PosVar = "CastPos",
      EffectName = "katarina_shadowStep_return.troy",
      Flags = 0,
      EffectIDVar = "p3",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_NEUTRAL,
      FOWVisibilityRadius = 900,
      SendIfOnScreenOrDiscard = true,
      PersistsThroughReconnect = false,
      BindFlexToOwnerPAR = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBFaceDirection,
    Params = {TargetVar = "Owner", LocationVar = "Target"}
  },
  {
    Function = BBDistanceBetweenObjects,
    Params = {
      DestVar = "Distance",
      ObjectVar1 = "Owner",
      ObjectVar2 = "Target"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Distance",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "finalDistance",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "finalDistance",
      Src1Value = 0,
      Src2Value = 250,
      DestVar = "finalDistance",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Owner",
      Distance = 0,
      DistanceVar = "finalDistance",
      OffsetAngle = 0,
      PositionVar = "TargetPos"
    }
  },
  {
    Function = BBIsPathable,
    Params = {DestPosVar = "TargetPos", ResultVar = "Temp"}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Temp",
      Value2 = false,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "finalDistance",
          Src1Value = 0,
          Src2Value = 200,
          DestVar = "finalDistance",
          MathOp = MO_SUBTRACT
        }
      }
    }
  },
  {
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Owner",
      Distance = 0,
      DistanceVar = "finalDistance",
      OffsetAngle = 0,
      PositionVar = "TargetPos"
    }
  },
  {
    Function = BBTeleportToPosition,
    Params = {OwnerVar = "Owner", CastPositionName = "TargetPos"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DamageVar",
      SrcValueByLevel = {
        80,
        120,
        160,
        200,
        240
      }
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 1,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "KIDamage",
      SrcValueByLevel = {
        8,
        12,
        16,
        20,
        24
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "DamageVar",
      Src2Var = "KIDamage",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "DamageVar",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "KillerInstinct"
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "DamageReduction",
          DestVarTable = "NextBuffVars",
          SrcValueByLevel = {
            0.15,
            0.2,
            0.25,
            0.3,
            0.35
          }
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Attacker",
          BuffName = "ShadowStepDodge",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_CombatEnchancer,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 3,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      },
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "KillerInstinct",
          ResetDuration = 0
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Target",
      Src2Var = "Owner",
      CompareOp = CO_DIFFERENT_TEAM
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Target",
          PosVar = "TargetPos",
          EffectName = "katarina_shadowStep_tar.troy",
          Flags = 0,
          EffectIDVar = "PH",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = true,
          PersistsThroughReconnect = false,
          BindFlexToOwnerPAR = false,
          FollowsGroundTilt = false,
          FacesTarget = false
        }
      },
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          CallForHelpAttackerVar = "Attacker",
          TargetVar = "Target",
          Damage = 0,
          DamageVar = "DamageVar",
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELL,
          PercentOfAttack = 1,
          SpellDamageRatio = 0.75,
          PhysicalDamageRatio = 1,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      },
      {
        Function = BBIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_HERO},
        SubBlocks = {
          {
            Function = BBIssueOrder,
            Params = {
              WhomToOrderVar = "Owner",
              TargetOfOrderVar = "Target",
              Order = AI_ATTACKTO
            }
          }
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
          OwnerVar = "Target",
          AttackerVar = "Nothing",
          BuffName = "SharedWardBuff"
        },
        SubBlocks = {
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Target",
              AttackerVar = "Attacker",
              BuffName = "Destealth",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Internal,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 2,
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
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "katarina_shadowstep_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "katarina_shadowstep_return.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "shadowstepdodge"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "katarina_shadowstep_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "destealth"}
  }
}
