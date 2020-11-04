NotSingleTargetSpell = false
DoesntTriggerSpellCasts = true
BuffTextureName = "Heimerdinger_UPGRADE.dds"
BuffName = "HeimerdingerR"
AutoBuffActivateEffect = "HolyFervor_buf.troy"
SpellToggleSlot = 4
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "HeimerdingerE_ult"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "HeimerdingerE"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "heimerdinger_r_cast.troy"
    }
  }
}
