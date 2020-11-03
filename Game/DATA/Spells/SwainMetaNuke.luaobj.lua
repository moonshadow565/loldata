NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
AutoCooldownByLevel = {
  0,
  0,
  0,
  0,
  0
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 3,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Attacker",
      Function = GetSlotSpellLevel
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
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      CallForHelpAttackerVar = "Attacker",
      TargetVar = "Target",
      DamageByLevel = {
        50,
        70,
        90
      },
      Damage = 0,
      DamageType = MAGIC_DAMAGE,
      SourceDamageType = DAMAGESOURCE_SPELLAOE,
      PercentOfAttack = 1,
      SpellDamageRatio = 0.2,
      PhysicalDamageRatio = 1,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Attacker",
      EffectName = "swain_heal.troy",
      Flags = 0,
      EffectIDVar = "ar",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  },
  {
    Function = BBGetCastSpellTargetPos,
    Params = {DestVar = "TargetPos"}
  },
  {
    Function = BBSpellCast,
    Params = {
      CasterVar = "Attacker",
      TargetVar = "Owner",
      PosVar = "Attacker",
      EndPosVar = "Owner",
      OverrideCastPosition = true,
      OverrideCastPosVar = "TargetPos",
      SlotNumber = 2,
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
    Function = BBGetStatus,
    Params = {
      TargetVar = "Attacker",
      DestVar = "IsTargetable",
      Status = GetTargetable
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "IsTargetable",
      Value2 = true,
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Attacker",
          EffectName = "swain_heal.troy",
          Flags = 0,
          EffectIDVar = "ar",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = false,
          FollowsGroundTilt = false,
          FacesTarget = false
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "globaldrain"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "swain_heal.troy"
    }
  }
}
