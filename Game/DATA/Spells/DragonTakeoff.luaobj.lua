NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Minotaur_Pulverize.dds"
BuffName = "Pulverize"
SpellDamageRatio = 0.75
PopupMessage1 = "game_floatingtext_Knockup"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "sru_dragon_spawn_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "moveawaycollision"
    }
  }
}
