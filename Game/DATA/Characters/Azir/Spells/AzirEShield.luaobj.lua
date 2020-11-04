NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Azir_E.dds"
BuffName = "AzirEShield"
SpellFXOverrideSkins = {"AzirSkin01"}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "azir_skin01_e_shield.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "azir_base_e_shield.troy"
    }
  }
}
