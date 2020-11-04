NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
SelfExecuteBuildingBlocks = {
  {
    Function = BBGetCastSpellTargetPos,
    Params = {DestVar = "TargetPos"}
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "teamID"}
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
    Function = BBFaceDirection,
    Params = {TargetVar = "Owner", LocationVar = "TargetPos"}
  },
  {
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Owner",
      Distance = 145,
      OffsetAngle = 0,
      PositionVar = "Beam1"
    }
  },
  {
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Owner",
      Distance = 1600,
      OffsetAngle = 0,
      PositionVar = "Beam3"
    }
  },
  {
    Function = BBSpawnMinion,
    Params = {
      Name = "hiu",
      Skin = "TestCubeRender10Vision",
      AiScript = "idle.lua",
      PosVar = "Beam1",
      Team = TEAM_NEUTRAL,
      TeamVar = "teamID",
      Stunned = false,
      Rooted = true,
      Silenced = false,
      Invulnerable = false,
      MagicImmune = false,
      IgnoreCollision = true,
      IsWard = false,
      Placemarker = false,
      VisibilitySize = 1,
      DestVar = "Other1",
      GoldRedirectTargetVar = "Owner"
    }
  },
  {
    Function = BBSpawnMinion,
    Params = {
      Name = "hiu",
      Skin = "TestCubeRender10Vision",
      AiScript = "idle.lua",
      PosVar = "Beam3",
      Team = TEAM_NEUTRAL,
      TeamVar = "teamID",
      Stunned = false,
      Rooted = true,
      Silenced = false,
      Invulnerable = false,
      MagicImmune = false,
      IgnoreCollision = true,
      IsWard = false,
      Placemarker = false,
      VisibilitySize = 1,
      DestVar = "Other3",
      GoldRedirectTargetVar = "Owner"
    }
  },
  {
    Function = BBFaceDirection,
    Params = {TargetVar = "Other1", LocationVar = "Other3"}
  },
  {
    Function = BBLinkVisibility,
    Params = {Unit1Var = "Other1", Unit2Var = "Other3"}
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Other1",
      AttackerVar = "Attacker",
      BuffName = "XerathArcanopulseDeath",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
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
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Other3",
      AttackerVar = "Attacker",
      BuffName = "XerathArcanopulseDeath",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
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
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Other1",
      AttackerVar = "Attacker",
      BuffName = "ExpirationTimer",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
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
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Other3",
      AttackerVar = "Attacker",
      BuffName = "ExpirationTimer",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
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
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Other1",
      AttackerVar = "Other3",
      BuffName = "XerathArcanopulseWPartFix",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
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
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Other1",
      AttackerVar = "Other3",
      BuffName = "XerathArcanopulseWPartFix2",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
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
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Other3",
      AttackerVar = "Other1",
      BuffName = "XerathArcanopulseBeam",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 4,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Other1",
      AttackerVar = "Owner",
      BuffName = "XerathArcanopulseBall",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 4,
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
      SlotNumber = 1,
      SlotType = ExtraSlots,
      OverrideForceLevel = 0,
      OverrideForceLevelVar = "Level",
      OverrideCoolDownCheck = true,
      FireWithoutCasting = false,
      UseAutoAttackSpell = false,
      ForceCastingOrChannelling = false,
      UpdateAutoAttackTimer = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "testcuberender10vision"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "xeratharcanopulsedeath"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "expirationtimer"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "xeratharcanopulsewpartfix"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "xeratharcanopulsewpartfix2"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "xeratharcanopulsebeam"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "xeratharcanopulseball"
    }
  }
}
