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
      Name = "zedrcloneswapevfx"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "rallyingbanner_itm.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "zedultshadowmark"
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
      Name = "zed_base_w_tar.troy"
    }
  }
}
