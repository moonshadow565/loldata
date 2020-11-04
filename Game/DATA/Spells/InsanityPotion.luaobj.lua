NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "ChemicalMan_ChemicalRage.dds"
BuffName = "Insanity Potion"
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "insanitypotion_buf.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "insanitypotion_steam.troy"
    }
  }
}
