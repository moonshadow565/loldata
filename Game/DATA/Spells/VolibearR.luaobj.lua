NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Minotaur_Pulverize.dds"
BuffName = "VolibearR"
AutoBuffActivateEffect = ""
SpellDamageRatio = 0.75
PopupMessage1 = "game_floatingtext_Knockup"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "volibearrapplicator"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "volibearrchargetracker"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "volibearpassiveheal"
    }
  }
}
