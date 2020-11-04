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
    Function = BBPreloadSpell,
    Params = {Name = "riftwalk"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "temp_kassadin_r.troy"
    }
  }
}
