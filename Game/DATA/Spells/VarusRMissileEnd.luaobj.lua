NotSingleTargetSpell = false
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
BuffTextureName = "FallenAngel_DarkBinding.dds"
BuffName = "Dark Binding"
AutoBuffActivateEffect = ""
AutoBuffActivateEffect2 = ""
PopupMessage1 = "game_floatingtext_Snared"
SpellFXOverrideSkins = {
  "CyberEzreal"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "varusrrootend"
    }
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
  }
}
