NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
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
    Function = BBGetStat,
    Params = {
      Stat = GetBaseAttackDamage,
      TargetVar = "Owner",
      DestVar = "BaseDamage"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Level",
      Value2 = 1,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          TargetVar = "Target",
          Damage = 0,
          DamageVar = "BaseDamage",
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_ATTACK,
          PercentOfAttack = 1,
          SpellDamageRatio = 0.3,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "Level",
      Value2 = 2,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          TargetVar = "Target",
          Damage = 0,
          DamageVar = "BaseDamage",
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_ATTACK,
          PercentOfAttack = 1,
          SpellDamageRatio = 0.4,
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
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          TargetVar = "Target",
          Damage = 0,
          DamageVar = "BaseDamage",
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_ATTACK,
          PercentOfAttack = 1,
          SpellDamageRatio = 0.5,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      }
    }
  }
}
