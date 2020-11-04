NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "Trundle_E.dds"
BuffName = "TrundleCircle"
SpellVOOverrideSkins = {
  "ClassicTrundle"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "trundle_e_plagueblock.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "trundle_e_green.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "trundle_e_red.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "globalwallpush"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "globaldummyknockback"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "trundlewallbounce"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "expirationtimer"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "trundlecircleslow"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "trundlewall"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "trundlecircle"
    }
  }
}
