NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = false
IsDamagingSpell = false
BuffTextureName = "Jester_HallucinogenBomb.dds"
BuffName = "Hallucinate"
IsPetDurationBuff = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "hallucinatepoof.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "hallucinate"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "hallucinatefull"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "apbonusdamagetotowers"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "championchampiondelta"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "backstab"}
  }
}
