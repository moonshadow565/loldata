NotSingleTargetSpell = false
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
SpellFXOverrideSkins = {
  "LucianSkin01"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "lucianwdebuff"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "lucian_w_blowup.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "lucian_skin01_w_blowup.troy"
    }
  }
}
