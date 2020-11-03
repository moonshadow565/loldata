NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "2003_Regeneration_Potion.dds"
BuffName = "OdinHealthRelic"
AutoBuffActivateEffect = "Regenerationpotion_itm.troy"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "BaseHeal", SrcValue = 80}
  },
  {
    Function = BBGetLevel,
    Params = {TargetVar = "Owner", DestVar = "Level"}
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "Level",
      Src1Value = 25,
      Src2Value = 0,
      DestVar = "PerLevelHeal",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "PerLevelHeal",
      Src2Var = "BaseHeal",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "TotalHeal",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "TotalHeal",
      Src1Value = 0,
      Src2Value = 10,
      DestVar = "HealPerTick",
      DestVarTable = "InstanceVars",
      MathOp = MO_DIVIDE
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
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBIncHealth,
        Params = {
          TargetVar = "Owner",
          Delta = 0,
          DeltaVar = "HealPerTick",
          DeltaVarTable = "InstanceVars",
          HealerVar = "Owner"
        }
      }
    }
  }
}
