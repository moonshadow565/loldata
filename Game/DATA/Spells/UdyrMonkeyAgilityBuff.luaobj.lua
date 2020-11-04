NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = false
IsDamagingSpell = false
BuffTextureName = "Udyr_MonkeysAgility.dds"
BuffName = "UdyrMonkeyAgilityBuff"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "UdyrBuff.troy",
      Flags = 0,
      EffectIDVar = "a",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = true
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "UdyrBuff.troy",
      Flags = 0,
      EffectIDVar = "a",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = true
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentAttackSpeedMod,
      TargetVar = "Owner",
      Delta = 0.1
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatDodgeMod,
      TargetVar = "Owner",
      Delta = 0.03
    }
  },
  {
    Function = BBGetBuffCountFromAll,
    Params = {
      DestVar = "MonkeyStacks",
      TargetVar = "Owner",
      BuffName = "UdyrMonkeyAgilityBuff"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "MonkeyStacks",
      Src1Value = 10,
      Src2Value = 0,
      DestVar = "AttackSpeedMod",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "MonkeyStacks",
      Src1Value = 3,
      Src2Value = 0,
      DestVar = "DodgeMod",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "AttackSpeedMod",
      Index = 1
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "DodgeMod",
      Index = 2
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "udyrbuff.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "udyrmonkeyagilitybuff"
    }
  }
}
