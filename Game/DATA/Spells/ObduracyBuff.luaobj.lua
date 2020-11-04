NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "Malphite_BrutalStrikes.dds"
BuffName = "MalphiteDamageBuff"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "PercMod",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBGetTotalAttackDamage,
    Params = {TargetVar = "Owner", DestVar = "DamageVar"}
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "DamageVar",
      Src2Var = "PercMod",
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "DamageIncrease",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatPhysicalDamageMod,
      TargetVar = "Owner",
      DeltaVar = "DamageIncrease",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBGetArmor,
    Params = {TargetVar = "Owner", DestVar = "ArmorVar"}
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "ArmorVar",
      Src2Var = "PercMod",
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "ArmorIncrease",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatArmorMod,
      TargetVar = "Owner",
      DeltaVar = "ArmorIncrease",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Malphite_Enrage_buf.troy",
      Flags = 0,
      EffectIDVar = "SandRHand",
      EffectIDVarTable = "InstanceVars",
      BoneName = "R_thumb_b",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = true,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Malphite_Enrage_buf.troy",
      Flags = 0,
      EffectIDVar = "SandLHand",
      EffectIDVarTable = "InstanceVars",
      BoneName = "L_finger_b",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = true,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Malphite_Enrage_glow.troy",
      Flags = 0,
      EffectIDVar = "Sandroot",
      EffectIDVarTable = "InstanceVars",
      BoneName = "root",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = true,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src1Var = "DamageIncrease",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = -1,
      DestVar = "DamageIncrease",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatPhysicalDamageMod,
      TargetVar = "Owner",
      DeltaVar = "DamageIncrease",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "ArmorIncrease",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = -1,
      DestVar = "ArmorIncrease",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatArmorMod,
      TargetVar = "Owner",
      DeltaVar = "ArmorIncrease",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "SandLHand",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "SandRHand",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "Sandroot",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "malphite_enrage_buf.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "malphite_enrage_glow.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  }
}
