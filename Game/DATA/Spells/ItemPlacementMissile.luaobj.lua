NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "FallenAngel_DarkBinding.dds"
BuffName = "Dark Binding"
AutoBuffActivateEffect = "DarkBinding_tar.troy"
AutoBuffActivateEffect2 = ""
PopupMessage1 = "game_floatingtext_Snared"
TargetExecuteBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Target",
      AttackerVar = "Owner",
      BuffName = "ItemPlacementMissile"
    },
    SubBlocks = {
      {
        Function = BBDestroyMissile,
        Params = {
          MissileIDVar = "MissileNetworkID"
        }
      }
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Target",
      EffectName = "ItemPlacement_tar.troy",
      Flags = 0,
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "itemplacementmissile"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "itemplacement_tar.troy"
    }
  }
}
