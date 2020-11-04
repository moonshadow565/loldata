NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Armsmaster_Disarm.dds"
BuffName = "CounterStrike"
SelfExecuteBuildingBlocks = {
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Counterstrike_cas.troy",
      Flags = 0,
      EffectIDVar = "AddPart",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false
    }
  },
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "CounterStrikeCanCast"
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      TargetVar = "Target",
      DamageByLevel = {
        80,
        100,
        120,
        140,
        160
      },
      Damage = 0,
      DamageType = MAGIC_DAMAGE,
      SourceDamageType = DAMAGESOURCE_SPELLAOE,
      PercentOfAttack = 1,
      SpellDamageRatio = 0.8,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  },
  {
    Function = BBApplyStun,
    Params = {
      AttackerVar = "Attacker",
      TargetVar = "Target",
      Duration = 1
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "counterstrike_cas.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "counterstrikecancast"
    }
  }
}
