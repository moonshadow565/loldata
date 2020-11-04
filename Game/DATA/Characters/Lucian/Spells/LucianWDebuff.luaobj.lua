NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Lucian_W_debuff.dds"
SpellFXOverrideSkins = {
  "CyberEzreal"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "lucian_w_tar_champ.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "lucian_w_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "lucian_w_mark.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "leona_sunlight.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "lucianwbuff"
    }
  }
}
