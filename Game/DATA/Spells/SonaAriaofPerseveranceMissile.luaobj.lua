NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
SpellDamageRatio = 1
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Attacker",
      DestVar = "APMod"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "APMod",
      Src1Value = 0,
      Src2Value = 0.6,
      DestVar = "APMod",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncHealth,
    Params = {
      TargetVar = "Target",
      Delta = 0,
      DeltaVar = "APMod",
      DeltaByLevel = {
        40,
        65,
        90,
        115,
        140
      },
      HealerVar = "Attacker"
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Target",
      EffectName = "Global_Heal.troy",
      Flags = 0,
      EffectIDVar = "self",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Target",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false
    }
  },
  {
    Function = BBApplyAssistMarker,
    Params = {
      Duration = 10,
      TargetVar = "Target",
      SourceVar = "Attacker"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "global_heal.troy"
    }
  }
}
