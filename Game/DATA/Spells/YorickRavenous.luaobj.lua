DoesntBreakShields = true
TargetExecuteBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Nothing",
      BuffName = "YorickSummonRavenous"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffClear,
        Params = {
          TargetVar = "Owner",
          BuffName = "YorickSummonRavenous"
        }
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Owner",
      BuffName = "YorickRavenousPrimaryTarget",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 5,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBBreakSpellShields,
    Params = {TargetVar = "Target"}
  },
  {
    Function = BBDistanceBetweenObjects,
    Params = {
      DestVar = "Distance",
      ObjectVar1 = "Owner",
      ObjectVar2 = "Target"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Distance",
      Src1Value = 0,
      Src2Value = 250,
      DestVar = "Distance",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Owner",
      Distance = 0,
      DistanceVar = "Distance",
      OffsetAngle = 0,
      PositionVar = "TargetPos"
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
      ForceCastingOrChannelling = true,
      UpdateAutoAttackTimer = false
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DrainPercent",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        0.5,
        0.5,
        0.5,
        0.5,
        0.5
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DrainedBool",
      DestVarTable = "NextBuffVars",
      SrcValue = false
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "GlobalDrain",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 0.01,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BaseDamage",
      SrcValueByLevel = {
        55,
        85,
        115,
        145,
        175
      }
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatPhysicalDamageMod,
      TargetVar = "Owner",
      DestVar = "BonusAD"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BaseDamage",
      Src2Var = "BonusAD",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "DamageToDeal",
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
      DamageVar = "DamageToDeal",
      DamageType = MAGIC_DAMAGE,
      SourceDamageType = DAMAGESOURCE_SPELL,
      PercentOfAttack = 1,
      SpellDamageRatio = 0,
      PhysicalDamageRatio = 0,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "yorick_ravenousGhoul_activeHeal.troy",
      Flags = 0,
      EffectIDVar = "LifestealEffect",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "TeamID",
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = true,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Target",
      EffectName = "yorick_ravenousGhoul_cas_tar.troy",
      Flags = 0,
      EffectIDVar = "HitEffect",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "TeamID",
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = true,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "yoricksummonravenous"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "yorickravenousprimarytarget"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "globaldrain"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "yorick_ravenousghoul_activeheal.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "yorick_ravenousghoul_cas_tar.troy"
    }
  }
}
