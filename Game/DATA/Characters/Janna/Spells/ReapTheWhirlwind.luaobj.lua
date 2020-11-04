NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
ChannelDuration = 3
BuffTextureName = "Janna_ReapTheWhirlwind.dds"
BuffName = "Reap The Whirlwind"
SpellFXOverrideSkins = {
  "JannaForecast"
}
SpellVOOverrideSkins = {
  "JannaForecast"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "reapthewhirlwind_green_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "reapthewhirlwind_red_cas.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "moveaway"}
  }
}
