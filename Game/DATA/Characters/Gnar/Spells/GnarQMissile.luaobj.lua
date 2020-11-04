NotSingleTargetSpell = false
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
    Function = BBPreloadParticle,
    Params = {
      Name = "gnar_base_q_target.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "gnar_base_q_target_all.troy"
    }
  },
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
  }
}
