NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Sona_AriaofPerseveranceGold.dds"
SpellToggleSlot = 4
PersistsThroughDeath = true
SpellFXOverrideSkins = {"GuqinSona"}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sonaariaofperseverance"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sonaariaofperseverancecheck"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "global_heal.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sonaariaofperseveranceaura"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "unlockanimation"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sonaariashield"
    }
  }
}
