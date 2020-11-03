BuffTextureName = "Cryophoenix_Rebirth.dds"
AutoBuffActivateEffect = "LifeAura.troy"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "lifeaura.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "guardianangel_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "hasbeenrevived"
    }
  }
}
