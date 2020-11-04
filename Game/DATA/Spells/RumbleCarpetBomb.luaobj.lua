NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = ""
BuffName = "GalioRighteousGust"
AutoBuffActivateEffect = ""
AutoBuffActivateEffect2 = ""
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellBuffClear,
    Params = {
      TargetVar = "Owner",
      BuffName = "RumbleCarpetBombEffect"
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {
      TargetVar = "Attacker",
      DestVar = "TeamOfOwner"
    }
  },
  {
    Function = BBGetCastSpellTargetPos,
    Params = {
      DestVar = "TargetPosStart"
    }
  },
  {
    Function = BBGetCastSpellDragEndPos,
    Params = {
      DestVar = "TargetPosEnd"
    }
  },
  {
    Function = BBSpawnMinion,
    Params = {
      Name = "HiddenMinion",
      Skin = "TestCube",
      AiScript = "idle.lua",
      PosVar = "TargetPosStart",
      Team = TEAM_CASTER,
      TeamVar = "TeamOfOwner",
      Stunned = false,
      Rooted = true,
      Silenced = false,
      Invulnerable = true,
      MagicImmune = true,
      IgnoreCollision = true,
      Placemarker = true,
      VisibilitySize = 0,
      DestVar = "Other1",
      GoldRedirectTargetVar = "Owner"
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
      Duration = 1,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBFaceDirection,
    Params = {
      TargetVar = "Other1",
      LocationVar = "TargetPosEnd"
    }
  },
  {
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Other1",
      Distance = 1200,
      OffsetAngle = 0,
      PositionVar = "TargetPosEnd"
    }
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBSpellCast,
    Params = {
      CasterVar = "Owner",
      TargetVar = "Nothing",
      PosVar = "TargetPosEnd",
      EndPosVar = "TargetPosEnd",
      OverrideCastPosition = true,
      OverrideCastPosVar = "TargetPosStart",
      SlotNumber = 1,
      SlotType = ExtraSlots,
      OverrideForceLevel = 0,
      OverrideForceLevelVar = "Level",
      OverrideCoolDownCheck = true,
      FireWithoutCasting = true,
      UseAutoAttackSpell = false,
      ForceCastingOrChannelling = false,
      UpdateAutoAttackTimer = false
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "RumbleHeatDelay",
      BuffAddType = BUFF_RENEW_EXISTING,
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
    Function = BBIncPAR,
    Params = {
      TargetVar = "Owner",
      Delta = 0,
      PARType = PAR_OTHER
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "RumbleCarpetBomb",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 0.25,
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
      TargetVar = "Owner",
      PosVar = "Owner",
      OverrideCastPosition = true,
      OverrideCastPosVar = "TargetPosStart",
      SlotNumber = 2,
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
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rumblecarpetbombeffect"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {Name = "testcube"}
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
      Name = "rumbleheatdelay"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rumblecarpetbomb"
    }
  }
}
