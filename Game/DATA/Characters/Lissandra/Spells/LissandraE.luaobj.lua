NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Lissandra_E.dds"
BuffName = "LissandraE"
SpellToggleSlot = 3
SpellFXOverrideSkins = {
  "Lissandra_skin01",
  "lissandraSkin02"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "lissandra_base_e_end.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "lissandra_base_e_cast.troy"
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
      Name = "lissandra_base_e_skin_flash.troy "
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
      Name = "lissandra_base_e_departure.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "lissandra_base_e_arrival.troy"
    }
  }
}
