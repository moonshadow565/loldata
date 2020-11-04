NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Sona_AriaofPerseveranceGold.dds"
SpellToggleSlot = 4
PersistsThroughDeath = true
SpellFXOverrideSkins = {"GuqinSona", "PaxSona"}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "sonaw"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sonawpassivecheck"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "sona_ariaheal_tar.troy"
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
    Params = {Name = "sonawzone"}
  }
}
