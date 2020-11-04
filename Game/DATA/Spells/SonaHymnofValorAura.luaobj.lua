BuffTextureName = "Sona_HymnofValorGold.dds"
BuffName = "SonaHymnofValorAura"
SpellFXOverrideSkins = {"PaxSona"}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "sonahymnofvalor_aura.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sonahymnofvaloraurab"
    }
  }
}
