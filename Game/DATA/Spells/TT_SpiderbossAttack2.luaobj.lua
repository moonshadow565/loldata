NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Averdrian_AstralBeam.dds"
BuffName = "WrathoftheAncients"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "tt_spider_hit_ground.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "tt_spiderbossattackdebuff"
    }
  }
}
