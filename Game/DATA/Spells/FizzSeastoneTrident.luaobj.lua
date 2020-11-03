BuffTextureName = "FizzSeastoneActive.dds"
BuffName = "FizzMalison"
AutoBuffActivateEffect = "Fizz_SeastoneTrident.troy"
AutoBuffActivateAttachBoneName = "root"
IsDeathRecapSource = true
PersistsThroughDeath = true
NonDispellable = true
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 0.5,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = true
    },
    SubBlocks = {
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "Level",
          SpellSlotValue = 1,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          OwnerVar = "Attacker",
          Function = GetSlotSpellLevel
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "BaseMagic",
          SrcValueByLevel = {
            30,
            40,
            50,
            60,
            70
          }
        }
      },
      {
        Function = BBGetPAROrHealth,
        Params = {
          DestVar = "CurrentHealth",
          OwnerVar = "Owner",
          Function = GetHealth,
          PARType = PAR_MANA
        }
      },
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
          Src1Var = "MaxHealth",
          Src2Var = "CurrentHealth",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "MissingHealth",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "BasePercent",
          SrcValueByLevel = {
            0.04,
            0.05,
            0.06,
            0.07,
            0.08
          }
        }
      },
      {
        Function = BBGetStat,
        Params = {
          Stat = GetFlatMagicDamageMod,
          TargetVar = "Attacker",
          DestVar = "BaseAP"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "BaseAP",
          Src1Value = 0,
          Src2Value = 0.35,
          DestVar = "FlatAPBonus",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "MissingHealth",
          Src2Var = "BasePercent",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "BonusDamage",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "BaseMagic",
          Src2Var = "BonusDamage",
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
          Src2Var = "FlatAPBonus",
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
          Src1Value = 0,
          Src2Value = 6,
          DestVar = "TotalDamage",
          MathOp = MO_DIVIDE
        }
      },
      {
        Function = BBIf,
        Params = {Src1Var = "Owner", CompareOp = CO_IS_NOT_HERO},
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "TotalDamage",
              Src1Value = 0,
              Src2Value = 50,
              DestVar = "TotalDamage",
              MathOp = MO_MIN
            }
          }
        }
      },
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          CallForHelpAttackerVar = "Attacker",
          TargetVar = "Owner",
          Damage = 0,
          DamageVar = "TotalDamage",
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_PROC,
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
SelfExecuteBuildingBlocks = {
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "FizzSeastoneTridentActive",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 1,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "fizzseastonetridentactive"
    }
  }
}
