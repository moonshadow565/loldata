NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetUnitPosition,
    Params = {UnitVar = "Owner", PositionVar = "OwnerPos"}
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "teamID"}
  },
  {
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Owner",
      Distance = 500,
      OffsetAngle = 0,
      PositionVar = "Beam1"
    }
  },
  {
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Owner",
      Distance = 800,
      OffsetAngle = 0,
      PositionVar = "Beam2"
    }
  },
  {
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Owner",
      Distance = 1100,
      OffsetAngle = 0,
      PositionVar = "Beam3"
    }
  },
  {
    Function = BBSpawnMinion,
    Params = {
      Name = "hiu",
      Skin = "TestCube",
      AiScript = "idle.lua",
      PosVar = "Beam1",
      Team = TEAM_CASTER,
      TeamVar = "teamID",
      Stunned = false,
      Rooted = true,
      Silenced = false,
      Invulnerable = false,
      MagicImmune = false,
      IgnoreCollision = true,
      IsWard = false,
      Placemarker = false,
      VisibilitySize = 300,
      DestVar = "Other1",
      GoldRedirectTargetVar = "Owner"
    }
  },
  {
    Function = BBSpawnMinion,
    Params = {
      Name = "hiu",
      Skin = "TestCube",
      AiScript = "idle.lua",
      PosVar = "Beam2",
      Team = TEAM_CASTER,
      TeamVar = "teamID",
      Stunned = false,
      Rooted = true,
      Silenced = false,
      Invulnerable = false,
      MagicImmune = false,
      IgnoreCollision = true,
      IsWard = false,
      Placemarker = false,
      VisibilitySize = 300,
      DestVar = "Other2",
      GoldRedirectTargetVar = "Owner"
    }
  },
  {
    Function = BBSpawnMinion,
    Params = {
      Name = "hiu",
      Skin = "TestCube",
      AiScript = "idle.lua",
      PosVar = "Beam3",
      Team = TEAM_CASTER,
      TeamVar = "teamID",
      Stunned = false,
      Rooted = true,
      Silenced = false,
      Invulnerable = false,
      MagicImmune = false,
      IgnoreCollision = true,
      IsWard = false,
      Placemarker = false,
      VisibilitySize = 300,
      DestVar = "Other3",
      GoldRedirectTargetVar = "Owner"
    }
  },
  {
    Function = BBLinkVisibility,
    Params = {Unit1Var = "Other1", Unit2Var = "Attacker"}
  },
  {
    Function = BBLinkVisibility,
    Params = {Unit1Var = "Other2", Unit2Var = "Attacker"}
  },
  {
    Function = BBLinkVisibility,
    Params = {Unit1Var = "Other3", Unit2Var = "Attacker"}
  },
  {
    Function = BBLinkVisibility,
    Params = {Unit1Var = "Owner", Unit2Var = "Attacker"}
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Other1",
      AttackerVar = "Other1",
      BuffName = "ExpirationTimer",
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
      TargetVar = "Other2",
      AttackerVar = "Other2",
      BuffName = "ExpirationTimer",
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
      TargetVar = "Other3",
      AttackerVar = "Other3",
      BuffName = "ExpirationTimer",
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
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {Name = "testcube"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "expirationtimer"
    }
  }
}
