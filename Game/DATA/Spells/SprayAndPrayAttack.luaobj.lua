NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
SpellFXOverrideSkins = {
  "GangsterTwitch",
  "PunkTwitch"
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {
      TargetVar = "Owner",
      DestVar = "TwitchTeamId"
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetBaseAttackDamage,
      TargetVar = "Owner",
      DestVar = "BaseDamage"
    }
  },
  {
    Function = BBGetSkinID,
    Params = {
      UnitVar = "Attacker",
      SkinIDVar = "TwitchSkinID"
    }
  },
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "TwitchSkinID",
          Value2 = 4,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Target",
              EffectName = "twitch_gangster_sprayandPray_tar.troy",
              Flags = 0,
              EffectIDVar = "a",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWTeamOverrideVar = "TwitchTeamId",
              FOWVisibilityRadius = 10,
              SendIfOnScreenOrDiscard = true
            }
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "TwitchSkinID",
          Value2 = 5,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Target",
              EffectName = "twitch_punk_sprayandPray_tar.troy",
              Flags = 0,
              EffectIDVar = "a",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWTeamOverrideVar = "TwitchTeamId",
              FOWVisibilityRadius = 10,
              SendIfOnScreenOrDiscard = true
            }
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Target",
              EffectName = "twitch_sprayandPray_tar.troy",
              Flags = 0,
              EffectIDVar = "a",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWTeamOverrideVar = "TwitchTeamId",
              FOWVisibilityRadius = 10,
              SendIfOnScreenOrDiscard = true
            }
          }
        }
      }
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 3,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Owner",
      CallForHelpAttackerVar = "Owner",
      TargetVar = "Target",
      Damage = 0,
      DamageVar = "BaseDamage",
      DamageType = PHYSICAL_DAMAGE,
      SourceDamageType = DAMAGESOURCE_ATTACK,
      PercentOfAttack = 1,
      SpellDamageRatio = 0,
      PhysicalDamageRatio = 1,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "twitch_gangster_sprayandpray_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "twitch_punk_sprayandpray_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "twitch_sprayandpray_tar.troy"
    }
  }
}
