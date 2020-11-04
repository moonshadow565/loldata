NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "ChemicalMan_AcidSpray.dds"
BuffName = "Poison Trail"
AutoBuffActivateEffect = "AcidTrail_buf.troy"
AutoBuffActivateAttachBoneName = "bag_b"
SpellToggleSlot = 1
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {Name = "testcube"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "poisontrailapplicator"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "poisontrail"
    }
  }
}
