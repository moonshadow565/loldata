NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Ahri_FoxFire.dds"
BuffName = "AhriFoxFire"
SpellDamageRatio = 1
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetSlotSpellCooldownTimeVer2,
    Params = {
      Src = 0,
      SlotNumber = 1,
      SlotType = SpellSlots,
      SpellbookType = SPELLBOOK_CHAMPION,
      OwnerVar = "Owner",
      BroadcastEvent = false
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 1,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = true
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 1,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Cooldown",
      SrcValueByLevel = {
        9,
        8,
        7,
        6,
        5
      }
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetPercentCooldownMod,
      TargetVar = "Owner",
      DestVar = "CooldownMod"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "CooldownMod",
      Src1Value = 1,
      Src2Value = 0,
      DestVar = "CooldownMod",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Cooldown",
      Src2Var = "CooldownMod",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "FinalCooldown",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetSlotSpellCooldownTimeVer2,
    Params = {
      Src = 0,
      SrcVar = "FinalCooldown",
      SlotNumber = 1,
      SlotType = SpellSlots,
      SpellbookType = SPELLBOOK_CHAMPION,
      OwnerVar = "Owner",
      BroadcastEvent = false
    }
  },
  {
    Function = BBGetBuffRemainingDuration,
    Params = {
      DestVar = "Duration",
      TargetVar = "Owner",
      BuffName = "AhriFoxFire"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Duration",
      Value2 = -0.001,
      CompareOp = CO_LESS_THAN
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "Ahri_foxfire_obd-sound.troy",
          Flags = 0,
          EffectIDVar = "Particle1",
          EffectIDVarTable = "InstanceVars",
          BoneName = "BUFFBONE_GLB_WEAPON_1",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = false,
          PersistsThroughReconnect = false,
          BindFlexToOwnerPAR = false,
          FollowsGroundTilt = false,
          FacesTarget = false
        }
      }
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 1,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = false
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "UnlockAnimation",
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
    Function = BBPlayAnimation,
    Params = {
      AnimationName = "Spell2",
      ScaleTime = 0.71,
      TargetVar = "Owner",
      Loop = false,
      Blend = true,
      Lock = true
    }
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Target",
      EffectName = "Ahri_FoxFire_cas.troy",
      Flags = 0,
      EffectIDVar = "VarA",
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
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Target",
      EffectName = "Ahri_FoxFire_weapon_cas.troy",
      Flags = 0,
      EffectIDVar = "VarA",
      BoneName = "BUFFBONE_GLB_WEAPON_1",
      TargetObjectVar = "Target",
      TargetBoneName = "BUFFBONE_GLB_WEAPON_1",
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
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Owner",
      Distance = 150,
      OffsetAngle = 45,
      PositionVar = "Point1"
    }
  },
  {
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Owner",
      Distance = 150,
      OffsetAngle = 165,
      PositionVar = "Point2"
    }
  },
  {
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Owner",
      Distance = 150,
      OffsetAngle = 285,
      PositionVar = "Point3"
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 1,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Attacker",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSpellCast,
    Params = {
      CasterVar = "Attacker",
      TargetVar = "Attacker",
      OverrideCastPosition = true,
      OverrideCastPosVar = "Point1",
      SlotNumber = 2,
      SlotType = ExtraSlots,
      OverrideForceLevel = 0,
      OverrideForceLevelVar = "Level",
      OverrideCoolDownCheck = true,
      FireWithoutCasting = true,
      UseAutoAttackSpell = false,
      ForceCastingOrChannelling = true,
      UpdateAutoAttackTimer = false
    }
  },
  {
    Function = BBSpellCast,
    Params = {
      CasterVar = "Attacker",
      TargetVar = "Attacker",
      OverrideCastPosition = true,
      OverrideCastPosVar = "Point2",
      SlotNumber = 2,
      SlotType = ExtraSlots,
      OverrideForceLevel = 0,
      OverrideForceLevelVar = "Level",
      OverrideCoolDownCheck = true,
      FireWithoutCasting = true,
      UseAutoAttackSpell = false,
      ForceCastingOrChannelling = true,
      UpdateAutoAttackTimer = false
    }
  },
  {
    Function = BBSpellCast,
    Params = {
      CasterVar = "Attacker",
      TargetVar = "Attacker",
      OverrideCastPosition = true,
      OverrideCastPosVar = "Point3",
      SlotNumber = 2,
      SlotType = ExtraSlots,
      OverrideForceLevel = 0,
      OverrideForceLevelVar = "Level",
      OverrideCoolDownCheck = true,
      FireWithoutCasting = true,
      UseAutoAttackSpell = false,
      ForceCastingOrChannelling = true,
      UpdateAutoAttackTimer = false
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffName = "AhriFoxFire",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
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
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffName = "AhriFoxFireMissile",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 3,
      NumberOfStacks = 3,
      Duration = 5,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "AhriFoxFireMissileTwo"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffClear,
        Params = {
          TargetVar = "Owner",
          BuffName = "AhriFoxFireMissileTwo"
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "ahri_foxfire_obd-sound.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "unlockanimation"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "ahri_foxfire_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "ahri_foxfire_weapon_cas.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "ahrifoxfire"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "ahrifoxfiremissile"
    }
  }
}
