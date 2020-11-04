NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Owner",
      DestVar = "SpellPower"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BaseHealthToHeal",
      SrcValueByLevel = {
        250,
        400,
        550
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "SpellPower",
      Src1Value = 0,
      Src2Value = 2,
      DestVar = "SpellPowerBonus",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BaseHealthToHeal",
      Src2Var = "SpellPowerBonus",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "HealthToHeal",
      MathOp = MO_ADD
    }
  },
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
        Function = BBIncHealth,
        Params = {
          TargetVar = "Target",
          Delta = 0,
          DeltaVar = "HealthToHeal",
          HealerVar = "Owner"
        }
      },
      {
        Function = BBApplyAssistMarker,
        Params = {
          Duration = 10,
          TargetVar = "Target",
          SourceVar = "Owner"
        }
      }
    }
  }
}
