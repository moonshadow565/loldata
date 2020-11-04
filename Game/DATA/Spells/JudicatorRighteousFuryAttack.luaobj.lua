NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBGetTotalAttackDamage,
    Params = {TargetVar = "Owner", DestVar = "TAD"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DamagePercent",
      SrcValueByLevel = {
        0.2,
        0.25,
        0.3,
        0.35,
        0.4
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "TAD",
      Src2Var = "DamagePercent",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "CleaveDamage",
      MathOp = MO_MULTIPLY
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
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Owner",
      DestVar = "AbilityPower"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BonusDamage",
      SrcValueByLevel = {
        8,
        14,
        20,
        26,
        32
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "AbilityPower",
      Src1Value = 0.25,
      Src2Value = 0,
      DestVar = "AbilityPower",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BonusDamage",
      Src2Var = "AbilityPower",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "DamageToApply",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "CleaveDamage",
      Src2Var = "DamageToApply",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "DamageToApply",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Owner",
      TargetVar = "Target",
      Damage = 0,
      DamageVar = "BaseDamage",
      DamageType = PHYSICAL_DAMAGE,
      SourceDamageType = DAMAGESOURCE_ATTACK,
      PercentOfAttack = 1,
      SpellDamageRatio = 0,
      PhysicalDamageRatio = 1,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Target",
      Range = 200,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes AffectTurrets ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Owner",
          TargetVar = "Unit",
          Damage = 0,
          DamageVar = "DamageToApply",
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
