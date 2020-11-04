BuffTextureName = "Minotaur_ColossalStrength.dds"
BuffName = "Colossal Strength"
PersistsThroughDeath = true
NonDispellable = true
BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_TURRET},
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src2Var = "BaseBlockAmount",
          Src2VarTable = "CharVars",
          Src1Value = 1,
          Src2Value = 0,
          DestVar = "BaseBlockAmount",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "BaseBlockAmount",
          Src1Value = 1,
          Src2Value = 0,
          DestVar = "BaseBlockAmount",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "BaseBlockAmount",
          Src2Var = "DamageAmount",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "DamageAmount",
          MathOp = MO_MULTIPLY
        }
      }
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 10,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = true
    },
    SubBlocks = {
      {
        Function = BBGetLevel,
        Params = {TargetVar = "Owner", DestVar = "Level"}
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "CurrentDamage",
          SrcValueByLevel = {
            20,
            20,
            20,
            20,
            20,
            20,
            40,
            40,
            40,
            40,
            40,
            40,
            60,
            60,
            60,
            60,
            60,
            60
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "CurrentDamage",
          Src2Var = "LastDamage",
          Src2VarTable = "InstanceVars",
          CompareOp = CO_GREATER_THAN
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "LastDamage",
              DestVarTable = "InstanceVars",
              SrcVar = "CurrentDamage"
            }
          },
          {
            Function = BBSetBuffToolTipVar,
            Params = {
              Value = 0,
              ValueVar = "CurrentDamage",
              Index = 1
            }
          }
        }
      }
    }
  }
}
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "LastDamage",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  }
}
