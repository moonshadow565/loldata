NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
SpellDamageRatio = 1
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Owner",
      DestVar = "ap"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "ap",
      Src1Value = 3.0E-4,
      Src2Value = 0,
      DestVar = "apMod",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "apMod",
      Src1Value = 0.25,
      Src2Value = 0,
      DestVar = "percentBurn",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBGetManaOrHealth,
    Params = {
      DestVar = "curHealth",
      OwnerVar = "Target",
      Function = GetHealth
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "percentBurn",
      Src2Var = "curHealth",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "damageToDeal",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      TargetVar = "Target",
      Damage = 0,
      DamageVar = "damageToDeal",
      DamageType = MAGIC_DAMAGE,
      SourceDamageType = DAMAGESOURCE_SPELL,
      PercentOfAttack = 1,
      SpellDamageRatio = 0,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  }
}
