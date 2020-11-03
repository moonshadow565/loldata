NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Udyr_PhoenixStance.dds"
BuffName = "UdyrPhoenixStance"
SpellToggleSlot = 4
PersistsThroughDeath = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "udyrphoenix"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "phoenixpelt.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "udyrbearstance"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "udyrtigerstance"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "udyrturtlestance"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "phoenixstance.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "udyrphoenixactivation"
    }
  }
}
