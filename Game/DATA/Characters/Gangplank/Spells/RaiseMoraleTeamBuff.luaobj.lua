BuffTextureName = "Pirate_RaiseMorale.dds"
BuffName = "RaiseMoraleTeamBuff"
AutoBuffActivateEffect = "pirate_attack_buf_01.troy"
AutoBuffActivateAttachBoneName = "L_Hand"
AutoBuffActivateEffect2 = "pirate_attack_buf_01.troy"
AutoBuffActivateAttachBoneName2 = "R_Hand"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "raisemorale"
    }
  }
}
