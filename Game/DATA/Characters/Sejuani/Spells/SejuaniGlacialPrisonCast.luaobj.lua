NotSingleTargetSpell = false
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
BuffTextureName = "Sejuani_GlacialPrison.dds"
BuffName = "Glacial Prison Start"
PopupMessage1 = "game_floatingtext_Snared"
PersistsThroughDeath = true
SpellFXOverrideSkins = {
  "SejuaniSkin04"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sejuaniglacialprison"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sejuaniglacialprisoncheck"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "sejuani_r_tar_stun.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "sejuani_r_tar_slow.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sejuaniglacialprisonslow"
    }
  }
}
