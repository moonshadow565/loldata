NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "SyndraW.dds"
BuffName = "SyndraW"
SpellToggleSlot = 2
PopupMessage1 = "game_floatingtext_Suppressed"
SpellFXOverrideSkins = {
  "SyndraJusticar"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "syndrawcast"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "syndrawbuffer"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "syndrawspellslotsafeguard"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "syndrawtooltip"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "syndrawbuff"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "syndra_w5_tar1.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "syndra_w5_beam.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "syndra_wb5_tar2.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "syndra_w5_tar2.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "syndra_w_tar1.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "syndra_w_beam.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "syndra_wb_tar1.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "syndra_wb_tar2.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "syndra_w_tar2.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "syndraqspell"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "syndrawneutralfix"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "syndraw"}
  }
}
