BuffTextureName = "Sona_SongofDiscordGold.dds"
BuffName = "SonaSongofDiscordAura"
SpellFXOverrideSkins = {"PaxSona"}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "sonasongofdiscord_aura.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sonasongofdiscordauraself"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sonasongofdiscordaurab"
    }
  }
}
