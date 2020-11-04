NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Velkoz_E.dds"
BuffName = "VelkozEStun"
AutoBuffActivateEffect = "LOC_Stun.troy"
AutoBuffActivateAttachBoneName = "C_BUFFBONE_GLB_CENTER_LOC"
PopupMessage1 = "game_floatingtext_Stunned"
SpellFXOverrideSkins = {
  "VelkozSkin01"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "velkoz_base_e_stun_tar.troy"
    }
  }
}
