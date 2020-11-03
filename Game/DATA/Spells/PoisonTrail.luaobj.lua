NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "ChemicalMan_AcidSpray.dds"
BuffName = "Poison Trail"
SpellToggleSlot = 1
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {Name = "testcube"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "acidtrail_buf.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "acidtrail_buf_red.troy"
    }
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
