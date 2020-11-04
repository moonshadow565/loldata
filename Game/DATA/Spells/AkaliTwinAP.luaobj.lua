BuffTextureName = "AkaliTwinDisciplines.dds"
BuffName = "AkaliTwinAP"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = "akali_twinDisciplines_AP_buf.troy"
AutoBuffActivateAttachBoneName2 = "R_hand"
AutoBuffActivateAttachBoneName4 = ""
PersistsThroughDeath = true
Nondispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "AkaliAP",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BonusDmgPerc",
      DestVarTable = "InstanceVars",
      SrcValue = 0.1
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "AkaliAP",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 20,
      DestVar = "AkaliAP",
      DestVarTable = "InstanceVars",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "AkaliAP",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 500,
      DestVar = "AddBonusDmgPerc",
      DestVarTable = "InstanceVars",
      MathOp = MO_DIVIDE
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BonusDmgPerc",
      Src1VarTable = "InstanceVars",
      Src2Var = "AddBonusDmgPerc",
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "DmgMult",
      DestVarTable = "InstanceVars",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "DmgMult",
      Src2VarTable = "InstanceVars",
      Src1Value = 100,
      Src2Value = 0,
      DestVar = "DmgMultTooltip",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "DmgMultTooltip",
      Index = 1
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Owner",
      DestVar = "AkaliAP",
      DestVarTable = "InstanceVars"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "AkaliAP",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 20,
      DestVar = "AkaliAP",
      DestVarTable = "InstanceVars",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "AkaliAP",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 500,
      DestVar = "AddBonusDmgPerc",
      DestVarTable = "InstanceVars",
      MathOp = MO_DIVIDE
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BonusDmgPerc",
      Src1VarTable = "InstanceVars",
      Src2Var = "AddBonusDmgPerc",
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "DmgMult",
      DestVarTable = "InstanceVars",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 2,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src2Var = "DmgMult",
          Src2VarTable = "InstanceVars",
          Src1Value = 100,
          Src2Value = 0,
          DestVar = "DmgMultTooltip",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBSetBuffToolTipVar,
        Params = {
          Value = 0,
          ValueVar = "DmgMultTooltip",
          Index = 1
        }
      }
    }
  }
}
BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBGetTotalAttackDamage,
    Params = {TargetVar = "Attacker", DestVar = "TAD"}
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "TAD",
      Src2Var = "DmgMult",
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "DamageToDeal",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      TargetVar = "Target",
      Damage = 0,
      DamageVar = "DamageToDeal",
      DamageType = MAGIC_DAMAGE,
      SourceDamageType = DAMAGESOURCE_PROC,
      PercentOfAttack = 1,
      SpellDamageRatio = 0,
      PhysicalDamageRatio = 1,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  }
}
