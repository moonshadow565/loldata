BuffTextureName = "3069_Sword_of_Light_and_Shadow.dds"
BuffName = "Mourning"
AutoBuffActivateEffect = "Global_Mortal_Strike.troy"
AutoBuffActivateAttachBoneName = "head"
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 1,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = true
    },
    SubBlocks = {
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          TargetVar = "Owner",
          Damage = 4,
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_PERIODIC,
          PercentOfAttack = 1,
          SpellDamageRatio = 0,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      }
    }
  }
}
