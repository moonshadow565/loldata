NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = false
BuffTextureName = "OriannaPowerDagger.dds"
BuffName = "OrianaSpellSword"
IsDeathRecapSource = true
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "orianavacuumindicator_ally.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "orianavacuumindicatorselfnoring.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "orianavacuumindicatorselfring.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "orianavacuumindicator.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "orianapowerdagger"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "orianapowerdaggerdisplay"
    }
  }
}
