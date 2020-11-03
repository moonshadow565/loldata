NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Shen_VorpalBlade.dds"
BuffName = "Shen Vorpal Star"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "shen_life_tap_tar_02.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "shenvorpalstarheal"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "shen_vorpalstar_tar.troy"
    }
  }
}
