NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "AkaliCrescentSlash.dds"
BuffName = "RenekthonCleaveReady"
SpellToggleSlot = 1
SpellDamageRatio = 0.5
OnBuffActivateBuildingBlocks = {}
OnBuffDeactivateBuildingBlocks = {}
SelfExecuteBuildingBlocks = {
  {
    Function = BBGetCastSpellTargetPos,
    Params = {DestVar = "CastPos"}
  },
  {
    Function = BBFaceDirection,
    Params = {TargetVar = "Owner", LocationVar = "CastPos"}
  },
  {
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Owner",
      Distance = 225,
      OffsetAngle = 0,
      PositionVar = "CenterPos"
    }
  },
  {
    Function = BBPlayAnimation,
    Params = {
      AnimationName = "Attack1",
      ScaleTime = 0.5,
      TargetVar = "Owner",
      Loop = false,
      Blend = true,
      Lock = true
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
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
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
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
    Function = BBForEachUnitInTargetRectangle,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "CenterPos",
      HalfWidth = 80,
      HalfLength = 325,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          CallForHelpAttackerVar = "Attacker",
          TargetVar = "Unit",
          DamageByLevel = {
            75,
            125,
            175,
            225,
            275
          },
          Damage = 0,
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELLAOE,
          PercentOfAttack = 1,
          SpellDamageRatio = 0.66,
          PhysicalDamageRatio = 0,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Unit",
          AttackerVar = "Owner",
          BuffName = "RenektonBloodSplatterTarget",
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
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "FizzUnlockAnimation",
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
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Owner",
      Distance = 250,
      OffsetAngle = 0,
      PositionVar = "Skip"
    }
  },
  {
    Function = BBMove,
    Params = {
      UnitVar = "Owner",
      TargetVar = "Skip",
      Speed = 600,
      Gravity = 18,
      MoveBackBy = 25,
      MovementType = FURTHEST_WITHIN_RANGE,
      MovementOrdersType = CANCEL_ORDER,
      MovementOrdersFacing = FACE_MOVEMENT_DIRECTION,
      IdealDistance = 300
    }
  },
  {
    Function = BBCancelAutoAttack,
    Params = {TargetVar = "Owner", Reset = true}
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Owner",
      Distance = -75,
      OffsetAngle = 0,
      PositionVar = "StartPos"
    }
  },
  {
    Function = BBSpawnMinion,
    Params = {
      Name = "TestCube",
      Skin = "TestCube",
      AiScript = "idle.lua",
      PosVar = "StartPos",
      Team = TEAM_UNKNOWN,
      TeamVar = "TeamID",
      Stunned = false,
      Rooted = true,
      Silenced = true,
      Invulnerable = true,
      MagicImmune = true,
      IgnoreCollision = true,
      IsWard = true,
      Placemarker = false,
      VisibilitySize = 10,
      DestVar = "Other1",
      GoldRedirectTargetVar = "Nothing"
    }
  },
  {
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Owner",
      Distance = 550,
      OffsetAngle = 0,
      PositionVar = "EndPos"
    }
  },
  {
    Function = BBSpawnMinion,
    Params = {
      Name = "TestCube",
      Skin = "TestCube",
      AiScript = "idle.lua",
      PosVar = "EndPos",
      Team = TEAM_UNKNOWN,
      TeamVar = "TeamID",
      Stunned = false,
      Rooted = true,
      Silenced = true,
      Invulnerable = true,
      MagicImmune = true,
      IgnoreCollision = true,
      IsWard = true,
      Placemarker = false,
      VisibilitySize = 10,
      DestVar = "Other2",
      GoldRedirectTargetVar = "Nothing"
    }
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
      Duration = 0.1,
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
      Duration = 0.1,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Other1",
      EffectName = "kennen_btl_beam.troy",
      Flags = 0,
      EffectIDVar = "ParticleID",
      EffectIDVarTable = "InstanceVars",
      BoneName = "head",
      TargetObjectVar = "Other2",
      TargetBoneName = "head",
      SpecificUnitOnlyVar = "Unit",
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
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "renektonbloodsplattertarget"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "fizzunlockanimation"
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
    Function = BBPreloadParticle,
    Params = {
      Name = "kennen_btl_beam.troy"
    }
  }
}
