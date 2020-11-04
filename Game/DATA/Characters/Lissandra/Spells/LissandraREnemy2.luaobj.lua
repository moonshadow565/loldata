NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
BuffTextureName = "Lissandra_R.dds"
BuffName = "LissandraR"
AutoBuffActivateEffect = "LOC_Stun.troy"
AutoBuffActivateAttachBoneName = "C_BUFFBONE_GLB_HEAD_LOC"
SpellDamageRatio = 1
PopupMessage1 = "game_floatingtext_Stunned"
SpellFXOverrideSkins = {
  "Lissandra_skin01"
}
SpellVOOverrideSkins = {
  "ZombieBrand"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "Lissandra_Base_R_stun.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "Lissandra_Base_R_stun_Shatter.troy"
    }
  }
}
