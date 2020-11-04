NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "Aatrox_W1.dds"
BuffName = "AatroxWPower"
SpellToggleSlot = 2
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "aatroxwparticler"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "aatroxwparticle"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "aatroxwonhpowerbuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "aatroxwonhpower"
    }
  }
}
