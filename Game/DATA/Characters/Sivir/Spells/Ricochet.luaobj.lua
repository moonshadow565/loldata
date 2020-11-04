NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Sivir_Ricochet.dds"
BuffName = "Ricochet"
AutoBuffActivateEffect = "SivirRicochetBuff.troy"
AutoBuffActivateAttachBoneName = "weapon"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "ricochet"}
  }
}
