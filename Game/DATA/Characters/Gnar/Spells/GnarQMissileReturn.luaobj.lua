NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
BuffTextureName = "FallenAngel_DarkBinding.dds"
BuffName = "Dark Binding"
AutoBuffActivateEffect = "DarkBinding_tar.troy"
PopupMessage1 = "game_floatingtext_Snared"
SpellFXOverrideSkins = {
  "CyberEzreal"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "gnarqslow"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "gnarqmissile"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "gnarwproc"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "gnarwvisual"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "gnarwhit"}
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "gnarwbuff"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "gnar_base_q_hit.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "gnar_base_q_catch_spindown.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "gnar_global_indicator_line_beam.troy"
    }
  }
}
