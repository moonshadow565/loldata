NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
SpellDamageRatio = 0.5
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "percentOfAttack",
      SrcVar = "percentOfAttack",
      SrcVarTable = "CharVars"
    }
  },
  {
    Function = BBGetTotalAttackDamage,
    Params = {
      TargetVar = "Owner",
      DestVar = "totalDamage"
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetBaseAttackDamage,
      TargetVar = "Owner",
      DestVar = "BaseDamage"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "totalDamage",
      Src2Var = "BaseDamage",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "BonusDamage",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "BonusDamage",
      Src1Value = 1.1,
      Src2Value = 0,
      DestVar = "BonusDamage",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      CallForHelpAttackerVar = "Attacker",
      TargetVar = "Target",
      DamageByLevel = {
        80,
        125,
        170,
        215,
        260
      },
      Damage = 0,
      DamageVar = "BonusDamage",
      DamageType = PHYSICAL_DAMAGE,
      SourceDamageType = DAMAGESOURCE_SPELLAOE,
      PercentOfAttack = 0,
      PercentOfAttackVar = "percentOfAttack",
      SpellDamageRatio = 0,
      PhysicalDamageRatio = 0,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "percentOfAttack",
      Src1VarTable = "CharVars",
      Src1Value = 0,
      Src2Value = 0.8,
      DestVar = "percentOfAttack",
      DestVarTable = "CharVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "percentOfAttack",
      Src1VarTable = "CharVars",
      Src1Value = 0,
      Src2Value = 0.4,
      DestVar = "percentOfAttack",
      DestVarTable = "CharVars",
      MathOp = MO_MAX
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Target",
      EffectName = "SpiralBlade_tar.troy",
      Flags = 0,
      EffectIDVar = "afa",
      BoneName = "spine",
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
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "spiralblade_tar.troy"
    }
  }
}
