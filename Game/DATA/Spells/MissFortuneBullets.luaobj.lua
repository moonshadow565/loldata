NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = ""
BuffName = ""
SpellDamageRatio = 1
TriggersSpellCasts = false
PopupMessage1 = "game_floatingtext_Slowed"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "missfortunewavehold"
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
