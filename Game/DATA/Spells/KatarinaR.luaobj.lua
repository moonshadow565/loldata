NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
ChannelDuration = 2.4
SpellFXOverrideSkins = {
  "XmasKatarina"
}
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "katarinarsound"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "katarinar"}
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "testcuberender10vision"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "expirationtimer"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "katarina_deathlotus_success.troy"
    }
  }
}
