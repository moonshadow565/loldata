BuffTextureName = "3050_Rallying_Banner.dds"
BuffName = "Stark's Fervor Aura"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rallyingbannerauraself"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rallyingbanneraurafriend"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "rallyingbanner_itm.troy"
    }
  }
}
