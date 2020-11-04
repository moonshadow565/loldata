NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "Nasus_W.dds"
BuffName = "NasusW"
AutoBuffActivateEffect = "GLOBAL_SLOW.TROY"
PopupMessage1 = "game_floatingtext_Slowed"
SpellFXOverrideSkins = {
  "NasusSkin05"
}
SpellVOOverrideSkins = {
  "NasusSkin05"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nasus_skin05_w_buf.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nasus_skin05_w_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nasus_base_w_tar.troy"
    }
  }
}
