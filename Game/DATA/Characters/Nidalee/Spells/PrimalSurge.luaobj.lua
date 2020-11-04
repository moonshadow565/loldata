NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "Nidalee_E1.dds"
BuffName = "PrimalSurge"
AutoBuffActivateEffect3 = "Nidalee_Base_E_Buf.troy"
AutoBuffActivateAttachBoneName3 = "L_BUFFBONE_GLB_HAND_LOC"
AutoBuffActivateEffect4 = "Nidalee_Base_E_Buf.troy"
AutoBuffActivateAttachBoneName4 = "R_BUFFBONE_GLB_HAND_LOC"
SpellFXOverrideSkins = {
  "HeadhunterNidalee"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nidalee_base_e_tar.troy"
    }
  }
}
