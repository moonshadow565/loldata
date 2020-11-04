NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
AutoBuffActivateEffect = "SwapArrow_green.troy"
AutoBuffActivateEffect2 = ""
PopupMessage1 = "game_floatingtext_Snared"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "testcuberender"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "urgotswapmarker"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "urgotswapmissile"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "urgotswapmissile2"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "expirationtimer"
    }
  }
}
