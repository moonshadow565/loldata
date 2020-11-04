BuffTextureName = "3084_Widowmaker.dds"
BuffName = "Widowmaker"
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 1,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          TargetVar = "Target",
          Damage = 30,
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_PERIODIC,
          PercentOfAttack = 1,
          SpellDamageRatio = 1
        }
      }
    }
  }
}
