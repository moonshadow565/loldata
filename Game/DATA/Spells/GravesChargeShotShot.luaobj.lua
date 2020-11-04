NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
BuffTextureName = "FallenAngel_DarkBinding.dds"
BuffName = "RapidFire"
AutoBuffActivateEffect = ""
AutoBuffActivateEffect2 = ""
PopupMessage1 = "game_floatingtext_Snared"
SpellOnMissileEndBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {
      TargetVar = "Attacker",
      DestVar = "TeamIDAttacker"
    }
  },
  {
    Function = BBGetTeamID,
    Params = {
      TargetVar = "Target",
      DestVar = "TeamIDTarget"
    }
  },
  {
    Function = BBSpawnMinion,
    Params = {
      Name = "SpellBook1",
      Skin = "SpellBook1",
      AiScript = "idle.lua",
      PosVar = "BriggsCastPos",
      PosVarTable = "CharVars",
      Team = TEAM_CASTER,
      TeamVar = "TeamIDAttacker",
      Stunned = false,
      Rooted = true,
      Silenced = false,
      Invulnerable = true,
      MagicImmune = true,
      IgnoreCollision = true,
      IsWard = false,
      Placemarker = false,
      VisibilitySize = 0,
      DestVar = "Other1",
      GoldRedirectTargetVar = "Owner"
    }
  },
  {
    Function = BBFaceDirection,
    Params = {
      TargetVar = "Other1",
      LocationVar = "MissileEndPosition"
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
    Function = BBDistanceBetweenObjectAndPoint,
    Params = {
      DestVar = "Distance",
      ObjectVar = "Other1",
      PointVar = "MissileEndPosition"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Distance",
      Src1Value = 0,
      Src2Value = 150,
      DestVar = "Distance",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Other1",
      Distance = 0,
      DistanceVar = "Distance",
      OffsetAngle = 0,
      PositionVar = "SpawnPos"
    }
  },
  {
    Function = BBSpawnMinion,
    Params = {
      Name = "SpellBook1",
      Skin = "SpellBook1",
      AiScript = "idle.lua",
      PosVar = "SpawnPos",
      Team = TEAM_CASTER,
      TeamVar = "TeamIDAttacker",
      Stunned = false,
      Rooted = true,
      Silenced = false,
      Invulnerable = true,
      MagicImmune = true,
      IgnoreCollision = true,
      IsWard = false,
      Placemarker = true,
      VisibilitySize = 0,
      DestVar = "Other3",
      GoldRedirectTargetVar = "Owner"
    }
  },
  {
    Function = BBFaceDirection,
    Params = {
      TargetVar = "Other3",
      LocationVar = "MissileEndPosition"
    }
  },
  {
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Other3",
      Distance = 400,
      OffsetAngle = 30,
      PositionVar = "Point1"
    }
  },
  {
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Other3",
      Distance = 400,
      OffsetAngle = -30,
      PositionVar = "Point2"
    }
  },
  {
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Other3",
      Distance = 400,
      OffsetAngle = 0,
      PositionVar = "Point3"
    }
  },
  {
    Function = BBSpawnMinion,
    Params = {
      Name = "ParticleTarget",
      Skin = "SpellBook1",
      AiScript = "idle.lua",
      PosVar = "Point3",
      Team = TEAM_CASTER,
      TeamVar = "TeamIDAttacker",
      Stunned = false,
      Rooted = true,
      Silenced = false,
      Invulnerable = true,
      MagicImmune = true,
      IgnoreCollision = true,
      IsWard = false,
      Placemarker = true,
      VisibilitySize = 0,
      DestVar = "Other2",
      GoldRedirectTargetVar = "Owner"
    }
  },
  {
    Function = BBFaceDirection,
    Params = {TargetVar = "Other2", LocationVar = "Other1"}
  },
  {
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Other3",
      Distance = 700,
      OffsetAngle = 0,
      PositionVar = "ShockwaveTarget"
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
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBSpellCast,
    Params = {
      CasterVar = "Attacker",
      TargetVar = "Nothing",
      PosVar = "Point1",
      EndPosVar = "Point1",
      OverrideCastPosition = true,
      OverrideCastPosVar = "SpawnPos",
      SlotNumber = 5,
      SlotType = ExtraSlots,
      OverrideForceLevel = 1,
      OverrideCoolDownCheck = true,
      FireWithoutCasting = true,
      UseAutoAttackSpell = false,
      ForceCastingOrChannelling = false,
      UpdateAutoAttackTimer = false
    }
  },
  {
    Function = BBSpellCast,
    Params = {
      CasterVar = "Attacker",
      TargetVar = "Nothing",
      PosVar = "Point2",
      EndPosVar = "Point2",
      OverrideCastPosition = true,
      OverrideCastPosVar = "SpawnPos",
      SlotNumber = 5,
      SlotType = ExtraSlots,
      OverrideForceLevel = 1,
      OverrideCoolDownCheck = true,
      FireWithoutCasting = true,
      UseAutoAttackSpell = false,
      ForceCastingOrChannelling = false,
      UpdateAutoAttackTimer = false
    }
  },
  {
    Function = BBSpellCast,
    Params = {
      CasterVar = "Attacker",
      TargetVar = "Nothing",
      PosVar = "Point3",
      EndPosVar = "Point3",
      OverrideCastPosition = true,
      OverrideCastPosVar = "SpawnPos",
      SlotNumber = 6,
      SlotType = ExtraSlots,
      OverrideForceLevel = 1,
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
      TargetVar = "Other3",
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
    Function = BBSpellCast,
    Params = {
      CasterVar = "Attacker",
      TargetVar = "Target",
      PosVar = "MissileEndPosition",
      EndPosVar = "MissileEndPosition",
      OverrideCastPosition = true,
      OverrideCastPosVar = "Other3",
      SlotNumber = 2,
      SlotType = ExtraSlots,
      OverrideForceLevel = 0,
      OverrideForceLevelVar = "1",
      OverrideCoolDownCheck = false,
      FireWithoutCasting = true,
      UseAutoAttackSpell = false,
      ForceCastingOrChannelling = true,
      UpdateAutoAttackTimer = false
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 3,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "SpellBaseDamage",
      SrcValueByLevel = {
        250,
        350,
        450
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffName = "GravesChargeShotShot",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 0.5,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_HERO},
    SubBlocks = {
      {
        Function = BBDestroyMissile,
        Params = {
          MissileIDVar = "MissileNetworkID"
        }
      },
      {
        Function = BBBreakSpellShields,
        Params = {TargetVar = "Target"}
      }
    }
  },
  {
    Function = BBGetTotalAttackDamage,
    Params = {TargetVar = "Owner", DestVar = "TotalAD"}
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetBaseAttackDamage,
      TargetVar = "Owner",
      DestVar = "BaseAD"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "TotalAD",
      Src2Var = "BaseAD",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "BonusAD",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BonusAD",
      Src1Value = 0,
      Src2Value = 1.4,
      DestVar = "BonusAD",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BonusAD",
      Src2Var = "SpellBaseDamage",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "SpellBaseDamage",
      MathOp = MO_ADD
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
      DamageType = PHYSICAL_DAMAGE,
      SourceDamageType = DAMAGESOURCE_SPELL,
      PercentOfAttack = 1,
      SpellDamageRatio = 0,
      PhysicalDamageRatio = 0,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {Name = "spellbook1"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "expirationtimer"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "graveschargeshotshot"
    }
  }
}
