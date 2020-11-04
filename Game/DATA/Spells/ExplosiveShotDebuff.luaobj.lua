BuffTextureName = "Tristana_ExplosiveShot.dds"
BuffName = "Explosive Shot Debuff"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      TargetVar = "Owner",
      Damage = 0,
      DamageVar = "DamageAmount",
      DamageVarTable = "InstanceVars",
      DamageType = MAGIC_DAMAGE,
      SourceDamageType = DAMAGESOURCE_SPELLPERSIST,
      PercentOfAttack = 1,
      SpellDamageRatio = 0.1,
      PhysicalDamageRatio = 1,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "DamageAmount",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      TargetVar = "Owner",
      Damage = 0,
      DamageVar = "DamageAmount",
      DamageVarTable = "InstanceVars",
      DamageType = MAGIC_DAMAGE,
      SourceDamageType = DAMAGESOURCE_SPELLPERSIST,
      PercentOfAttack = 1,
      SpellDamageRatio = 0.1,
      PhysicalDamageRatio = 1,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  }
}
