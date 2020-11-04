BuffTextureName = "Heimerdinger_UPGRADE.dds"
BuffName = "UPGRADESuperCharge"
AutoBuffActivateEffect = "Wujustyle_buf.troy"
AutoBuffActivateAttachBoneName = "weapon"
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentAttackSpeedMod,
      TargetVar = "Owner",
      Delta = 0.5
    }
  }
}
