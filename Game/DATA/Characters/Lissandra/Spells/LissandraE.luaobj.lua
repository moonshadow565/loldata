NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Lissandra_E.dds"
BuffName = "LissandraE"
SpellToggleSlot = 3
SpellFXOverrideSkins = {
  "Lissandra_skin01"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "lissandra_e_end.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "lissandra_e_cast.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "lissandra_e_teleport.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "lissandra_e_skin_flash.troy "
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "lissandraebuffer"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "lissandra_e_departure.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "lissandra_e_arrival.troy"
    }
  }
}
