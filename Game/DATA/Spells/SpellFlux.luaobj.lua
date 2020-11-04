NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
SpellDamageRatio = 1
AutoCooldownByLevel = {
  150,
  120,
  90
}
ChainMissileParameters = {
  MaximumHits = {
    6,
    6,
    6
  },
  CanHitCaster = 1,
  CanHitSameTarget = 1,
  CanHitSameTargetConsecutively = 0
}
TriggersSpellCasts = true
TargetExecuteBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "Target",
      Src2Var = "Owner",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIncMana,
        Params = {TargetVar = "Target", Delta = 0}
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
          DamageByLevel = {
            240,
            360,
            480
          },
          Damage = 0,
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_DEFAULT,
          PercentOfAttack = 1,
          SpellDamageRatio = 0.7
        }
      }
    }
  }
}
