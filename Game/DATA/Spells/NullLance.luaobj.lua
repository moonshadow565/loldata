NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Averdrian_AstralBeam.dds"
BuffName = "NullLance"
AutoBuffActivateEffect = "Null_Lance_buf.troy"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "kassadin_base_q_shieldon.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "kassadin_base_q_shield.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "nulllance"}
  }
}
