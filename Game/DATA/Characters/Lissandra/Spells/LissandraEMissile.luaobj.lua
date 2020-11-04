NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Cryophoenix_FrigidOrb.dds"
BuffName = "Flash Frost"
SpellToggleSlot = 1
SpellFXOverrideSkins = {
  "Lissandra_skin01"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "lissandraedamage"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "lissandra_deadwood_e_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "lissandra_base_e_tar.troy"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {Name = "testcube"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "lissandra_e_trail.troy"
    }
  }
}
