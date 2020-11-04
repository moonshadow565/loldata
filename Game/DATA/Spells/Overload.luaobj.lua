NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
AutoCooldownByLevel = {
  16,
  14,
  12,
  10,
  8
}
TriggersSpellCasts = true
SetSpellDamageRatio = 1
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetManaOrHealth,
    Params = {
      DestVar = "Mana",
      OwnerVar = "Owner",
      Function = GetMana
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BaseDamage",
      SrcValueByLevel = {
        60,
        110,
        160,
        210,
        260
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Mana",
      Src1Value = 0,
      Src2Value = 0.12,
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
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      TargetVar = "Target",
      Damage = 0,
      DamageVar = "TotalDamage",
      DamageType = MAGIC_DAMAGE,
      SourceDamageType = DAMAGESOURCE_DEFAULT,
      PercentOfAttack = 1,
      SpellDamageRatio = 0.8
    }
  }
}
