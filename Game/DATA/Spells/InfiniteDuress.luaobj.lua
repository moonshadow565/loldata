NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Wolfman_InfiniteDuress.dds"
BuffName = "Infinite Duress"
TargetExecuteBuildingBlocks = {
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffName = "DuressCheck",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 0.01,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Target",
      AttackerVar = "Attacker",
      BuffName = "DuressCheck"
    },
    SubBlocks = {
      {
        Function = BBGetRandomPointInAreaUnit,
        Params = {
          TargetVar = "Target",
          Radius = 150,
          InnerRadius = 150,
          ResultVar = "Pos"
        }
      },
      {
        Function = BBTeleportToPosition,
        Params = {OwnerVar = "Owner", CastPositionName = "Pos"}
      },
      {
        Function = BBFaceDirection,
        Params = {TargetVar = "Owner", LocationVar = "Target"}
      },
      {
        Function = BBSpellCast,
        Params = {
          CasterVar = "Attacker",
          TargetVar = "Target",
          PosVar = "Target",
          EndPosVar = "Target",
          SlotNumber = 0,
          SlotType = ExtraSlots,
          OverrideForceLevel = 0,
          OverrideForceLevelVar = "Level",
          OverrideCoolDownCheck = true,
          FireWithoutCasting = false,
          UseAutoAttackSpell = false,
          ForceCastingOrChannelling = true
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBGetRandomPointInAreaUnit,
        Params = {
          TargetVar = "Target",
          Radius = 150,
          InnerRadius = 150,
          ResultVar = "Pos"
        }
      },
      {
        Function = BBTeleportToPosition,
        Params = {OwnerVar = "Owner", CastPositionName = "Pos"}
      },
      {
        Function = BBFaceDirection,
        Params = {TargetVar = "Owner", LocationVar = "Target"}
      },
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
