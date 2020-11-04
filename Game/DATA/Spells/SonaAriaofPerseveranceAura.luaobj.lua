BuffTextureName = "Sona_AriaofPerseveranceGold.dds"
BuffName = "SonaAriaofPerseveranceAura"
SpellFXOverrideSkins = {"PaxSona"}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "sonaariaofper_aura.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sonaariaofperseveranceaurab"
    }
  }
}
