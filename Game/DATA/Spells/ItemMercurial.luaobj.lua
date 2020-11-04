NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = false
IsDamagingSpell = false
BuffTextureName = "3139_Mercurial_Scimitar.dds"
BuffName = "ItemMercurial"
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
      Name = "itemmercurial"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "summoner_boost.troy"
    }
  }
}
