NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Wolfman_InfiniteDuress.dds"
BuffName = "InfiniteDuress"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "LifestealBonus",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentLifeStealMod,
      TargetVar = "Owner",
      DeltaVar = "LifestealBonus",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffName = "Suppression",
      BuffAddType = BUFF_STACKS_AND_OVERLAPS,
      StacksExclusive = true,
      BuffType = BUFF_Suppression,
      MaxStack = 100,
      NumberOfStacks = 1,
      Duration = 1.9,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "LifestealBonus",
      DestVarTable = "NextBuffVars",
      SrcValue = 0.3
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
      Duration = 3,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  },
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
    Params = {TargetVar = "Attacker", LocationVar = "Target"}
  },
  {
    Function = BBGetStatus,
    Params = {
      TargetVar = "Target",
      DestVar = "canMove",
      Status = GetCanMove
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "canMove",
      Value2 = false,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellCast,
        Params = {
          CasterVar = "Attacker",
          TargetVar = "Target",
          PosVar = "Target",
          EndPosVar = "Target",
          OverrideCastPosition = false,
          SlotNumber = 0,
          SlotType = ExtraSlots,
          OverrideForceLevel = 0,
          OverrideForceLevelVar = "Level",
          OverrideCoolDownCheck = true,
          FireWithoutCasting = false,
          UseAutoAttackSpell = false,
          ForceCastingOrChannelling = true,
          UpdateAutoAttackTimer = false
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
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
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "suppression"
    }
  }
}
