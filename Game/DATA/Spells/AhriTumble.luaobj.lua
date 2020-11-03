NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Ahri_SpiritRush.dds"
BuffName = "AhriTumble"
AutoBuffActivateEffect = ""
PersistsThroughDeath = true
ChainMissileParameters = {
  MaximumHits = {
    10,
    10,
    10,
    10,
    10
  },
  CanHitCaster = 0,
  CanHitSameTarget = 0,
  CanHitSameTargetConsecutively = 0,
  CanHitEnemies = 1,
  CanHitFriends = 0
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBGetBuffCountFromAll,
    Params = {
      DestVar = "Count",
      TargetVar = "Owner",
      BuffName = "AhriTumble"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Count",
      Value2 = 0,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "Level",
          SpellSlotValue = 3,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          OwnerVar = "Owner",
          Function = GetSlotSpellLevel
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "NewCd",
          DestVarTable = "InstanceVars",
          SrcValueByLevel = {
            80,
            70,
            60,
            0,
            0
          }
        }
      },
      {
        Function = BBGetStat,
        Params = {
          Stat = GetPercentCooldownMod,
          TargetVar = "Owner",
          DestVar = "CooldownStat"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "CooldownStat",
          Src1Value = 1,
          Src2Value = 0,
          DestVar = "Multiplier",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "Multiplier",
          Src2Var = "NewCd",
          Src2VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "NewCooldown",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBSetSlotSpellCooldownTimeVer2,
        Params = {
          Src = 0,
          SrcVar = "NewCooldown",
          SlotNumber = 3,
          SlotType = SpellSlots,
          SpellbookType = SPELLBOOK_CHAMPION,
          OwnerVar = "Owner",
          BroadcastEvent = true
        }
      },
      {
        Function = BBSetPARCostInc,
        Params = {
          SpellSlotOwnerVar = "Owner",
          SpellSlot = 3,
          SlotType = SpellSlots,
          Cost = 0,
          PARType = PAR_MANA
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
SelfExecuteBuildingBlocks = {
  {
    Function = BBGetBuffCountFromAll,
    Params = {
      DestVar = "Count",
      TargetVar = "Owner",
      BuffName = "AhriTumble"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Count",
      Value2 = 0,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "AhriTumble",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_CombatEnchancer,
          MaxStack = 2,
          NumberOfStacks = 2,
          Duration = 10,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0.25,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      },
      {
        Function = BBSetSlotSpellCooldownTimeVer2,
        Params = {
          Src = 0.75,
          SlotNumber = 3,
          SlotType = SpellSlots,
          SpellbookType = SPELLBOOK_CHAMPION,
          OwnerVar = "Owner",
          BroadcastEvent = true
        }
      },
      {
        Function = BBSetPARCostInc,
        Params = {
          SpellSlotOwnerVar = "Owner",
          SpellSlot = 3,
          SlotType = SpellSlots,
          Cost = -150,
          PARType = PAR_MANA
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "Count",
      Value2 = 1,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemoveStacks,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "AhriTumble",
          NumStacks = 1
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "Count",
      Value2 = 2,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemoveStacks,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "AhriTumble",
          NumStacks = 1
        }
      },
      {
        Function = BBSetSlotSpellCooldownTimeVer2,
        Params = {
          Src = 0.75,
          SlotNumber = 3,
          SlotType = SpellSlots,
          SpellbookType = SPELLBOOK_CHAMPION,
          OwnerVar = "Owner",
          BroadcastEvent = true
        }
      }
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Ahri_SpiritRush_cas.troy",
      Flags = 0,
      EffectIDVar = "SmokeBomb",
      BoneName = "BUFFBONE_GLB_GROUND_LOC",
      TargetObjectVar = "Owner",
      TargetBoneName = "BUFFBONE_GLB_GROUND_LOC",
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
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Ahri_Orb_cas.troy",
      Flags = 0,
      EffectIDVar = "SmokeBomb",
      BoneName = "BUFFBONE_GLB_WEAPON_1",
      TargetObjectVar = "Owner",
      TargetBoneName = "BUFFBONE_GLB_WEAPON_1",
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
    Params = {UnitVar = "Owner", PositionVar = "OwnerPos"}
  },
  {
    Function = BBGetCastSpellTargetPos,
    Params = {DestVar = "TargetPos"}
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
      DestVar = "dashSpeed",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBDistanceBetweenObjectAndPoint,
    Params = {
      DestVar = "Distance",
      ObjectVar = "Owner",
      PointVar = "TargetPos"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Distance",
      Value2 = 500,
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBFaceDirection,
        Params = {TargetVar = "Owner", LocationVar = "TargetPos"}
      },
      {
        Function = BBGetPointByUnitFacingOffset,
        Params = {
          UnitVar = "Owner",
          Distance = 500,
          OffsetAngle = 0,
          PositionVar = "TargetPos"
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "Distance", SrcValue = 500}
      },
      {
        Function = BBGetNearestPassablePosition,
        Params = {
          Owner = "Owner",
          PositionVar = "TargetPos",
          NewPositionVar = "NearestAvailablePos"
        }
      },
      {
        Function = BBDistanceBetweenPoints,
        Params = {
          DestVar = "Distance2",
          Point1Var = "NearestAvailablePos",
          Point2Var = "TargetPos"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Distance2",
          Value2 = 25,
          CompareOp = CO_GREATER_THAN
        },
        SubBlocks = {
          {
            Function = BBGetPointByUnitFacingOffset,
            Params = {
              UnitVar = "Owner",
              Distance = 600,
              OffsetAngle = 0,
              PositionVar = "TargetPos"
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {DestVar = "Distance", SrcValue = 600}
          }
        }
      }
    }
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
      DestVar = "Distance",
      DestVarTable = "NextBuffVars",
      SrcVar = "Distance"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "dashSpeed",
      DestVarTable = "NextBuffVars",
      SrcVar = "dashSpeed"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "AhriTumbleKick",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 2,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0.25,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "ahritumble"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "ahri_spiritrush_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "ahri_orb_cas.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "ahritumblekick"
    }
  }
}
