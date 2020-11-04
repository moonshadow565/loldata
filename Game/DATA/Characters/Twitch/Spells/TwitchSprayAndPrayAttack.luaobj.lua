NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
AutoBuffActivateEffect = "Twitch_Base_R_Weapon_Glow.troy"
AutoBuffActivateEffect2 = "Twitch_Base_R_Weapon_Glow.troy"
AutoBuffActivateAttachBoneName2 = "r_bow"
AutoBuffActivateEffect3 = "Twitch_Base_R_Weapon_Glow.troy"
AutoBuffActivateAttachBoneName3 = "L_bow"
AutoBuffActivateEffect4 = "Twitch_Base_R_Buff.troy"
AutoBuffActivateAttachBoneName4 = "c_buffbone_glb_layout_loc"
SpellFXOverrideSkins = {
  "GangsterTwitch",
  "PunkTwitch"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "twitch_base_r_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "twitch_gangster_sprayandpray_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "twitch_punk_sprayandpray_tar.troy"
    }
  }
}
