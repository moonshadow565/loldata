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
    Function = BBPreloadSpell,
    Params = {Name = "stun"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "alistartrample"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "pulverize_cas.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "pulverize"}
  }
}
