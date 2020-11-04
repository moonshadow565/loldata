BuffTextureName = "Caitlyn_Headshot2.dds"
BuffName = "CaitlynHeadshotReady"
AutoBuffActivateEffect = "caitlyn_headshot_rdy_indicator.troy"
AutoBuffActivateAttachBoneName = "R_BUFFBONE_GLB_HAND_LOC"
AutoBuffActivateEffect2 = "caitlyn_headshot_rdy_indicator.troy"
AutoBuffActivateAttachBoneName2 = "L_BUFFBONE_GLB_HAND_LOC"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "caitlynheadshotcount"
    }
  }
}
