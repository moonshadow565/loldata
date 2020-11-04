NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Voidwalker_Riftwalk.dds"
BuffName = "RiftWalk"
AutoBuffActivateEvent = ""
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "riftwalk_flashback.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "riftwalkdamage"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "riftwalk"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "riftwalk_flash.troy"
    }
  }
}
