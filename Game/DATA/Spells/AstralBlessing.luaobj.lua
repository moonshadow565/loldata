NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "Soraka_Bless.dds"
BuffName = "Astral Blessing"
AutoBuffActivateEffect = "soraka_astralBless_buf.troy"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBApplyAssistMarker,
    Params = {
      Duration = 10,
      TargetVar = "Owner",
      SourceVar = "Attacker"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "AstralArmor",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatArmorMod,
      TargetVar = "Owner",
      DeltaVar = "AstralArmor",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Owner",
      DestVar = "TempAbilityPower"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "HealthToRestore",
      SrcValueByLevel = {
        80,
        135,
        190,
        245,
        300
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "AstralArmor",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        15,
        20,
        25,
        30,
        35
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "TempAbilityPower",
      Src1Value = 0,
      Src2Value = 0.9,
      DestVar = "HealingBonus",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "HealingBonus",
      Src2Var = "HealthToRestore",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "HealthToRestore",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 9,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  },
  {
    Function = BBIncHealth,
    Params = {
      TargetVar = "Target",
      Delta = 0,
      DeltaVar = "HealthToRestore",
      HealerVar = "Owner"
    }
  }
}
