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
        6,
        12,
        18,
        24,
        30
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "AbilityPower",
      Src1Value = 0.35,
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
      Src1Var = "DamageToApply",
      Src2Var = "BaseDamage",
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
      DamageVar = "DamageToApply",
      DamageType = PHYSICAL_DAMAGE,
      SourceDamageType = DAMAGESOURCE_ATTACK,
      PercentOfAttack = 1,
      SpellDamageRatio = 0
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Target",
      Range = 200,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes AffectTurrets ",
      IteratorVar = "Unit"
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "Target",
          Src2Var = "Unit",
          CompareOp = CO_NOT_EQUAL
        },
        SubBlocks = {
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Owner",
              TargetVar = "Unit",
              Damage = 0,
              DamageVar = "DamageToApply",
              DamageType = PHYSICAL_DAMAGE,
              SourceDamageType = DAMAGESOURCE_SPELLAOE,
              PercentOfAttack = 0,
              PercentOfAttackByLevel = {
                0.2,
                0.25,
                0.3,
                0.35,
                0.4
              },
              SpellDamageRatio = 0
            }
          }
        }
      }
    }
  }
}
