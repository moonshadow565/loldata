NotSingleTargetSpell = false
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
BuffTextureName = "Ezreal_EssenceFlux.dds"
BuffName = "MaokaiTrunkLineMissile"
IsDeathRecapSource = true
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "threshe"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "threshestun"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "thresh_e_hit_sound.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "ezreal_essenceflux_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "powerballhit.troy"
    }
  }
}
