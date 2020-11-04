NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Sona_R.dds"
BuffName = "SonaR"
AutoBuffActivateEffect2 = "LOC_Stun.troy"
AutoBuffActivateAttachBoneName2 = "C_Buffbone_Glb_Overhead_Loc"
PopupMessage1 = "game_floatingtext_Stunned"
SpellFXOverrideSkins = {"GuqinSona", "PaxSona"}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "sona_base_r_buf.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "sona_base_r_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "sona_base_r_cas.troy"
    }
  }
}
