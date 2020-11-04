BuffTextureName = "Mordekaiser_COTG.dds"
BuffName = "MordekaiserCOTGDot"
OnPreDamagePriority = 10
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "mordekeiser_cotg_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "mordekaisercotgdot"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "mordekaisercotgrevive"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "spellnostackcdreset"
    }
  }
}
