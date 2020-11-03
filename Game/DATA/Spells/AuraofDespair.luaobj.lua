NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "SadMummy_AuraofDespair.dds"
BuffName = "AuraofDespair"
AutoBuffActivateEffect = "Despair_buf.troy"
AutoBuffActivateAttachBoneName = "head"
AutoBuffActivateEffect2 = "Despairpool_tar.troy"
SpellToggleSlot = 2
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 1,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Level",
      Src1Value = 0,
      Src2Value = 0.003,
      DestVar = "InitialDamage",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "InitialDamage",
      Src1Value = 0,
      Src2Value = 0.012,
      DestVar = "InitialDamage",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Owner",
      DestVar = "AbilityPowerMod"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "AbilityPowerMod",
      Src1Value = 0,
      Src2Value = 5.0E-5,
      DestVar = "AbilityPowerBonus",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "AbilityPowerBonus",
      Src2Var = "InitialDamage",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "LifeLossPercent",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BaseDamage",
      SrcValueByLevel = {
        8,
        12,
        16,
        20,
        24
      }
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 350,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBGetPAROrHealth,
        Params = {
          DestVar = "Temp1",
          OwnerVar = "Unit",
          Function = GetMaxHealth,
          PARType = PAR_MANA
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "Temp1",
          Src1Value = 0,
          Src2Value = 4500,
          DestVar = "Temp1",
          MathOp = MO_MIN
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "Temp1",
          Src2Var = "LifeLossPercent",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "PercentDamage",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "PercentDamage",
          Src2Var = "BaseDamage",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "PercentDamage",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          CallForHelpAttackerVar = "Attacker",
          TargetVar = "Unit",
          Damage = 0,
          DamageVar = "PercentDamage",
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELLAOE,
          PercentOfAttack = 1,
          SpellDamageRatio = 0,
          PhysicalDamageRatio = 1,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      }
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
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "Level",
          SpellSlotValue = 1,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          OwnerVar = "Owner",
          Function = GetSlotSpellLevel
        }
      },
      {
        Function = BBGetPAROrHealth,
        Params = {
          DestVar = "OwnerMana",
          OwnerVar = "Owner",
          Function = GetPAR,
          PARType = PAR_MANA
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "OwnerMana",
          Value2 = 8,
          CompareOp = CO_LESS_THAN
        },
        SubBlocks = {
          {
            Function = BBSpellBuffRemoveCurrent,
            Params = {TargetVar = "Owner"}
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBIncPAR,
            Params = {
              TargetVar = "Owner",
              Delta = -8,
              PARType = PAR_MANA
            }
          }
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "Level",
          Src1Value = 0,
          Src2Value = 0.003,
          DestVar = "InitialDamage",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "InitialDamage",
          Src1Value = 0,
          Src2Value = 0.012,
          DestVar = "InitialDamage",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBGetStat,
        Params = {
          Stat = GetFlatMagicDamageMod,
          TargetVar = "Owner",
          DestVar = "AbilityPowerMod"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "AbilityPowerMod",
          Src1Value = 0,
          Src2Value = 5.0E-5,
          DestVar = "AbilityPowerBonus",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "AbilityPowerBonus",
          Src2Var = "InitialDamage",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "LifeLossPercent",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "BaseDamage",
          SrcValueByLevel = {
            8,
            12,
            16,
            20,
            24
          }
        }
      },
      {
        Function = BBForEachUnitInTargetArea,
        Params = {
          AttackerVar = "Owner",
          CenterVar = "Owner",
          Range = 350,
          Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
          IteratorVar = "Unit",
          InclusiveBuffFilter = true
        },
        SubBlocks = {
          {
            Function = BBGetPAROrHealth,
            Params = {
              DestVar = "Temp1",
              OwnerVar = "Unit",
              Function = GetMaxHealth,
              PARType = PAR_MANA
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "Temp1",
              Src1Value = 0,
              Src2Value = 4500,
              DestVar = "Temp1",
              MathOp = MO_MIN
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "Temp1",
              Src2Var = "LifeLossPercent",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "PercentDamage",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "PercentDamage",
              Src2Var = "BaseDamage",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "PercentDamage",
              MathOp = MO_ADD
            }
          },
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              CallForHelpAttackerVar = "Attacker",
              TargetVar = "Unit",
              Damage = 0,
              DamageVar = "PercentDamage",
              DamageType = MAGIC_DAMAGE,
              SourceDamageType = DAMAGESOURCE_SPELLAOE,
              PercentOfAttack = 1,
              SpellDamageRatio = 0,
              PhysicalDamageRatio = 1,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          }
        }
      }
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "AuraofDespair"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "AuraofDespair"
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
          BuffName = "AuraofDespair",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Aura,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 25000,
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
      Name = "auraofdespair"
    }
  }
}
