NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
BuffName = "BlindMonkSafeguard"
AutoBuffActivateEffect = "enrage_buf.troy"
AutoBuffActivateAttachBoneName = "l_hand"
AutoBuffActivateEffect2 = "enrage_buf.troy"
AutoBuffActivateAttachBoneName2 = "r_hand"
AutoCooldownByLevel = {
  22,
  18,
  14,
  10,
  6
}
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetCanMove
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetCanMove
    }
  }
}
