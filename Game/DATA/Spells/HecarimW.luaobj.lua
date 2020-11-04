NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Hecarim_SpiritofDread.dds"
BuffName = "HecarimW"
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "hecarim_defile.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "hecarim_defile_red.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "hecarimdefilelifeleech"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "hecarimdefilelifeleechminion"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "hecarim_w_cas.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "hecarimw"}
  }
}
