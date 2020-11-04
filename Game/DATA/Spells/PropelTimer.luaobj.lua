NonDispellable = true
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBForEachUnitInTargetAreaRandom,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 1000,
      Flags = "AffectEnemies AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      MaximumUnitsToPick = 1,
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBGetRandomPointInAreaUnit,
        Params = {
          TargetVar = "Unit",
          Radius = 100,
          InnerRadius = 25,
          ResultVar = "PropelPos"
        }
      },
      {
        Function = BBGetTeamID,
        Params = {TargetVar = "Owner", DestVar = "TeamID"}
      },
      {
        Function = BBSpawnMinion,
        Params = {
          Name = "DontSeeThisPlease",
          Skin = "SpellBook1",
          AiScript = "idle.lua",
          PosVar = "PropelPos",
          Team = TEAM_NEUTRAL,
          Stunned = false,
          Rooted = true,
          Silenced = false,
          Invulnerable = true,
          MagicImmune = false,
          IgnoreCollision = false,
          Placemarker = true,
          VisibilitySize = 0,
          DestVar = "Other1",
          GoldRedirectTargetVar = "Nothing"
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Other1",
          AttackerVar = "Owner",
          BuffName = "PropelSpellCaster",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_CombatEnchancer,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 2.1,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Other1",
          PosVar = "PropelPos",
          EffectName = "PropelBubbles.troy",
          Flags = 0,
          EffectIDVar = "EffectToRemove",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_NEUTRAL,
          FOWVisibilityRadius = 600,
          SendIfOnScreenOrDiscard = true
        }
      }
    }
  },
  {
    Function = BBForNClosestUnitsInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 800,
      Flags = "AffectEnemies AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      MaximumUnitsToPick = 1,
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBFaceDirection,
        Params = {TargetVar = "Owner", LocationVar = "Unit"}
      },
      {
        Function = BBSpellCast,
        Params = {
          CasterVar = "Owner",
          TargetVar = "Unit",
          PosVar = "Owner",
          EndPosVar = "Owner",
          OverrideCastPosition = false,
          SlotNumber = 3,
          SlotType = SpellSlots,
          OverrideForceLevel = 1,
          OverrideCoolDownCheck = false,
          FireWithoutCasting = false,
          UseAutoAttackSpell = false,
          ForceCastingOrChannelling = false
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {Name = "spellbook1"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "propelspellcaster"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "propelbubbles.troy"
    }
  }
}
