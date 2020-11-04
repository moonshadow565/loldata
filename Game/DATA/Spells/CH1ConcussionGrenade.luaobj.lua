NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = ""
BuffName = ""
SelfExecuteBuildingBlocks = {
  {
    Function = BBGetCastInfo,
    Params = {DestVar = "Level", Info = GetCastSpellLevelPlusOne}
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBGetCastSpellTargetPos,
    Params = {DestVar = "TargetPos"}
  },
  {
    Function = BBSpawnMinion,
    Params = {
      Name = "k",
      Skin = "TestCubeRender",
      AiScript = "idle.lua",
      PosVar = "TargetPos",
      Team = TEAM_NEUTRAL,
      TeamVar = "TeamID",
      Stunned = true,
      Rooted = true,
      Silenced = false,
      Invulnerable = false,
      MagicImmune = true,
      IgnoreCollision = true,
      Placemarker = true,
      VisibilitySize = 0,
      DestVar = "Other2",
      GoldRedirectTargetVar = "Attacker"
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Other2",
      SrcValue = true,
      Status = SetNoRender
    }
  },
  {
    Function = BBSpellCast,
    Params = {
      CasterVar = "Owner",
      TargetVar = "Other2",
      PosVar = "TargetPos",
      EndPosVar = "TargetPos",
      OverrideCastPosition = false,
      SlotNumber = 0,
      SlotType = ExtraSlots,
      OverrideForceLevel = 0,
      OverrideForceLevelVar = "Level",
      OverrideCoolDownCheck = false,
      FireWithoutCasting = true,
      UseAutoAttackSpell = false,
      ForceCastingOrChannelling = false
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Other2",
      AttackerVar = "Attacker",
      BuffName = "ExpirationTimer",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 1,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "testcuberender"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "expirationtimer"
    }
  }
}
