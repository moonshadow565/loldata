NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
BuffTextureName = "JarvanIV_Cataclysm.dds"
BuffName = "JarvanIVCataclysm"
SpellToggleSlot = 4
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "HasDealtDamage",
      DestVarTable = "InstanceVars",
      SrcValue = false
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetCanCast
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "JarvanCataclysm_sound.troy",
      Flags = 0,
      EffectIDVar = "CataclysmSound",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = true
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetCanCast
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "CataclysmSound",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "HasDealtDamage",
      Src1VarTable = "InstanceVars",
      Value2 = false,
      CompareOp = CO_EQUAL
    },
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
          Value2 = 500,
          CompareOp = CO_LESS_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetStatus,
            Params = {
              TargetVar = "Owner",
              SrcValue = true,
              Status = SetCanCast
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "HasDealtDamage",
              DestVarTable = "InstanceVars",
              SrcValue = true
            }
          },
          {
            Function = BBSpellCast,
            Params = {
              CasterVar = "Owner",
              TargetVar = "Attacker",
              PosVar = "Attacker",
              EndPosVar = "Attacker",
              OverrideCastPosition = false,
              SlotNumber = 1,
              SlotType = ExtraSlots,
              OverrideForceLevel = 1,
              OverrideCoolDownCheck = true,
              FireWithoutCasting = false,
              UseAutoAttackSpell = false,
              ForceCastingOrChannelling = false,
              UpdateAutoAttackTimer = false
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
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Attacker",
      AttackerVar = "Attacker",
      BuffName = "JarvanIVCataclysmSelfCheck"
    },
    SubBlocks = {
      {
        Function = BBForEachUnitInTargetArea,
        Params = {
          AttackerVar = "Attacker",
          CenterVar = "Attacker",
          Range = 600,
          Flags = "AffectFriends AffectMinions ",
          IteratorVar = "Unit",
          InclusiveBuffFilter = true
        },
        SubBlocks = {
          {
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Unit",
              AttackerVar = "Attacker",
              BuffName = "JarvanIVCataclysmAttack"
            },
            SubBlocks = {
              {
                Function = BBSetStatus,
                Params = {
                  TargetVar = "Unit",
                  SrcValue = false,
                  Status = SetInvulnerable
                }
              },
              {
                Function = BBApplyDamage,
                Params = {
                  AttackerVar = "Unit",
                  CallForHelpAttackerVar = "Attacker",
                  TargetVar = "Unit",
                  Damage = 10000,
                  DamageType = TRUE_DAMAGE,
                  SourceDamageType = DAMAGESOURCE_INTERNALRAW,
                  PercentOfAttack = 1,
                  SpellDamageRatio = 1,
                  PhysicalDamageRatio = 1,
                  IgnoreDamageIncreaseMods = false,
                  IgnoreDamageCrit = false
                }
              }
            }
          }
        }
      },
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Attacker",
          AttackerVar = "Attacker",
          BuffName = "JarvanIVCataclysmSelfCheck"
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Attacker",
          AttackerVar = "Attacker",
          BuffName = "JarvanIVCataclysmSelfCheck",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_CombatEnchancer,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 3.5,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = true
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Attacker",
          AttackerVar = "Target",
          BuffName = "JarvanIVCataclysm",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_CombatEnchancer,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 3.5,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = true
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "UnstoppableForceMarker",
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
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Owner",
          BuffName = "JarvanIVCataclysmVisibility",
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
      },
      {
        Function = BBDistanceBetweenObjects,
        Params = {
          DestVar = "Distance",
          ObjectVar1 = "Attacker",
          ObjectVar2 = "Target"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "Distance",
          Src1Value = 0,
          Src2Value = 25,
          DestVar = "DistanceCheck2",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "Distance",
          Src1Value = 0,
          Src2Value = 150,
          DestVar = "DistanceCheck",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBGetPointByUnitFacingOffset,
        Params = {
          UnitVar = "Owner",
          Distance = 0,
          DistanceVar = "DistanceCheck2",
          OffsetAngle = 0,
          PositionVar = "PathablePoint2"
        }
      },
      {
        Function = BBGetPointByUnitFacingOffset,
        Params = {
          UnitVar = "Owner",
          Distance = 0,
          DistanceVar = "DistanceCheck",
          OffsetAngle = 0,
          PositionVar = "PathablePoint"
        }
      },
      {
        Function = BBIsPathable,
        Params = {
          DestPosVar = "PathablePoint2",
          ResultVar = "PathableVar2"
        }
      },
      {
        Function = BBIsPathable,
        Params = {
          DestPosVar = "PathablePoint",
          ResultVar = "PathableVar"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "PathableVar2",
          Value2 = false,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMoveToUnit,
            Params = {
              UnitVar = "Attacker",
              TargetVar = "Target",
              Speed = 0,
              Gravity = 150,
              MovementOrdersType = CANCEL_ORDER,
              MoveBackBy = 1,
              MaxTrackDistance = 1500,
              IdealDistance = 0,
              IdealDistanceVar = "Distance",
              TimeOverride = 0.4
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
            Params = {
              Src1Var = "PathableVar",
              Value2 = true,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBMoveToUnit,
                Params = {
                  UnitVar = "Attacker",
                  TargetVar = "Target",
                  Speed = 0,
                  Gravity = 150,
                  MovementOrdersType = CANCEL_ORDER,
                  MoveBackBy = 125,
                  MaxTrackDistance = 1500,
                  IdealDistance = 0,
                  IdealDistanceVar = "Distance",
                  TimeOverride = 0.4
                }
              }
            }
          },
          {
            Function = BBElse,
            Params = {},
            SubBlocks = {
              {
                Function = BBMoveToUnit,
                Params = {
                  UnitVar = "Attacker",
                  TargetVar = "Target",
                  Speed = 0,
                  Gravity = 150,
                  MovementOrdersType = CANCEL_ORDER,
                  MoveBackBy = 1,
                  MaxTrackDistance = 1500,
                  IdealDistance = 0,
                  IdealDistanceVar = "Distance",
                  TimeOverride = 0.4
                }
              }
            }
          }
        }
      },
      {
        Function = BBSetSlotSpellCooldownTime,
        Params = {
          SrcValue = 1,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          SpellSlotValue = 3,
          OwnerVar = "Owner"
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "jarvancataclysm_sound.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jarvanivcataclysmselfcheck"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jarvanivcataclysmattack"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jarvanivcataclysm"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "unstoppableforcemarker"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jarvanivcataclysmvisibility"
    }
  }
}
