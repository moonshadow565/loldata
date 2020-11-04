BuffTextureName = "MissFortune_ImpureShots.dds"
BuffName = "MissFortuneViciousStrikes"
AutoBuffActivateEffect = ""
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "missfortune_viciousshots_attack_buf.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "internal_50ms"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "grievouswound"
    }
  }
}
