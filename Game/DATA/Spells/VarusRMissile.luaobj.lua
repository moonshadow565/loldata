NotSingleTargetSpell = false
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
BuffTextureName = "FallenAngel_DarkBinding.dds"
BuffName = "Dark Binding"
PopupMessage1 = "game_floatingtext_Snared"
SpellFXOverrideSkins = {
  "CyberEzreal"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "varusrroot"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "varusrspellshieldcheck"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "varusrspellshieldcheck2"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "varusrmissile"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "varusrimmune"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "testcuberender10vision"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "varusrmissileend"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "expirationtimer"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "varuswdetonate"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "varusrhitflash.troy"
    }
  }
}
