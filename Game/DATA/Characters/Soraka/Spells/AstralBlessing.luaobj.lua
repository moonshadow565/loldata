NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "Soraka_Bless.dds"
BuffName = "Astral Blessing"
SpellFXOverrideSkins = {
  "ClericSoraka"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "soraka_cleric_astralbless_buf.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "soraka_astralbless_buf.troy"
    }
  }
}
