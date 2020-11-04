NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
BuffTextureName = "Karthus_E.dds"
BuffName = "KarthusDefile"
SpellToggleSlot = 3
PersistsThroughDeath = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "karthus_base_p_defile.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "karthus_base_e_defile.troy"
    }
  }
}
