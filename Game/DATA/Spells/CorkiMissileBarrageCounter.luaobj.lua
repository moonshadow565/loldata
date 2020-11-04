PersistsThroughDeath = true
NonDispellable = true
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 10,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "MissileBarrage",
          BuffAddType = BUFF_STACKS_AND_RENEWS,
          StacksExclusive = true,
          BuffType = BUFF_Aura,
          MaxStack = 7,
          NumberOfStacks = 1,
          Duration = 25000,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false
        }
      }
    }
  }
}
BuffOnSpellCastBuildingBlocks = {
  {
    Function = BBGetCastInfo,
    Params = {DestVar = "SpellSlot", Info = GetSpellSlot}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "SpellSlot",
      Value2 = 3,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "BarrageCounter",
          Src1VarTable = "CharVars",
          Src1Value = 0,
          Src2Value = 1,
          DestVar = "BarrageCounter",
          DestVarTable = "CharVars",
          MathOp = MO_ADD
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "missilebarrage"
    }
  }
}
