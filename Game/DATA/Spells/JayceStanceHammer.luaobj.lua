NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "Jayce_TransformHammer.dds"
BuffName = "JayceStanceHammer"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jaycetotheskies"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jaycestaticfield"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jaycethunderingblow"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jaycestancehtg"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "jayce_stance_melee.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jaycepassivemeleeattack"
    }
  }
}
