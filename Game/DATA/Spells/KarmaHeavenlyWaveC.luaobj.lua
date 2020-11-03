NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Kassadin_ForcePulse.dds"
BuffName = "ForcePulse"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "karma_heavenlywave_self_heal.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "karma_heavenlywave_ally_heal.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "karma_heavenlywave_unit_tar.troy"
    }
  }
}
