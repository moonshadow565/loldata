NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Nasus_SiphoningStrike.dds"
BuffName = "SiphoningStrike"
AutoBuffActivateEffect = "nassus_siphonStrike_buf.troy"
AutoBuffActivateAttachBoneName = "buffbone_cstm_weapon_1"
IsDeathRecapSource = true
SpellFXOverrideSkins = {
  "NasusSkin05"
}
SpellVOOverrideSkins = {
  "NasusSkin05"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nasus_skin05_q_hit.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nasus_skin05_q_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nasus_base_q_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "siphoningstrike"
    }
  }
}
