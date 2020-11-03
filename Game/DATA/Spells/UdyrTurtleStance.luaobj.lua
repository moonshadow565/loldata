NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "Udyr_TurtleStance.dds"
BuffName = "UdyrTurtleStance"
SpellToggleSlot = 2
PersistsThroughDeath = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {Name = "udyrturtle"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "turtlepelt.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "turtlestance.troy"
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
      Name = "udyrphoenixstance"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "udyrturtleactivation"
    }
  }
}
