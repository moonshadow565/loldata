BuffTextureName = "Sona_SongofDiscordGold.dds"
BuffName = "SonaEHaste"
AutoBuffActivateEffect = "Global_Haste.troy"
SpellFXOverrideSkins = {"PaxSona"}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "sona_base_e_buff.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "sona_base_e_buff_sfx.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  }
}
