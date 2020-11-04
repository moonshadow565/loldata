NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "SwainNevermove.dds"
BuffName = "SwainShadowGraspRoot"
PopupMessage1 = "game_floatingtext_Snared"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "swainmetamorphism"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "swainshadowgrasproottemp.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "swain_shadowgrasp_magic.troy"
    }
  }
}
