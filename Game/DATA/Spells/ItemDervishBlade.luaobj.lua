NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = false
IsDamagingSpell = false
BuffTextureName = "3137_Dervish_Blade.dds"
BuffName = "ItemDervishBlade"
AutoBuffActivateEffect = "Item_Mercurial.troy"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "summoner_cast.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "itemdervishblade"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "summoner_boost.troy"
    }
  }
}
