OnBuffActivateBuildingBlocks = {
  {
    Function = BBPlayAnimation,
    Params = {
      AnimationName = "Crit",
      ScaleTime = 0.5,
      TargetVar = "Owner",
      Loop = false,
      Blend = false
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBUnlockAnimation,
    Params = {OwnerVar = "Owner", Blend = true}
  }
}
