DoesntBreakShields = true
BuffTextureName = "YorickOmenOfWar.dds"
BuffName = "YorickSpectralBuffSelf"
AutoBuffActivateEffect = "yorick_spectralGhoul_speed_buf.troy"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "MovementSpeedPercent",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetGhosted
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetGhosted
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetGhosted
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMovementSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "MovementSpeedPercent",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
