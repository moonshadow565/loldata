NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "3092_Kages_Last_Breath.dds"
BuffName = "ItemGlacialSpike"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "itemglacialspike"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "glacialspike_buf.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "frostarrow"}
  }
}
