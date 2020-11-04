NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "Udyr_TigerStance.dds"
BuffName = "UdyrTigerStance"
SpellToggleSlot = 1
PersistsThroughDeath = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {Name = "udyrtiger"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "tigerpelt.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "udyrtigerpunchbleed"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "udyrtigerpunch"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "udyrtigershred"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "tigerstance.troy"
    }
  }
}
