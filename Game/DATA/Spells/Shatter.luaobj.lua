NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "GemKnight_Shatter.dds"
BuffName = "Shatter"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "shatter_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "bloodslash.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "shatter_nova.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "shatter"}
  }
}
