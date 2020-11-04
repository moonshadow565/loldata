NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
AutoBuffActivateEffect = "Graves_ClusterShot_cas.troy"
AutoBuffActivateAttachBoneName = "BUFFBONE_CSTM_WEAPONA"
AutoCooldownByLevel = {
  20,
  16,
  12,
  8,
  4
}
SpellFXOverrideSkins = {
  "GravesSkin05"
}
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "gravesclustershotsoundmissile"
    }
  }
}
