BuffTextureName = "Blitzcrank_ManaBarrier.dds"
BuffName = "ManaBarrierIcon"
PersistsThroughDeath = true
NonDispellable = true
OnPreDamagePriority = 8
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "manabarrier"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "manabarriercooldown"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "steamgolemshield_hit.troy"
    }
  }
}
