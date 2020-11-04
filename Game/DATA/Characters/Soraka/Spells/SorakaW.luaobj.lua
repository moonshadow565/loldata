NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "Soraka_W.dds"
BuffName = "Astral Blessing"
SpellFXOverrideSkins = {
  "ClericSoraka",
  "SorakaSkin04"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "soraka_cleric_astralbless_buf.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "penance.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "odin_healthpackheal.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "astralblessing"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "soraka_base_w_buf.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "soraka_base_w_beam.troy"
    }
  }
}
