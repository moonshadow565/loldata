NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
BuffTextureName = "Lich_Defile.dds"
BuffName = "Defile"
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
