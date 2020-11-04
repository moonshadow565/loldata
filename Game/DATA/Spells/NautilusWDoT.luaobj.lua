NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "Nautilus_Wrath.dds"
BuffName = "NautilusWDoT"
IsDeathRecapSource = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nautilus_w_dmg_indicator_terranian.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nautilus_w_dmg_indicator_submarine.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nautilus_w_dmg_indicator_astro.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nautilus_w_dmg_indicator_base.troy"
    }
  }
}
