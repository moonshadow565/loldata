NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = false
BuffTextureName = "Evelynn_Drink.dds"
BuffName = "Malice And Spite"
AutoBuffActivateEffect = "evelyn_maliceSpite_buf.troy"
AutoBuffActivateAttachBoneName = "l_hand"
AutoBuffActivateEffect2 = "evelyn_maliceSpite_buf.troy"
AutoBuffActivateAttachBoneName2 = "r_hand"
AutoBuffActivateEffect3 = "evelyn_maliceSpite_speed_buf.troy"
AutoBuffActivateAttachBoneName3 = ""
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "evelynnunlockanimation"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "maliceandspite"
    }
  }
}
