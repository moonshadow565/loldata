BuffTextureName = "Jester_DeathWard.dds"
BuffName = "Poisoned"
AutoBuffActivateEffect = "Global_Poison.troy"
AutoBuffActivateAttachBoneName = "head"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "DamagePerTick",
      RequiredVarTable = "InstanceVars"
    }
  }
}
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
          Damage = 0,
          DamageVar = "DamagePerTick",
          DamageVarTable = "InstanceVars",
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_PERIODIC,
          PercentOfAttack = 1,
          SpellDamageRatio = 0.3
        }
      }
    }
  }
}
