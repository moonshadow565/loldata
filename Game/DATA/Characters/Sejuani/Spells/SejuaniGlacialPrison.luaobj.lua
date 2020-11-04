NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Sejuani_GlacialPrison.dds"
BuffName = "SejuaniGlacialPrison"
AutoBuffActivateEffect = "Stun_glb.troy"
AutoBuffActivateAttachBoneName = "head"
PopupMessage1 = "game_floatingtext_Stunned"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "sejuani_ult_tar_03.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sejuaniglacialprisondetonate"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sejuaniglacialprisoncheck"
    }
  }
}
