NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Sivir_E.dds"
BuffName = "Spell Shield"
AutoBuffActivateEffect = "Sivir_Base_E_shield.troy"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "sivir_base_e_proc.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "sivir_base_e_manaback.troy"
    }
  }
}
