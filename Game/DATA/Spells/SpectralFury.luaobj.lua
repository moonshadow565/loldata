BuffTextureName = "3142_Youmus_Spectral_Blade.dds"
BuffName = "SpectralFury"
AutoBuffActivateEffect = "Global_Haste.troy"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "SpectralCount",
      RequiredVarTable = "CharVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentAttackSpeedMod,
      TargetVar = "Owner",
      Delta = 0.7
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMovementSpeedMod,
      TargetVar = "Owner",
      Delta = 0.25
    }
  }
}
BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "SpectralCount",
      Src1VarTable = "CharVars",
      Value2 = 3,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBGetBuffRemainingDuration,
        Params = {
          DestVar = "SpectralDuration",
          TargetVar = "Owner",
          BuffName = "SpectralFury"
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Attacker",
          BuffName = "SpectralFury",
          BuffAddType = BUFF_RENEW_EXISTING,
          BuffType = BUFF_CombatEnchancer,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 2,
          BuffVarsTable = "NextBuffVars",
          DurationVar = "SpectralDuration",
          TickRate = 0
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "SpectralCount",
          Src1VarTable = "CharVars",
          Src1Value = 0,
          Src2Value = 1,
          DestVar = "SpectralCount",
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
      Name = "spectralfury"
    }
  }
}
