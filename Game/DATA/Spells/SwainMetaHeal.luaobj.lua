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
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BaseHeal",
      SrcValue = 0,
      SrcValueByLevel = {
        20,
        30,
        40,
        0,
        0
      }
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Attacker",
      DestVar = "AbilityPower"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "AbilityPower",
      Src1Value = 0,
      Src2Value = 0.075,
      DestVar = "AbilityPowerMod",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "AbilityPowerMod",
      Src2Var = "BaseHeal",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "TotalHeal",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBIncHealth,
    Params = {
      TargetVar = "Target",
      Delta = 0,
      DeltaVar = "TotalHeal",
      HealerVar = "Attacker"
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
      SendIfOnScreenOrDiscard = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "swain_heal.troy"
    }
  }
}
