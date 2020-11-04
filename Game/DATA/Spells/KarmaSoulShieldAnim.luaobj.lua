OnBuffActivateBuildingBlocks = {
  {
    Function = BBPlayAnimation,
    Params = {
      AnimationName = "Spell3",
      ScaleTime = 0,
      TargetVar = "Owner",
      Loop = false,
      Blend = false,
      Lock = false
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBUnlockAnimation,
    Params = {OwnerVar = "Owner", Blend = true}
  }
}
