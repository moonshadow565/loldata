NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
IsDamagingSpell = true
SpellDamageRatio = 1
PopupMessage1 = "game_floatingtext_Slowed"
TriggersSpellCasts = false
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "missfortuneplaceholder"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "missfortunebulletholder"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "missfortune_bullettime_tar.troy"
    }
  }
}
