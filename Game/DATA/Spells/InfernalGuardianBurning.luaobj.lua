DoesntTriggerSpellCasts = true
BuffTextureName = "Annie_GuardianIncinerate.dds"
BuffName = "Infernal Guardian"
AutoBuffActivateEffect = ""
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "sunfirecape_aura_frost.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "sunfirecapeaura_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "infernalguardiantimer"
    }
  }
}
