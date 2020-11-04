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
    Function = BBPreloadSpell,
    Params = {
      Name = "itemglacialspikeenemyslow"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "glacialspike_buf.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "temp_itemglacialspikeenemy_nova.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "temp_trueicehit.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "itemglacialspikeslow"
    }
  }
}
