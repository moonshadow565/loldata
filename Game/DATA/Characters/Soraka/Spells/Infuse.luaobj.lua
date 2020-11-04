NotSingleTargetSpell = false
BuffTextureName = "Soraka_E.dds"
BuffName = "InfuseWrapper"
IsDeathRecapSource = true
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "soraka_e_beam.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "soraka_infuse_ally_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "soraka_infuse_enemy_tar.troy"
    }
  }
}
