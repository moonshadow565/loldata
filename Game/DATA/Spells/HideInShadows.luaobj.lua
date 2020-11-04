NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "Twitch_AlterEgo.dds"
BuffName = "Hide"
SpellToggleSlot = 1
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "hideinshadowsbuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "hideinshadows"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "hideinshadows_internal"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "twitch_invis_cas.troy"
    }
  }
}
