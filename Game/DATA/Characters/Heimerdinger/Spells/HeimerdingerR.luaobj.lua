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
      Name = "heimerdingere_ult"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "heimerdingerqult"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "heimerdingere"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "heimerdingerq"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "heimerdinger_r_cast.troy"
    }
  }
}
