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
      Name = "itemglacialspikeenemy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "item_trueice_hit.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  }
}
