NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Twitch_Expunge.dds"
BuffName = "ExpungeAttackSpeed"
AutoBuffActivateEffect = "twitch_ambush_buf.troy"
AutoBuffActivateAttachBoneName = "r_hand"
AutoBuffActivateEffect2 = "twitch_ambush_buf.troy"
AutoBuffActivateAttachBoneName2 = "l_hand"
IsDeathRecapSource = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "twitch_base_e_tar.troy"
    }
  }
}
