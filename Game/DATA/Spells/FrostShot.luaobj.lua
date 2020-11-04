NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "Bowmaster_IceArrow.dds"
BuffName = "Frost Shot"
AutoBuffActivateEffect = "iceSparkle.troy"
AutoBuffActivateAttachBoneName = "Bow_04"
AutoBuffActivateEffect2 = "iceSparkle.troy"
AutoBuffActivateAttachBoneName2 = "Bow_02"
AutoBuffActivateEffect3 = "iceSparkle.troy"
AutoBuffActivateAttachBoneName3 = "Bow_03"
AutoBuffActivateEffect4 = "iceSparkle.troy"
AutoBuffActivateAttachBoneName4 = "Bow_05"
SpellToggleSlot = 1
PersistsThroughDeath = true
NonDispellable = true
TriggersSpellCasts = false
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "frostarrowapplicator"
    }
  }
}
