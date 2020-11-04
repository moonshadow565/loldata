BuffTextureName = "Udyr_TigerStance.dds"
BuffName = "UdyrTigerPunch"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = "L_Finger"
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = "R_Finger"
AutoBuffActivateAttachBoneName3 = ""
AutoBuffActivateAttachBoneName4 = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "activeAttackSpeed",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentAttackSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "activeAttackSpeed",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
