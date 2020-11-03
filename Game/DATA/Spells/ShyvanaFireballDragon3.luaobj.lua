NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Target",
      EffectName = "Incinerate_buf.troy",
      Flags = 0,
      EffectIDVar = "a",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "TeamID",
      FOWVisibilityRadius = 10,
      SendIfOnScreenOrDiscard = true,
      PersistsThroughReconnect = false,
      BindFlexToOwnerPAR = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "SpellBaseDamage",
      SrcValueByLevel = {
        70,
        110,
        150,
        190,
        230
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffName = "ShyvanaFireballParticle",
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
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      CallForHelpAttackerVar = "Attacker",
      TargetVar = "Target",
      Damage = 0,
      DamageVar = "SpellBaseDamage",
      DamageType = MAGIC_DAMAGE,
      SourceDamageType = DAMAGESOURCE_SPELL,
      PercentOfAttack = 1,
      SpellDamageRatio = 0.5,
      PhysicalDamageRatio = 0,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffName = "ShyvanaFireballMissile",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatDehancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 4,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "teamID"}
  },
  {
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Owner",
      Distance = 25,
      OffsetAngle = 0,
      PositionVar = "PointToSpawn"
    }
  },
  {
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Owner",
      Distance = -100,
      OffsetAngle = 0,
      PositionVar = "PointToFace"
    }
  },
  {
    Function = BBSpawnMinion,
    Params = {
      Name = "ConeBreathMarker",
      Skin = "TestCubeRender10Vision",
      AiScript = "idle.lua",
      PosVar = "PointToSpawn",
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
    Function = BBFaceDirection,
    Params = {
      TargetVar = "Other1",
      LocationVar = "PointToFace"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Other1",
      AttackerVar = "Attacker",
      BuffName = "ShyvanaFireballDragonMinion",
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
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "incinerate_buf.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "shyvanafireballparticle"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "shyvanafireballmissile"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "testcuberender10vision"
    }
  }
}
