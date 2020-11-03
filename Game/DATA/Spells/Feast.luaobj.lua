NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "GreenTerror_Feast.dds"
BuffName = "Feast"
PersistsThroughDeath = true
SpellFXOverrideSkins = {
  "DandyChogath"
}
SpellVOOverrideSkins = {
  "DandyChogath"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "chogath_feast_sign.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "feast"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "feast_internal"
    }
  }
}
