BuffTextureName = "Sona_SongofDiscord.dds"
BuffName = "SonaEHasteSelf"
AutoBuffActivateEffect = "Global_Haste.troy"
SpellFXOverrideSkins = {"PaxSona"}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "sona_base_e_zone.troy"
    }
  },
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
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sonaehastetracker"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "sonaehaste"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sonaehasteself"
    }
  }
}
