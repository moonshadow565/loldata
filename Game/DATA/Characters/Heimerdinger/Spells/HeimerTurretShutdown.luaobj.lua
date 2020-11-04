BuffTextureName = "Voidwalker_Spellseal.dds"
BuffName = "Silence"
AutoBuffActivateEffect = "Heimer_TurretShutdown.troy"
PopupMessage1 = "game_floatingtext_Silenced"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "heimer_rocket_charge_01.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "heimerdingerengineaudio"
    }
  }
}
