NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
SpellVOOverrideSkins = {
  "DandyChogath"
}
PopupMessage1 = "game_floatingtext_Silenced"
TargetExecuteBuildingBlocks = {
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      TargetVar = "Target",
      DamageByLevel = {
        80,
        130,
        180,
        240,
        300
      },
      Damage = 0,
      DamageType = MAGIC_DAMAGE,
      SourceDamageType = DAMAGESOURCE_SPELLAOE,
      PercentOfAttack = 1,
      SpellDamageRatio = 0.7,
      PhysicalDamageRatio = 1,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  },
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_HERO},
    SubBlocks = {
      {
        Function = BBApplySilence,
        Params = {
          AttackerVar = "Attacker",
          TargetVar = "Target",
          Duration = 0,
          DurationByLevel = {
            2,
            2.5,
            3,
            3.5,
            4
          }
        }
      }
    }
  }
}
