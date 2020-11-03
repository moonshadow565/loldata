NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "SwainTorment.dds"
BuffName = "SwainTormentDoT"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "swain_torment_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "swain_torment_marker.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "swain_torment_dot.troy"
    }
  }
}
