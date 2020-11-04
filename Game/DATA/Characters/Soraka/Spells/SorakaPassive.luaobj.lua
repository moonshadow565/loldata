BuffTextureName = "Soraka_Passive.dds"
BuffName = "SorakaPassive"
AutoBuffActivateEffect = "soraka_base_passive_speed.troy"
SpellFXOverrideSkins = {
  "SorakaSkin04"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sorakapassivefalloff"
    }
  }
}
