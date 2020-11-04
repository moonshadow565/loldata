NotSingleTargetSpell = false
DoesntBreakShields = False
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Vayne_Condemn.dds"
BuffName = "VayneCondemn"
TriggersSpellCasts = true
PopupMessage1 = "game_floatingtext_Knockup"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "vayne_e_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "vayne_e_terrain_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "vayne_w_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "vaynesilvereddebuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "vaynecondemnmissile"
    }
  }
}
