NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Garen_DecisiveStrike.dds"
BuffName = "GarenSlash"
SpellFXOverrideSkins = {
  "SteellegionGaren"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "garen_descisivestrike_indicator.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "garen_descisivestrike_indicator_02.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "garen_steellegion_decisive_strike_electric.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "garenfastmove"
    }
  }
}
