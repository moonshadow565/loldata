NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
AutoBuffActivateEffect = "Graves_ClusterShot_cas.troy"
SpellDamageRatio = 0.5
TriggersSpellCasts = false
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "graves_clustershot_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "gravesclustershotattack"
    }
  }
}
