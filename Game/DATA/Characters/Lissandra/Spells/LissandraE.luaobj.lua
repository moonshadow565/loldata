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
      Name = "Lissandra_Base_E_End.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "Lissandra_Base_E_Cast.troy"
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
      Name = "Lissandra_Base_E_Skin_Flash.troy "
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
      Name = "Lissandra_Base_E_Departure.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "Lissandra_Base_E_Arrival.troy"
    }
  }
}
