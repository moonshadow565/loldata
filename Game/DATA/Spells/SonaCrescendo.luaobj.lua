NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Sona_Crescendo.dds"
BuffName = "SonaCrescendo"
AutoBuffActivateEffect2 = "Stun_glb.troy"
AutoBuffActivateAttachBoneName2 = "head"
PopupMessage1 = "game_floatingtext_Stunned"
SpellFXOverrideSkins = {"GuqinSona", "PaxSona"}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "sonacrescendo_buf.troy"
    }
  }
}
