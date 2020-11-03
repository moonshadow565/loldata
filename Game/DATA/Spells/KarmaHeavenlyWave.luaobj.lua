NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Kassadin_ForcePulse.dds"
BuffName = "ForcePulse"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "karmachakra"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "karma_heavenlywave_unit_tar.troy"
    }
  }
}
