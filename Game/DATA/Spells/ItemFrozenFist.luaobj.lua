BuffTextureName = "3025_Frozen_Fist.dds"
BuffName = "ItemFrozenFist"
AutoBuffActivateEffect = "bluehands_buf.troy"
AutoBuffActivateAttachBoneName = "l_hand"
AutoBuffActivateEffect2 = "bluehands_buf.troy"
AutoBuffActivateAttachBoneName2 = "r_hand"
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
      Name = "expirationtimer"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "sheendelay"}
  }
}
