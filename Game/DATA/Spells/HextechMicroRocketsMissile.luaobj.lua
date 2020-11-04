NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
SpellDamageRatio = 1
TargetExecuteBuildingBlocks = {
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Owner",
      TargetVar = "Target",
      DamageByLevel = {
        80,
        80,
        80,
        80,
        80
      },
      Damage = 0,
      DamageType = MAGIC_DAMAGE,
      SourceDamageType = DAMAGESOURCE_SPELLAOE,
      PercentOfAttack = 1,
      SpellDamageRatio = 0.2
    }
  }
}
