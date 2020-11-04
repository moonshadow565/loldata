DoesntBreakShields = false
DoesntTriggerSpellCasts = true
PersistsThroughDeath = true
NonDispellable = true
BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Target",
      AttackerVar = "Attacker",
      BuffName = "LuxIlluminatingFraulein"
    },
    SubBlocks = {
      {
        Function = BBGetTeamID,
        Params = {TargetVar = "Target", DestVar = "TeamID"}
      },
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          CallForHelpAttackerVar = "Attacker",
          TargetVar = "Target",
          Damage = 0,
          DamageVar = "IlluminateDamage",
          DamageVarTable = "CharVars",
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELLAOE,
          PercentOfAttack = 1,
          SpellDamageRatio = 0,
          PhysicalDamageRatio = 1,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Target",
          EffectName = "LuxPassive_tar.troy",
          Flags = 0,
          EffectIDVar = "MotaExplosion",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWTeamOverrideVar = "TeamID",
          FOWVisibilityRadius = 10,
          SendIfOnScreenOrDiscard = true
        }
      },
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Attacker",
          BuffName = "LuxIlluminatingFraulein"
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "luxilluminatingfraulein"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "luxpassive_tar.troy"
    }
  }
}
