BuffTextureName = "Heimerdinger_TechmaturgicalRepairBots.dds"
BuffName = "HeimerPassive"
AutoBuffActivateEffect = "Powerfist_buf.troy"
AutoBuffActivateAttachBoneName = "head"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "heimerdingerscraprelic.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "expirationtimer"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "infuse_tar.troy"
    }
  }
}
