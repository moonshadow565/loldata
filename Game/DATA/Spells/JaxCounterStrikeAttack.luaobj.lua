NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Armsmaster_Disarm.dds"
BuffName = "CounterStrike"
IsDeathRecapSource = true
SelfExecuteBuildingBlocks = {
  {
    Function = BBPlayAnimation,
    Params = {
      AnimationName = "Spell3B",
      ScaleTime = 0,
      TargetVar = "Attacker",
      Loop = false,
      Blend = false,
      Lock = false
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Counterstrike_cas.troy",
      Flags = 0,
      EffectIDVar = "AddPart",
      TargetObjectVar = "Target",
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
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Attacker",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BaseDmg",
      SrcValueByLevel = {
        40,
        70,
        100,
        130,
        160
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
      Src2Value = 0.8,
      DestVar = "BonusAD",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BonusAD",
      Src2Var = "BaseDmg",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "Damage",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "NumCounter",
      Src1VarTable = "CharVars",
      Src2Var = "Damage",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "Damage",
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
      DamageVar = "Damage",
      DamageType = PHYSICAL_DAMAGE,
      SourceDamageType = DAMAGESOURCE_SPELLAOE,
      PercentOfAttack = 1,
      SpellDamageRatio = 0,
      PhysicalDamageRatio = 0,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  },
  {
    Function = BBApplyStun,
    Params = {
      AttackerVar = "Attacker",
      TargetVar = "Target",
      Duration = 1
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "counterstrike_cas.troy"
    }
  }
}
