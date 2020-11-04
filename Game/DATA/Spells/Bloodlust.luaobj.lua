NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "DarkChampion_Bloodlust.dds"
BuffName = "Bloodlust"
AutoBuffActivateEffect = ""
AutoBuffActivateEffect2 = ""
SpellToggleSlot = 1
AutoCooldownByLevel = {
  30,
  26,
  22,
  18,
  14
}
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "AttackSpeedMod",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "CriticalChanceMod",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBGetBuffCountFromAll,
    Params = {
      DestVar = "Count",
      TargetVar = "Owner",
      BuffName = "Bloodlust"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Count",
      Src2Var = "AttackSpeedMod",
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "TotalAttackSpeed",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Count",
      Src2Var = "CriticalChanceMod",
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "TotalCritChance",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "TotalAttackSpeed",
      Src1Value = 100,
      Src2Value = 0,
      DestVar = "TotalAttackSpeed",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "TotalCritChance",
      Src1Value = 100,
      Src2Value = 0,
      DestVar = "TotalCritChance",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "TotalAttackSpeed",
      Index = 1
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "TotalCritChance",
      Index = 2
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentAttackSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "AttackSpeedMod",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatCritChanceMod,
      TargetVar = "Owner",
      DeltaVar = "CriticalChanceMod",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBGetBuffCountFromAll,
    Params = {
      DestVar = "Count",
      TargetVar = "Owner",
      BuffName = "Bloodlust"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Value = 0,
      Src2Value = 65,
      DestVar = "HealthToRestore",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Count",
      Src1Value = 0,
      Src2Value = 65,
      DestVar = "HealthToRestoreM",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "HealthToRestore",
      Src2Var = "HealthToRestoreM",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "HealthToRestore",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Owner",
      DestVar = "SpellPower"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "SpellPower",
      Src1Value = 0,
      Src2Value = 0.2,
      DestVar = "SpellPowerEach",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "SpellPowerEach",
      Src2Var = "Count",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "BonusHeals",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "HealthToRestore",
      Src2Var = "BonusHeals",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "HealthToRestore",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBIncHealth,
    Params = {
      TargetVar = "Owner",
      Delta = 0,
      DeltaVar = "HealthToRestore",
      HealerVar = "Owner"
    }
  },
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "BloodlustParticle"
    }
  },
  {
    Function = BBSpellBuffRemoveStacks,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "Bloodlust",
      NumStacks = 0
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Global_Heal.troy",
      Flags = 0,
      EffectIDVar = "Part",
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
    Function = BBPreloadSpell,
    Params = {Name = "bloodlust"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "bloodlustparticle"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "global_heal.troy"
    }
  }
}
