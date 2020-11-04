OnBuffActivateBuildingBlocks = {
  {
    Function = BBDebugSay,
    Params = {
      OwnerVar = "Owner",
      ToSay = "Slash Buff On"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBRemoveOverrideAutoAttack,
    Params = {OwnerVar = "Owner", CancelAttack = false}
  }
}
