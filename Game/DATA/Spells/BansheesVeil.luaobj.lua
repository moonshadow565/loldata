NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "066_Sindoran_Shielding_Amulet.dds"
BuffName = "BansheesVeil"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "spelleffect_proc.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "bansheesveil_buf_tempxerath.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "bansheesveil_buf.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "itembansheesveilregen"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "bansheesveiltimer"
    }
  }
}
