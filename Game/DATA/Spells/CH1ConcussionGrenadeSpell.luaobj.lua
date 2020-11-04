NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Cryophoenix_FrigidOrb.dds"
BuffName = ""
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Attacker",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Nothing",
      PosVar = "Target",
      EffectName = "heimerdinger_CH1_grenade_tar.troy",
      Flags = 0,
      EffectIDVar = "arr",
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
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Target",
      Range = 250,
      Flags = "AffectEnemies AffectNeutral AffectBuildings AffectMinions AffectHeroes AffectTurrets ",
      IteratorVar = "Unit"
    },
    SubBlocks = {
      {
        Function = BBBreakSpellShields,
        Params = {TargetVar = "Unit"}
      },
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          TargetVar = "Unit",
          DamageByLevel = {
            80,
            135,
            190,
            245,
            300
          },
          Damage = 0,
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELL,
          PercentOfAttack = 1,
          SpellDamageRatio = 0.7,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Unit",
          PosVar = "Unit",
          EffectName = "heimerdinger_CH1_grenade_unit_tar.troy",
          Flags = 0,
          EffectIDVar = "arr",
          TargetObjectVar = "Unit",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = false
        }
      }
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Target",
      Range = 250,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Unit",
          AttackerVar = "Attacker",
          BuffName = "BlindingDart",
          BuffAddType = BUFF_STACKS_AND_RENEWS,
          BuffType = BUFF_CombatDehancer,
          MaxStack = 1,
          NumberStacks = 1,
          Duration = 0,
          BuffVarsTable = "NextBuffVars",
          DurationByLevel = {
            1.5,
            2,
            2.5,
            3,
            3.5
          },
          TickRate = 0
        }
      }
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Target",
      Range = 125,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit"
    },
    SubBlocks = {
      {
        Function = BBApplyStun,
        Params = {
          AttackerVar = "Attacker",
          TargetVar = "Unit",
          Duration = 1.5
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "heimerdinger_ch1_grenade_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "heimerdinger_ch1_grenade_unit_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "blindingdart"
    }
  }
}
