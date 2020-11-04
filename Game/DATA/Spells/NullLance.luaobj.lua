NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Averdrian_AstralBeam.dds"
BuffName = "NullLance"
AutoBuffActivateEffect = "Null_Lance_buf.troy"
AutoBuffActivateAttachBoneName = ""
TargetExecuteBuildingBlocks = {
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      CallForHelpAttackerVar = "Attacker",
      TargetVar = "Target",
      DamageByLevel = {
        80,
        130,
        180,
        230,
        280
      },
      Damage = 0,
      DamageType = MAGIC_DAMAGE,
      SourceDamageType = DAMAGESOURCE_SPELL,
      PercentOfAttack = 1,
      SpellDamageRatio = 0.7,
      PhysicalDamageRatio = 1,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  },
  {
    Function = BBApplySilence,
    Params = {
      AttackerVar = "Attacker",
      TargetVar = "Target",
      Duration = 0,
      DurationByLevel = {
        1,
        1.4,
        1.8,
        2.2,
        2.6
      }
    }
  }
}
