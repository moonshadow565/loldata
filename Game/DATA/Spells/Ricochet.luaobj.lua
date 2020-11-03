NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Sivir_Ricochet.dds"
BuffName = "Ricochet"
AutoBuffActivateEffect = "SivirRicochetBuff.troy"
AutoBuffActivateAttachBoneName = "weapon"
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "ricochet"}
  }
}
