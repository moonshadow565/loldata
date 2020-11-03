NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
AutoCooldownByLevel = {
  20,
  18,
  16,
  14,
  12
}
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "Damage",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Fizz_Jump_cas.troy",
      Flags = 0,
      EffectIDVar = "a",
      EffectIDVarTable = "InstanceVars",
      BoneName = "root",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "TeamID",
      FOWVisibilityRadius = 10,
      SendIfOnScreenOrDiscard = true,
      PersistsThroughReconnect = false,
      BindFlexToOwnerPAR = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Fizz_Jump_WeaponGlow.troy",
      Flags = 0,
      EffectIDVar = "a",
      EffectIDVarTable = "InstanceVars",
      BoneName = "BUFFBONE_CSTM_WEAPON_1",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "TeamID",
      FOWVisibilityRadius = 10,
      SendIfOnScreenOrDiscard = true,
      PersistsThroughReconnect = false,
      BindFlexToOwnerPAR = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  },
  {
    Function = BBDestroyMissileForTarget,
    Params = {TargetVar = "Owner"}
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
      SrcValue = false,
      Status = SetCanAttack
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetCallForHelpSuppresser
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetCanMove
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetCanAttack
    }
  },
  {
    Function = BBDestroyMissileForTarget,
    Params = {TargetVar = "Owner"}
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = true
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 3,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = true
    }
  },
  {
    Function = BBPushCharacterFade,
    Params = {
      TargetVar = "Owner",
      FadeAmount = 0.7,
      fadeTime = 0.05,
      IDVar = "Temp",
      IDVarTable = "InstanceVars"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBIfNotHasBuff,
    Params = {
      OwnerVar = "Owner",
      CasterVar = "Owner",
      BuffName = "FizzJumpTwo"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "FizzJumpDelay",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 0.2,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      },
      {
        Function = BBSealSpellSlot,
        Params = {
          SpellSlot = 0,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          TargetVar = "Owner",
          State = false
        }
      }
    }
  },
  {
    Function = BBPopCharacterFade,
    Params = {
      TargetVar = "Owner",
      IDVar = "Temp",
      IDVarTable = "InstanceVars"
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
SelfExecuteBuildingBlocks = {
  {
    Function = BBGetCastSpellTargetPos,
    Params = {DestVar = "TargetPos"}
  },
  {
    Function = BBGetUnitPosition,
    Params = {UnitVar = "Owner", PositionVar = "OwnerPos"}
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
    Function = BBIf,
    Params = {
      Src1Var = "Distance",
      Value2 = 400,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "GravityVar", SrcValue = 40}
      },
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "SpeedVar", SrcValue = 1325}
      },
      {
        Function = BBFaceDirection,
        Params = {TargetVar = "Owner", LocationVar = "TargetPos"}
      },
      {
        Function = BBGetPointByUnitFacingOffset,
        Params = {
          UnitVar = "Owner",
          Distance = 400,
          OffsetAngle = 0,
          PositionVar = "TargetPos"
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "Distance", SrcValue = 400}
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "Distance",
      Value2 = 300,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "GravityVar", SrcValue = 35}
      },
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "SpeedVar", SrcValue = 1075}
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "Distance",
      Value2 = 200,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "GravityVar", SrcValue = 30}
      },
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "SpeedVar", SrcValue = 1025}
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "Distance",
      Value2 = 100,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "GravityVar", SrcValue = 25}
      },
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "SpeedVar", SrcValue = 800}
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "Distance",
      Value2 = 25,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "GravityVar", SrcValue = 20}
      },
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "SpeedVar", SrcValue = 800}
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "Distance",
      Value2 = 25,
      CompareOp = CO_LESS_THAN
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "GravityVar", SrcValue = 20}
      },
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "SpeedVar", SrcValue = 800}
      },
      {
        Function = BBGetPointByUnitFacingOffset,
        Params = {
          UnitVar = "Owner",
          Distance = 25,
          OffsetAngle = 0,
          PositionVar = "TargetPos"
        }
      }
    }
  },
  {
    Function = BBDestroyMissileForTarget,
    Params = {TargetVar = "Owner"}
  },
  {
    Function = BBUnlockAnimation,
    Params = {OwnerVar = "Owner", Blend = false}
  },
  {
    Function = BBCancelAutoAttack,
    Params = {TargetVar = "Owner", Reset = true}
  },
  {
    Function = BBPlayAnimation,
    Params = {
      AnimationName = "Spell3a",
      ScaleTime = 0.75,
      TargetVar = "Owner",
      Loop = false,
      Blend = true,
      Lock = false
    }
  },
  {
    Function = BBMove,
    Params = {
      UnitVar = "Owner",
      TargetVar = "TargetPos",
      Speed = 0,
      SpeedVar = "SpeedVar",
      Gravity = 0,
      GravityVar = "GravityVar",
      MoveBackBy = 0,
      MovementType = FURTHEST_WITHIN_RANGE,
      MovementOrdersType = CANCEL_ORDER,
      MovementOrdersFacing = FACE_MOVEMENT_DIRECTION,
      IdealDistance = 500
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Damage",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        70,
        115,
        160,
        205,
        250
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Attacker",
      AttackerVar = "Attacker",
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
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "FizzJumpBuffer",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 1,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  }
}
BuffOnMoveEndBuildingBlocks = {
  {
    Function = BBSpellBuffClear,
    Params = {TargetVar = "Owner", BuffName = "FizzJump"}
  },
  {
    Function = BBSpellBuffClear,
    Params = {
      TargetVar = "Owner",
      BuffName = "FizzJumpBuffer"
    }
  },
  {
    Function = BBSpellBuffClear,
    Params = {
      TargetVar = "Owner",
      BuffName = "FizzJumpBuffered"
    }
  }
}
BuffOnMoveSuccessBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBDestroyMissileForTarget,
    Params = {TargetVar = "Owner"}
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      PosVar = "Owner",
      EffectName = "fizz_playfultrickster_idle_sound.troy",
      Flags = 0,
      EffectIDVar = "Temp",
      BoneName = "root",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "TeamID",
      FOWVisibilityRadius = 10,
      SendIfOnScreenOrDiscard = true,
      PersistsThroughReconnect = false,
      BindFlexToOwnerPAR = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "FizzJumpBuffered"
    },
    SubBlocks = {
      {
        Function = BBUnlockAnimation,
        Params = {OwnerVar = "Owner", Blend = true}
      },
      {
        Function = BBSealSpellSlot,
        Params = {
          SpellSlot = 0,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          TargetVar = "Owner",
          State = false
        }
      },
      {
        Function = BBStopMove,
        Params = {TargetVar = "Owner"}
      },
      {
        Function = BBStopMoveBlock,
        Params = {TargetVar = "Owner"}
      },
      {
        Function = BBSpellBuffClear,
        Params = {
          TargetVar = "Owner",
          BuffName = "FizzJumpBuffer"
        }
      },
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "Level",
          SpellSlotValue = 2,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          OwnerVar = "Owner",
          Function = GetSlotSpellLevel
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "TargetPos",
          SrcVar = "JumpBuffer",
          SrcVarTable = "CharVars"
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "FizzJumpBuffered",
          BuffAddType = BUFF_RENEW_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 0.01,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      },
      {
        Function = BBSpellCast,
        Params = {
          CasterVar = "Owner",
          TargetVar = "Nothing",
          PosVar = "TargetPos",
          EndPosVar = "TargetPos",
          OverrideCastPosition = false,
          SlotNumber = 3,
          SlotType = ExtraSlots,
          OverrideForceLevel = 0,
          OverrideForceLevelVar = "Level",
          OverrideCoolDownCheck = false,
          FireWithoutCasting = true,
          UseAutoAttackSpell = false,
          ForceCastingOrChannelling = false,
          UpdateAutoAttackTimer = false
        }
      }
    }
  }
}
BuffOnMoveFailureBuildingBlocks = {
  {
    Function = BBSpellBuffClear,
    Params = {
      TargetVar = "Owner",
      BuffName = "FizzJumpBuffer"
    }
  },
  {
    Function = BBSpellBuffClear,
    Params = {
      TargetVar = "Owner",
      BuffName = "FizzJumpBuffered"
    }
  },
  {
    Function = BBSetSpell,
    Params = {
      SlotNumber = 2,
      SlotType = SpellSlots,
      SlotBook = SPELLBOOK_CHAMPION,
      SpellName = "FizzJump",
      TargetVar = "Owner"
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetPercentCooldownMod,
      TargetVar = "Owner",
      DestVar = "CDReduction"
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BaseCD",
      SrcValueByLevel = {
        16,
        14,
        12,
        10,
        8
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BaseCD",
      Src2Var = "CDReduction",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "LowerCD",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BaseCD",
      Src2Var = "LowerCD",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "NewCD",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBSetSlotSpellCooldownTimeVer2,
    Params = {
      Src = 0,
      SrcVar = "NewCD",
      SlotNumber = 2,
      SlotType = SpellSlots,
      SpellbookType = SPELLBOOK_CHAMPION,
      OwnerVar = "Owner",
      BroadcastEvent = false
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
      Status = SetGhosted
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetCanAttack
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetCanAttack
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetCanMove
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetSilenced
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetForceRenderParticles
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetCallForHelpSuppresser
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
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 3,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = false
    }
  },
  {
    Function = BBUnlockAnimation,
    Params = {OwnerVar = "Owner", Blend = true}
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "fizz_jump_cas.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "fizz_jump_weaponglow.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "fizzjumpdelay"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "fizzjumpbuffer"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "fizz_playfultrickster_idle_sound.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "fizzjumpbuffered"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "fizzjump"}
  }
}
