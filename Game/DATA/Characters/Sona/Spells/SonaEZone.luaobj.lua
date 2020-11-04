BuffTextureName = "Sona_E.dds"
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
    Function = BBPreloadParticle,
    Params = {
      Name = "sona_base_e_zone_self.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "sonaehaste"}
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "sonaezone"}
  }
}
