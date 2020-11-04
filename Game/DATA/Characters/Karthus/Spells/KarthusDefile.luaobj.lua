NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
BuffTextureName = "Karthus_E.dds"
BuffName = "KarthusDefile"
SpellToggleSlot = 3
IsDeathRecapSource = true
PersistsThroughDeath = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "karthus_base_e_tar_hit.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "karthus_base_p_defile.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "karthus_base_p_defile_red.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "karthus_base_e_defile.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "karthus_base_e_defile_red.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "karthus_base_e_defile_cas.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "karthusdefile"
    }
  }
}
