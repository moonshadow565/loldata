NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Minotaur_Pulverize.dds"
BuffName = "Pulverize"
AutoBuffActivateEffect = ""
SpellDamageRatio = 0.75
PopupMessage1 = "game_floatingtext_Knockup"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "alistartrample"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "pulverize"}
  }
}
