BuffTextureName = "Minotaur_ColossalStrength.dds"
BuffName = "Colossal Strength"
PersistsThroughDeath = true
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "lastF1",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 5,
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
          DestVar = "DamageByRank",
          SrcValueByLevel = {
            10,
            11,
            12,
            12,
            13,
            14,
            15,
            15,
            16,
            17,
            18,
            18,
            19,
            20,
            21,
            21,
            22,
            23
          }
        }
      },
      {
        Function = BBGetTotalAttackDamage,
        Params = {
          TargetVar = "Owner",
          DestVar = "totalAttackDamage"
        }
      },
      {
        Function = BBGetStat,
        Params = {
          Stat = GetBaseAttackDamage,
          TargetVar = "Owner",
          DestVar = "baseAttackDamage"
        }
      },
      {
        Function = BBGetStat,
        Params = {
          Stat = GetFlatMagicDamageMod,
          TargetVar = "Owner",
          DestVar = "abilityPower"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "totalAttackDamage",
          Src2Var = "baseAttackDamage",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "bonusAttackDamage",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "bonusAttackDamage",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "attackDamageToAdd",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "abilityPower",
          Src1Value = 0,
          Src2Value = 0.1,
          DestVar = "abilityPowerToAdd",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "DamageByRank",
          Src2Var = "abilityPowerToAdd",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "damageToDeal",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "damageToDeal",
          Src2Var = "attackDamageToAdd",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "CurrentDamage",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "CurrentDamage",
          Src2Var = "lastF1",
          Src2VarTable = "InstanceVars",
          CompareOp = CO_NOT_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "lastF1",
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
          },
          {
            Function = BBSetBuffToolTipVar,
            Params = {
              Value = 0,
              ValueVar = "DamageByRank",
              Index = 2
            }
          }
        }
      }
    }
  }
}
