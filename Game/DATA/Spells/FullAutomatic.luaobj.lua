NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "Twitch_Clone.dds"
BuffName = "Full Automatic"
AutoBuffActivateEffect = "twitch_ambush_buf.troy"
AutoBuffActivateAttachBoneName = "R_hand"
AutoBuffActivateEffect2 = "twitch_ambush_buf.troy"
AutoBuffActivateAttachBoneName2 = "L_hand"
AutoBuffActivateEffect3 = "twitch_ambush_buf_02.troy"
AutoCooldownByLevel = {
  90,
  75,
  60
}
SpellFXOverrideSkins = {
  "GangsterTwitch",
  "PunkTwitch"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "twitchsprayandpray"
    }
  }
}
