BuffTextureName = "Pirate_RaiseMorale.dds"
BuffName = "RaiseMoraleTeamBuff"
AutoBuffActivateEffect = "pirate_attack_buf_01.troy"
AutoBuffActivateAttachBoneName = "L_Buffbone_Glb_Hand_Loc"
AutoBuffActivateEffect2 = "pirate_attack_buf_01.troy"
AutoBuffActivateAttachBoneName2 = "R_Buffbone_Glb_Hand_Loc"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "raisemorale"
    }
  }
}
