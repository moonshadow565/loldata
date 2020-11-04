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
  "SyndraJusticar",
  "SyndraSkin02"
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
      Name = "syndra_base_w_lv5_heldtarget_buf_01.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "syndra_base_w_lv5_tether.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "syndra_base_w_heldtarget_buf_01_large.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "syndra_base_w_lv5_heldtarget_buf_02_large.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "syndra_base_w_lv5_heldtarget_buf_02.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "syndra_base_w_heldtarget_buf_01.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "syndra_base_w_tether.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "syndra_base_w_heldtarget_buf_02_large.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "syndra_base_w_heldtarget_buf_02.troy"
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
