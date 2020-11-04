BuffTextureName = "AkaliTwinDisciplines.dds"
BuffName = "AkaliTwinDmg"
AutoBuffActivateEffect = "akali_twinDisciplines_DMG_buf.troy"
AutoBuffActivateAttachBoneName = "L_hand"
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
AutoBuffActivateEffect3 = ""
AutoBuffActivateAttachBoneName3 = ""
PersistsThroughDeath = true
Nondispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "AkaliDmg",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BaseVampPercent",
      DestVarTable = "InstanceVars",
      SrcValue = 0.1
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "AkaliDmg",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 10,
      DestVar = "AkaliDmg",
      DestVarTable = "InstanceVars",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "AkaliDmg",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 2000,
      DestVar = "AdditionalVampPercent",
      DestVarTable = "InstanceVars",
      MathOp = MO_DIVIDE
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BaseVampPercent",
      Src1VarTable = "InstanceVars",
      Src2Var = "AdditionalVampPercent",
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "VampPercent",
      DestVarTable = "CharVars",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "VampPercent",
      Src2VarTable = "CharVars",
      Src1Value = 100,
      Src2Value = 0,
      DestVar = "VampPercentTooltip",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "VampPercentTooltip",
      ValueVarTable = "InstanceVars",
      Index = 1
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 0,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBGetStat,
        Params = {
          Stat = GetFlatPhysicalDamageMod,
          TargetVar = "Owner",
          DestVar = "AkaliDmg",
          DestVarTable = "InstanceVars"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "AkaliDmg",
          Src1VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 10,
          DestVar = "AkaliDmg",
          DestVarTable = "InstanceVars",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "AkaliDmg",
          Src1VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 2000,
          DestVar = "AdditionalVampPercent",
          DestVarTable = "InstanceVars",
          MathOp = MO_DIVIDE
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "BaseVampPercent",
          Src1VarTable = "InstanceVars",
          Src2Var = "AdditionalVampPercent",
          Src2VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "VampPercent",
          DestVarTable = "CharVars",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "VampPercent",
          Src2VarTable = "CharVars",
          Src1Value = 100,
          Src2Value = 0,
          DestVar = "VampPercentTooltip",
          DestVarTable = "InstanceVars",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBSetBuffToolTipVar,
        Params = {
          Value = 0,
          ValueVar = "VampPercentTooltip",
          ValueVarTable = "InstanceVars",
          Index = 1
        }
      }
    }
  }
}
BuffOnDealDamageBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Value1 = DAMAGESOURCE_SPELL, CompareOp = CO_DAMAGE_SOURCETYPE_IS},
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "DamageAmount",
          Src2Var = "VampPercent",
          Src2VarTable = "CharVars",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "HealthToHeal",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBIncHealth,
        Params = {
          TargetVar = "Owner",
          Delta = 0,
          DeltaVar = "HealthToHeal",
          HealerVar = "Owner"
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {Value1 = DAMAGESOURCE_SPELLAOE, CompareOp = CO_DAMAGE_SOURCETYPE_IS},
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "VampPercent",
          Src1VarTable = "CharVars",
          Src1Value = 0,
          Src2Value = 0.5,
          DestVar = "VampPercent",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "DamageAmount",
          Src2Var = "VampPercent",
          Src1Value = 0,
          Src2Value = 0.05,
          DestVar = "HealthToHeal",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBIncHealth,
        Params = {
          TargetVar = "Owner",
          Delta = 0,
          DeltaVar = "HealthToHeal",
          HealerVar = "Owner"
        }
      }
    }
  }
}
