NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Armsmaster_CoupDeGrace.dds"
BuffName = "Relentless Assault"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "armsmasterrelentlesscounter"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "relentlessassaultdebuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "relentlessassaultmarker"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "armsmasterrelentlessmr"
    }
  }
}
