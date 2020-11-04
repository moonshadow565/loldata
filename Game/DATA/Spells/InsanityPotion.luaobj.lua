NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "ChemicalMan_ChemicalRage.dds"
BuffName = "Insanity Potion"
PersistsThroughDeath = true
NonDispellable = true
SpellFXOverrideSkins = {
  "SingedSkin06"
}
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
