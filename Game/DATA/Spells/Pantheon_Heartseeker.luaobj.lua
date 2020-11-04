DoesntTriggerSpellCasts = false
ChannelDuration = 1.3
BuffName = "Heartseeker"
ChannelingStartBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "CastPosition",
      DestVarTable = "InstanceVars",
      SrcVar = "CastPosition"
    }
  },
  {
    Function = BBFaceDirection,
    Params = {
      TargetVar = "Owner",
      LocationVar = "CastPosition"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "LastTimeExecuted",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "Pantheon_HeartseekerSound",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 1.3,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  }
}
ChannelingUpdateActionsBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "CastPosition",
      SrcVar = "CastPosition",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellCast,
    Params = {
      CasterVar = "Owner",
      TargetVar = "Nothing",
      PosVar = "CastPosition",
      EndPosVar = "CastPosition",
      OverrideCastPosition = false,
      SlotNumber = 0,
      SlotType = ExtraSlots,
      OverrideForceLevel = 0,
      OverrideForceLevelVar = "Level",
      OverrideCoolDownCheck = true,
      FireWithoutCasting = true,
      UseAutoAttackSpell = false,
      ForceCastingOrChannelling = false
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "counter",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 1,
      DestVar = "counter",
      DestVarTable = "InstanceVars",
      MathOp = MO_ADD
    }
  }
}
ChannelingCancelStopBuildingBlocks = {
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "Pantheon_HeartseekerSound"
    }
  }
}
ChannelingSuccessStopBuildingBlocks = {
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "Pantheon_HeartseekerSound"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "pantheon_heartseekersound"
    }
  }
}
