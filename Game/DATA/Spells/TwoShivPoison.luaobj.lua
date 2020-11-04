NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Jester_IncrediblyPrecise.dds"
BuffName = "Two Shiv Poison"
AutoBuffActivateEffect = "global_slow.troy"
PopupMessage1 = "game_floatingtext_Slowed"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "castfrombehind"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "twoshivpoison"
    }
  }
}
