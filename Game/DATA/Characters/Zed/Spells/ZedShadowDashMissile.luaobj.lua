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
    Function = BBPreloadCharacter,
    Params = {Name = "zedshadow"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "zedwshadowbuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "zedwcloneactive"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "zed_stormninja_w_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "zed_w_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "zedpbaoe"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "zed_e_cas.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "zedshurikenmistwo"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "zedshadowdashmissile"
    }
  }
}
