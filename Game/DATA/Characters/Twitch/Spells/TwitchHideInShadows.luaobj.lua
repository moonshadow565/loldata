NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "Twitch_Q.dds"
BuffName = "TwitchHideInShadows"
AutoBuffActivateEffect2 = "Twitch_Base_Q_Invisible.troy"
SpellToggleSlot = 1
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "globalruncycleoverride"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "globalstealthscreentint"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "twitchhideinshadowsbuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "twitchhideinshadowsinternal"
    }
  }
}
