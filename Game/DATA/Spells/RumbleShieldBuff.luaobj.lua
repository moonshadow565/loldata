BuffTextureName = "Rumble_Scrap Shield2.dds"
BuffName = "RumbleShieldBuff"
AutoBuffActivateEffect = "rumble_shield_speed_buf.troy"
AutoBuffActivateAttachBoneName = "Robot_Root"
AutoBuffActivateEffect2 = "rumble_shield_speed_buf_booster.troy"
AutoBuffActivateAttachBoneName2 = "BUFFBONE_CSTM_BOOSTER"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "SpeedBoost",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMovementSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "SpeedBoost",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
