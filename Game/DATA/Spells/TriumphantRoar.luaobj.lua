NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Owner",
      DestVar = "AbilityPower"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "AbilityPower",
      Src1Value = 0,
      Src2Value = 0.4,
      DestVar = "AbilityPower",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BaseHeal",
      SrcValueByLevel = {
        60,
        90,
        120,
        150,
        180
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BaseHeal",
      Src2Var = "AbilityPower",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "FinalHeal",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Target",
      Src2Var = "Owner",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIncHealth,
        Params = {
          TargetVar = "Owner",
          Delta = 0,
          DeltaVar = "FinalHeal",
          HealerVar = "Owner"
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBGetPAROrHealth,
        Params = {
          DestVar = "Temp1",
          OwnerVar = "Target",
          Function = GetHealthPercent,
          PARType = PAR_MANA
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Temp1",
          Value2 = 1,
          CompareOp = CO_LESS_THAN
        },
        SubBlocks = {
          {
            Function = BBApplyAssistMarker,
            Params = {
              Duration = 10,
              TargetVar = "Target",
              SourceVar = "Attacker"
            }
          }
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "FinalHeal",
          Src1Value = 0,
          Src2Value = 2,
          DestVar = "FinalHeal",
          MathOp = MO_DIVIDE
        }
      },
      {
        Function = BBIncHealth,
        Params = {
          TargetVar = "Target",
          Delta = 0,
          DeltaVar = "FinalHeal",
          HealerVar = "Owner"
        }
      }
    }
  }
}
