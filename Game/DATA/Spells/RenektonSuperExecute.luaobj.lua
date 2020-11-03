DoesntBreakShields = true
IsDamagingSpell = true
TargetExecuteBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "HitResult",
      Value2 = HIT_Critical,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "HitResult", SrcValue = HIT_Normal}
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "HitResult",
      Value2 = HIT_Miss,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "HitResult", SrcValue = HIT_Normal}
      }
    }
  },
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "RagePercent",
      OwnerVar = "Owner",
      Function = GetPARPercent,
      PARType = PAR_OTHER
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "FuryBonus", SrcValue = false}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BonusDamage",
      SrcValueByLevel = {
        5,
        15,
        25,
        35,
        45
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "RagePercent",
      Value2 = 0.5,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "FuryBonus", SrcValue = true}
      },
      {
        Function = BBIncPAR,
        Params = {
          TargetVar = "Owner",
          Delta = -50,
          PARType = PAR_OTHER
        }
      },
      {
        Function = BBGetPAROrHealth,
        Params = {
          DestVar = "CurrentFury",
          OwnerVar = "Owner",
          Function = GetPAR,
          PARType = PAR_OTHER
        }
      }
    }
  },
  {
    Function = BBBreakSpellShields,
    Params = {TargetVar = "Target"}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "FuryBonus",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "RenektonUnlockAnimation",
          BuffAddType = BUFF_RENEW_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 0.51,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "RenektonUnlockAnimation",
          BuffAddType = BUFF_RENEW_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 0.3,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      }
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetBaseAttackDamage,
      TargetVar = "Owner",
      DestVar = "BaseDamage"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BonusPercent",
      SrcValueByLevel = {
        0.75,
        0.75,
        0.75,
        0.75,
        0.75,
        0.75
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BaseDamage",
      Src2Var = "BonusPercent",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "BaseDamage",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BaseDamage",
      Src2Var = "BonusDamage",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "BaseDamage",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      CallForHelpAttackerVar = "Attacker",
      TargetVar = "Target",
      Damage = 0,
      DamageVar = "BaseDamage",
      DamageType = PHYSICAL_DAMAGE,
      SourceDamageType = DAMAGESOURCE_ATTACK,
      PercentOfAttack = 0,
      PercentOfAttackByLevel = {
        1,
        1,
        1,
        1,
        1
      },
      SpellDamageRatio = 0,
      PhysicalDamageRatio = 0,
      PhysicalDamageRatioVar = "BonusPercent",
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = true
    }
  },
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
    SubBlocks = {
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          CallForHelpAttackerVar = "Attacker",
          TargetVar = "Target",
          Damage = 0,
          DamageVar = "BaseDamage",
          DamageType = PHYSICAL_DAMAGE,
          SourceDamageType = DAMAGESOURCE_ATTACK,
          PercentOfAttack = 0,
          PercentOfAttackByLevel = {
            1,
            1,
            1,
            1,
            1
          },
          SpellDamageRatio = 0,
          PhysicalDamageRatio = 0,
          PhysicalDamageRatioVar = "BonusPercent",
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = true
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "FuryBonus",
          Value2 = false,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBApplyStun,
            Params = {
              AttackerVar = "Attacker",
              TargetVar = "Target",
              Duration = 0.75
            }
          }
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "FuryBonus",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          CallForHelpAttackerVar = "Attacker",
          TargetVar = "Target",
          Damage = 0,
          DamageVar = "BaseDamage",
          DamageType = PHYSICAL_DAMAGE,
          SourceDamageType = DAMAGESOURCE_ATTACK,
          PercentOfAttack = 0,
          PercentOfAttackByLevel = {
            1,
            1,
            1,
            1,
            1
          },
          SpellDamageRatio = 0,
          PhysicalDamageRatio = 0,
          PhysicalDamageRatioVar = "BonusPercent",
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = true
        }
      },
      {
        Function = BBSpellBuffClear,
        Params = {
          TargetVar = "Owner",
          BuffName = "RenektonRageReady"
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "FuryBonus",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetPAROrHealth,
        Params = {
          DestVar = "PostFury",
          OwnerVar = "Owner",
          Function = GetPAR,
          PARType = PAR_OTHER
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "CurrentFury",
          Src2Var = "PostFury",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "FuryCost",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBIncPAR,
        Params = {
          TargetVar = "Owner",
          Delta = 0,
          PARType = PAR_OTHER,
          DeltaVar = "FuryCost"
        }
      },
      {
        Function = BBApplyStun,
        Params = {
          AttackerVar = "Attacker",
          TargetVar = "Target",
          Duration = 1.5
        }
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "RenektonWeaponGlowFade",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 1,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBSetDodgePiercing,
    Params = {TargetVar = "Owner", Value = false}
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "renektonunlockanimation"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "renektonrageready"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "renektonweaponglowfade"
    }
  }
}
