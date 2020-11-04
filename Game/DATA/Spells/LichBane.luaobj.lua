BuffTextureName = "126_Zeal_and_Sheen.dds"
BuffName = "LichBane"
AutoBuffActivateEffect = "purplehands_buf.troy"
AutoBuffActivateAttachBoneName = "L_Buffbone_Glb_Hand_Loc"
AutoBuffActivateEffect2 = "purplehands_buf.troy"
AutoBuffActivateAttachBoneName2 = "R_Buffbone_Glb_Hand_Loc"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "globalhit_physical.troy"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {Name = "testcube"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "itemfrozenfistfield"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "expirationtimer"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "sheendelay"}
  }
}
