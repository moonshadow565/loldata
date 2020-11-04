BuffTextureName = "3068_Sunfire_Cape.dds"
BuffName = "Sunfire Cape Aura"
AutoBuffActivateEffect = "SunfireCapeAura_tar.troy"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "DamageAmount",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      TargetVar = "Owner",
      Damage = 0,
      DamageVar = "DamageAmount",
      DamageVarTable = "InstanceVars",
      DamageType = MAGIC_DAMAGE,
      SourceDamageType = DAMAGESOURCE_PERIODIC,
      PercentOfAttack = 1,
      SpellDamageRatio = 0
    }
  }
}
