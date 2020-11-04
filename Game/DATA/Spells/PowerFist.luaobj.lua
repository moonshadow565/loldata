NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Blitzcrank_PowerFist.dds"
BuffName = "PowerFist"
AutoBuffActivateEffect = "Powerfist_buf.troy"
AutoBuffActivateAttachBoneName = "R_hand"
AutoBuffActivateEffect2 = "Powerfist_buf.troy"
AutoBuffActivateAttachBoneName2 = "L_hand"
IsDeathRecapSource = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "powerfistslow"
    }
  }
}
