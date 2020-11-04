BuffTextureName = "Sona_SongofDiscord.dds"
BuffName = "SonaEZone"
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
    Function = BBPreloadSpell,
    Params = {Name = "sonaehaste"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sonaehastetracker"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "sonaezone"}
  }
}
