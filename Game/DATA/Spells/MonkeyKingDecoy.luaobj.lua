NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
SpellDamageRatio = 0.5
SelfExecuteBuildingBlocks = {
  {
    Function = BBGetUnitPosition,
    Params = {UnitVar = "Owner", PositionVar = "OwnerPos"}
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Owner",
      Distance = 100,
      OffsetAngle = 0,
      PositionVar = "OwnerFacing"
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
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ManaCost",
      SrcValueByLevel = {
        50,
        55,
        60,
        65,
        70
      }
    }
  },
  {
    Function = BBMove,
    Params = {
      UnitVar = "Owner",
      TargetVar = "OwnerFacing",
      Speed = 3000,
      Gravity = 0,
      MoveBackBy = 0,
      MovementType = FIRST_WALL_HIT,
      MovementOrdersType = POSTPONE_CURRENT_ORDER,
      MovementOrdersFacing = FACE_MOVEMENT_DIRECTION,
      IdealDistance = 0
    }
  },
  {
    Function = BBCloneUnitPet,
    Params = {
      UnitToCloneVar = "Owner",
      Buff = "MonkeyKingDecoyDummy",
      Duration = 0,
      PosVar = "OwnerPos",
      HealthBonus = 0,
      DamageBonus = 0,
      ShowMinimapIcon = true,
      DestVar = "Other1"
    }
  },
  {
    Function = BBIssueOrder,
    Params = {
      WhomToOrderVar = "Other1",
      TargetOfOrderVar = "Other1",
      Order = AI_HOLD
    }
  },
  {
    Function = BBPlayAnimation,
    Params = {
      AnimationName = "idle1",
      ScaleTime = 0,
      TargetVar = "Other1",
      Loop = false,
      Blend = false,
      Lock = false
    }
  },
  {
    Function = BBIncPAR,
    Params = {
      TargetVar = "Other1",
      Delta = 0,
      PARType = PAR_MANA,
      DeltaVar = "ManaCost"
    }
  },
  {
    Function = BBFaceDirection,
    Params = {
      TargetVar = "Other1",
      LocationVar = "OwnerFacing"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Other1",
      AttackerVar = "Owner",
      BuffName = "MonkeyKingDecoyClone",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 1.5,
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
      BuffName = "MonkeyKingDecoyStealth",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 1.5,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "monkeykingdecoydummy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "monkeykingdecoyclone"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "monkeykingdecoystealth"
    }
  }
}
