NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
AutoCooldownByLevel = {
  20,
  16,
  12,
  8,
  4
}
TriggersSpellCasts = true
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 0.5,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = true
    },
    SubBlocks = {
      {
        Function = BBGetPointByUnitFacingOffset,
        Params = {
          UnitVar = "Owner",
          Distance = 300,
          OffsetAngle = -15,
          PositionVar = "Pos"
        }
      },
      {
        Function = BBSpellCast,
        Params = {
          CasterVar = "Owner",
          TargetVar = "Nothing",
          PosVar = "Pos",
          EndPosVar = "Pos",
          SlotNumber = 0,
          SlotType = ExtraSlots,
          OverrideForceLevel = 1,
          OverrideCoolDownCheck = true,
          FireWithoutCasting = true,
          UseAutoAttackSpell = false
        }
      },
      {
        Function = BBGetPointByUnitFacingOffset,
        Params = {
          UnitVar = "Owner",
          Distance = 300,
          OffsetAngle = 0,
          PositionVar = "Pos"
        }
      },
      {
        Function = BBSpellCast,
        Params = {
          CasterVar = "Owner",
          TargetVar = "Nothing",
          PosVar = "Pos",
          EndPosVar = "Pos",
          SlotNumber = 0,
          SlotType = ExtraSlots,
          OverrideForceLevel = 1,
          OverrideCoolDownCheck = true,
          FireWithoutCasting = true,
          UseAutoAttackSpell = false
        }
      },
      {
        Function = BBGetPointByUnitFacingOffset,
        Params = {
          UnitVar = "Owner",
          Distance = 300,
          OffsetAngle = 5,
          PositionVar = "Pos"
        }
      },
      {
        Function = BBSpellCast,
        Params = {
          CasterVar = "Owner",
          TargetVar = "Nothing",
          PosVar = "Pos",
          EndPosVar = "Pos",
          SlotNumber = 0,
          SlotType = ExtraSlots,
          OverrideForceLevel = 1,
          OverrideCoolDownCheck = true,
          FireWithoutCasting = true,
          UseAutoAttackSpell = false
        }
      },
      {
        Function = BBGetPointByUnitFacingOffset,
        Params = {
          UnitVar = "Owner",
          Distance = 300,
          OffsetAngle = -5,
          PositionVar = "Pos"
        }
      },
      {
        Function = BBSpellCast,
        Params = {
          CasterVar = "Owner",
          TargetVar = "Nothing",
          PosVar = "Pos",
          EndPosVar = "Pos",
          SlotNumber = 0,
          SlotType = ExtraSlots,
          OverrideForceLevel = 1,
          OverrideCoolDownCheck = true,
          FireWithoutCasting = true,
          UseAutoAttackSpell = false
        }
      },
      {
        Function = BBGetPointByUnitFacingOffset,
        Params = {
          UnitVar = "Owner",
          Distance = 300,
          OffsetAngle = 10,
          PositionVar = "Pos"
        }
      },
      {
        Function = BBSpellCast,
        Params = {
          CasterVar = "Owner",
          TargetVar = "Nothing",
          PosVar = "Pos",
          EndPosVar = "Pos",
          SlotNumber = 0,
          SlotType = ExtraSlots,
          OverrideForceLevel = 1,
          OverrideCoolDownCheck = true,
          FireWithoutCasting = true,
          UseAutoAttackSpell = false
        }
      },
      {
        Function = BBGetPointByUnitFacingOffset,
        Params = {
          UnitVar = "Owner",
          Distance = 300,
          OffsetAngle = -10,
          PositionVar = "Pos"
        }
      },
      {
        Function = BBSpellCast,
        Params = {
          CasterVar = "Owner",
          TargetVar = "Nothing",
          PosVar = "Pos",
          EndPosVar = "Pos",
          SlotNumber = 0,
          SlotType = ExtraSlots,
          OverrideForceLevel = 1,
          OverrideCoolDownCheck = true,
          FireWithoutCasting = true,
          UseAutoAttackSpell = false
        }
      },
      {
        Function = BBGetPointByUnitFacingOffset,
        Params = {
          UnitVar = "Owner",
          Distance = 300,
          OffsetAngle = 15,
          PositionVar = "Pos"
        }
      },
      {
        Function = BBSpellCast,
        Params = {
          CasterVar = "Owner",
          TargetVar = "Nothing",
          PosVar = "Pos",
          EndPosVar = "Pos",
          SlotNumber = 0,
          SlotType = ExtraSlots,
          OverrideForceLevel = 1,
          OverrideCoolDownCheck = true,
          FireWithoutCasting = true,
          UseAutoAttackSpell = false
        }
      }
    }
  }
}
TargetExecuteBuildingBlocks = {
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
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 0,
      BuffVarsTable = "NextBuffVars",
      DurationByLevel = {
        4,
        4.5,
        5,
        5.5,
        6
      },
      TickRate = 0
    }
  }
}
