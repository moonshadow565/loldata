NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "DrMundo_BurningAgony.dds"
BuffName = "OdinShrineBombBuff"
AutoCooldownByLevel = {
  120,
  100,
  80,
  10,
  10
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "asc_relic_sand_buf.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "asc_relicprism_sand.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "elixirsight_aura_02.troy"
    }
  }
}
