NotSingleTargetSpell = false
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
BuffTextureName = "FallenAngel_DarkBinding.dds"
BuffName = "Dark Binding"
AutoBuffActivateEffect = "global_Watched.troy"
AutoBuffActivateAttachBoneName = "head"
AutoBuffActivateEffect2 = ""
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
      Name = "varusrimmune"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "varusrsecondary"
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
    Function = BBPreloadParticle,
    Params = {
      Name = "varusrmissileend.troy"
    }
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
    Function = BBPreloadParticle,
    Params = {
      Name = "varusrhit.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "varuswdetonate"
    }
  }
}
