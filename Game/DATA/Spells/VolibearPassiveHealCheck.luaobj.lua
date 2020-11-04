BuffTextureName = "Blitzcrank_ManaBarrier.dds"
PersistsThroughDeath = true
NonDispellable = true
OnPreDamagePriority = 8
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "volibearpassiveheal"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "volibearpassivecd"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "steamgolemshield_hit.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "manabarrier"
    }
  }
}
