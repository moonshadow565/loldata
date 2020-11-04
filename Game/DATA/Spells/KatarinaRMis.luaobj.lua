NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
SpellDamageRatio = 1
IsDeathRecapSource = true
SpellFXOverrideSkins = {
  "XmasKatarina"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "katarinaqmarkspellshieldcheck"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "katarina_deathlotus_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "grievouswound"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "internal_50ms"
    }
  }
}
