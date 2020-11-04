NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Nasus_SiphoningStrike.dds"
BuffName = "SiphoningStrike"
AutoBuffActivateEffect = "nassus_siphonStrike_buf.troy"
AutoBuffActivateAttachBoneName = "weapon_b"
IsDeathRecapSource = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nassus_siphonstrike_beam_buf.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nassus_siphonstrike_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "siphoningstrike"
    }
  }
}
