NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "Twitch_Ambush.dds"
BuffName = "Hide"
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
    Function = BBPreloadParticle,
    Params = {
      Name = "twitch_base_q_invisible.troy"
    }
  }
}
