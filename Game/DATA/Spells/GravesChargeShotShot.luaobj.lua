NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
BuffTextureName = "FallenAngel_DarkBinding.dds"
BuffName = "RapidFire"
AutoBuffActivateEffect = ""
AutoBuffActivateEffect2 = ""
PopupMessage1 = "game_floatingtext_Snared"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {Name = "spellbook1"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "expirationtimer"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "graveschargeshotshot"
    }
  }
}
