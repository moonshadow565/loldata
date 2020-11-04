BuffTextureName = "YorickOmenOfPestilence.dds"
BuffName = "YorickDecayingGhoul"
BuffOnAllowAddBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "Type",
      Value2 = BUFF_Slow,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetReturnValue,
        Params = {SrcValue = false}
      }
    }
  }
}
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetLevel,
    Params = {
      TargetVar = "Attacker",
      DestVar = "StartingLevel",
      DestVarTable = "InstanceVars"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "StartingLevel",
      Src2VarTable = "InstanceVars",
      Src1Value = 2,
      Src2Value = 0,
      DestVar = "ADFromLevel",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatArmorMod,
      TargetVar = "Owner",
      DeltaVar = "ADFromLevel",
      Delta = 0
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatSpellBlockMod,
      TargetVar = "Owner",
      DeltaVar = "ADFromLevel",
      Delta = 0
    }
  },
  {
    Function = BBGetTotalAttackDamage,
    Params = {TargetVar = "Attacker", DestVar = "TAD"}
  },
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "MaxHealth",
      OwnerVar = "Attacker",
      Function = GetMaxHealth,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "TAD",
      Src1Value = 0,
      Src2Value = 0.35,
      DestVar = "ADFromStats",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "ADFromStats",
      Src1Value = 0,
      Src2Value = 10,
      DestVar = "ADFromStats",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "ADFromStats",
      Src1Value = 0,
      Src2Value = 10,
      DestVar = "ADFromStats",
      MathOp = MO_MAX
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "MaxHealth",
      Src1Value = 0,
      Src2Value = 0.35,
      DestVar = "HealthFromStats",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "HealthFromStats",
      Src1Value = 0,
      Src2Value = 60,
      DestVar = "HealthFromStats",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "HealthFromStats",
      Src1Value = 0,
      Src2Value = 60,
      DestVar = "HealthFromStats",
      MathOp = MO_MAX
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatHPPoolMod,
      TargetVar = "Owner",
      DeltaVar = "HealthFromStats",
      Delta = 0
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatPhysicalDamageMod,
      TargetVar = "Owner",
      DeltaVar = "ADFromStats",
      Delta = 0
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "StartingLevel",
      Src1VarTable = "InstanceVars",
      Value2 = 3,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIncPermanentStat,
        Params = {
          Stat = IncPermanentFlatMovementSpeedMod,
          TargetVar = "Owner",
          Delta = 30
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "StartingLevel",
      Src1VarTable = "InstanceVars",
      Value2 = 6,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIncPermanentStat,
        Params = {
          Stat = IncPermanentFlatMovementSpeedMod,
          TargetVar = "Owner",
          Delta = 30
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "StartingLevel",
      Src1VarTable = "InstanceVars",
      Value2 = 11,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIncPermanentStat,
        Params = {
          Stat = IncPermanentFlatMovementSpeedMod,
          TargetVar = "Owner",
          Delta = 40
        }
      }
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentPercentHPRegenMod,
      TargetVar = "Owner",
      Delta = -1
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetGhosted
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetGhosted
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 0.9,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBGetPAROrHealth,
        Params = {
          DestVar = "MaxHealth",
          OwnerVar = "Owner",
          Function = GetMaxHealth,
          PARType = PAR_MANA
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "MaxHealth",
          Src1Value = 0.2,
          Src2Value = 0,
          DestVar = "MaxHealth",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Owner",
          CallForHelpAttackerVar = "Owner",
          TargetVar = "Owner",
          Damage = 0,
          DamageVar = "MaxHealth",
          DamageType = TRUE_DAMAGE,
          SourceDamageType = DAMAGESOURCE_INTERNALRAW,
          PercentOfAttack = 1,
          SpellDamageRatio = 0,
          PhysicalDamageRatio = 0,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      }
    }
  }
}
BuffOnPreMitigationDamageBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Value1 = DAMAGESOURCE_SPELLAOE, CompareOp = CO_DAMAGE_SOURCETYPE_IS},
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src2Var = "DamageAmount",
          Src1Value = 0.5,
          Src2Value = 0,
          DestVar = "DamageAmount",
          MathOp = MO_MULTIPLY
        }
      }
    }
  }
}
BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBSetBuffCasterUnit,
    Params = {CasterVar = "Caster"}
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Caster",
      CallForHelpAttackerVar = "Caster",
      TargetVar = "Target",
      Damage = 0,
      DamageVar = "DamageAmount",
      DamageType = PHYSICAL_DAMAGE,
      SourceDamageType = DAMAGESOURCE_PROC,
      PercentOfAttack = 1,
      SpellDamageRatio = 0,
      PhysicalDamageRatio = 0,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "DamageAmount",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "DamageAmount",
      MathOp = MO_MULTIPLY
    }
  }
}
BuffOnHealBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "Health",
      Value2 = 0,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "Health",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "EffectiveHeal",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBSetReturnValue,
        Params = {
          SrcVar = "EffectiveHeal"
        }
      }
    }
  }
}
