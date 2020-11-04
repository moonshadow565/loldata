NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "ViktorPowerTransfer.dds"
BuffName = "ViktorShield"
AutoBuffActivateEffect = "Viktor_Reverb_shield.troy"
AutoCooldownByLevel = {
  16,
  14,
  12,
  10,
  8
}
PersistsThroughDeath = true
NonDispellable = true
TriggersSpellCasts = true
SetSpellDamageRatio = 1
OnBuffActivateBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "IsChampTarget",
      Src1VarTable = "CharVars",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "TotalDamage",
          Src1VarTable = "CharVars",
          Src1Value = 0,
          Src2Value = 0.4,
          DestVar = "TotalDamage",
          DestVarTable = "CharVars",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBIncreaseShield,
        Params = {
          UnitVar = "Owner",
          AmountVar = "TotalDamage",
          AmountVarTable = "CharVars",
          Amount = 0,
          MagicShield = true,
          PhysicalShield = true
        }
      }
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBRemoveShield,
    Params = {
      UnitVar = "Owner",
      Amount = 10000,
      MagicShield = true,
      PhysicalShield = true
    }
  }
}
BuffOnPreDamageBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "DamageAmount",
      Src2Var = "TotalDamage",
      Src2VarTable = "CharVars",
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "DamageAmount",
          Src2Var = "TotalDamage",
          Src2VarTable = "CharVars",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "DamageAmount",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBReduceShield,
        Params = {
          UnitVar = "Owner",
          AmountVar = "DamageAmount",
          Amount = 0,
          MagicShield = true,
          PhysicalShield = true
        }
      },
      {
        Function = BBRemoveShield,
        Params = {
          UnitVar = "Owner",
          Amount = 0,
          MagicShield = true,
          PhysicalShield = true
        }
      },
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          ResetDuration = 0
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBReduceShield,
        Params = {
          UnitVar = "Owner",
          AmountVar = "DamageAmount",
          Amount = 0,
          MagicShield = true,
          PhysicalShield = true
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "TotalDamage",
          Src1VarTable = "CharVars",
          Src2Var = "DamageAmount",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "TotalDamage",
          DestVarTable = "CharVars",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "DamageAmount",
          SrcValue = 0
        }
      }
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Attacker", DestVar = "TeamID"}
  },
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "PAR",
      OwnerVar = "Owner",
      Function = GetMaxPAR,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BaseDamage",
      SrcValueByLevel = {
        40,
        65,
        90,
        115,
        140
      }
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 3,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "AoEDamage",
      SrcValueByLevel = {
        0.5,
        0.5,
        0.5
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "PAR",
      Src1Value = 0,
      Src2Value = 0.08,
      DestVar = "BonusDamage",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BonusDamage",
      Src2Var = "BaseDamage",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "TotalDamage",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "TotalDamage",
      Src2Var = "AoEDamage",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "AoEDamage",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "OwnerTeam"}
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Target", DestVar = "TargetTeam"}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Owner",
      Src2Var = "Target",
      CompareOp = CO_DIFFERENT_TEAM
    },
    SubBlocks = {
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          CallForHelpAttackerVar = "Attacker",
          TargetVar = "Target",
          Damage = 0,
          DamageVar = "TotalDamage",
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELL,
          PercentOfAttack = 1,
          SpellDamageRatio = 0.2,
          PhysicalDamageRatio = 1,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
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
          TargetVar = "Target",
          AttackerVar = "Attacker",
          BuffName = "ViktorPowerTransferReturn",
          BuffAddType = BUFF_RENEW_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_CombatEnchancer,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 3,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "viktorpowertransferreturn"
    }
  }
}
