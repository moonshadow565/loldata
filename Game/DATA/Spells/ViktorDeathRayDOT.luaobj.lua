NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "ViktorDeathRayAUG.dds"
BuffName = "ViktorDeathRayBurning"
AutoBuffActivateEffect = "Viktor_Laserhit.troy"
AutoBuffActivateEffect2 = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "DamageForDot",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBSetBuffCasterUnit,
    Params = {CasterVar = "Caster"}
  },
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
          AttackerVar = "Caster",
          CallForHelpAttackerVar = "Attacker",
          TargetVar = "Owner",
          Damage = 0,
          DamageVar = "DamageForDot",
          DamageVarTable = "InstanceVars",
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELLAOE,
          PercentOfAttack = 1,
          SpellDamageRatio = 0,
          PhysicalDamageRatio = 0,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      }
    }
  }
}
