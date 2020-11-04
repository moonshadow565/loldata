NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Kassadin_ForcePulse.dds"
BuffName = "ForcePulse"
TargetExecuteBuildingBlocks = {
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
    Function = BBIfNotHasBuff,
    Params = {
      OwnerVar = "Target",
      CasterVar = "Attacker",
      BuffName = "GravesChargeShotShot"
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "BaseDmg",
          SrcValueByLevel = {
            150,
            300,
            450
          }
        }
      },
      {
        Function = BBGetTotalAttackDamage,
        Params = {TargetVar = "Attacker", DestVar = "TotalAD"}
      },
      {
        Function = BBGetStat,
        Params = {
          Stat = GetBaseAttackDamage,
          TargetVar = "Attacker",
          DestVar = "BaseAD"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "TotalAD",
          Src2Var = "BaseAD",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "BonusAD",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "BonusAD",
          Src1Value = 0,
          Src2Value = 1,
          DestVar = "BonusAD",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "BonusAD",
          Src2Var = "BaseDmg",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "BaseDmg",
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
          DamageVar = "BaseDmg",
          DamageType = PHYSICAL_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELLAOE,
          PercentOfAttack = 1,
          SpellDamageRatio = 0,
          PhysicalDamageRatio = 0,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      },
      {
        Function = BBIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_HERO},
        SubBlocks = {
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Attacker",
              AttackerVar = "Attacker",
              BuffName = "GravesPassiveGrit",
              BuffAddType = BUFF_STACKS_AND_RENEWS,
              StacksExclusive = true,
              BuffType = BUFF_CombatEnchancer,
              MaxStack = 0,
              MaxStackVar = "PassiveMaxStacks",
              MaxStackVarTable = "CharVars",
              NumberOfStacks = 1,
              Duration = 0,
              BuffVarsTable = "NextBuffVars",
              DurationVar = "PassiveDuration",
              DurationVarTable = "CharVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          }
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "gravespassivegrit"
    }
  }
}
