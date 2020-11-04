NotSingleTargetSpell = false
DoesntTriggerSpellCasts = true
BuffTextureName = "Heimerdinger_UPGRADE.dds"
BuffName = "UPGRADE!!!"
AutoBuffActivateEffect = "HolyFervor_buf.troy"
SpellToggleSlot = 4
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "ch1concussiongrenade_ult"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "ch1concussiongrenade"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "heimerdinger_r_cast.troy"
    }
  }
}
