DoesntTriggerSpellCasts = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "DamagePerTick",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "StackingDamagePerTick",
      RequiredVarTable = "InstanceVars"
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
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Owner",
          AttackerVar = "Attacker",
          BuffName = "ToxicShotAttack"
        },
        SubBlocks = {
          {
            Function = BBGetBuffCountFromAll,
            Params = {
              DestVar = "Count",
              TargetVar = "Owner",
              BuffName = "ToxicShotAttack"
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "StackingDamagePerTick",
              Src1VarTable = "InstanceVars",
              Src2Var = "Count",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "StackDamage",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "DamagePerTick",
              Src1VarTable = "InstanceVars",
              Src2Var = "StackDamage",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "DamageAmount",
              MathOp = MO_ADD
            }
          },
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              TargetVar = "Owner",
              Damage = 0,
              DamageVar = "DamageAmount",
              DamageType = MAGIC_DAMAGE,
              SourceDamageType = DAMAGESOURCE_PERIODIC,
              PercentOfAttack = 1,
              SpellDamageRatio = 0.14
            }
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBSpellBuffRemoveCurrent,
            Params = {TargetVar = "Owner"}
          }
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "toxicshotattack"
    }
  }
}
