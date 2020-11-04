NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "Soraka_Bless.dds"
BuffName = "Astral Blessing"
AutoBuffActivateEffect = "Bless_buf.troy"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "HealthToRestore",
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
      Delta = 35
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 1,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = true
    },
    SubBlocks = {
      {
        Function = BBIncHealth,
        Params = {
          TargetVar = "Owner",
          Delta = 0,
          DeltaVar = "HealthToRestore",
          DeltaVarTable = "InstanceVars",
          HealerVar = "Attacker"
        }
      }
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
        11,
        18,
        25,
        32,
        39
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "TempAbilityPower",
      Src1Value = 0,
      Src2Value = 0.11,
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
    Function = BBSetVarInTable,
    Params = {
      DestVar = "HealthToRestore",
      DestVarTable = "NextBuffVars",
      SrcVar = "HealthToRestore"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_Heal,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 9.1,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  }
}
