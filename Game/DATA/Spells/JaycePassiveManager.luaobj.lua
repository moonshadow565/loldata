NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = false
CastTime = 0.115
BuffName = "ApolloPassive"
PersistsThroughDeath = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jaycepassivebuild"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jaycepassivewaittimer"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "apollo_charged_hit.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "jayce_charged_hit.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jaycepassiveready"
    }
  }
}
