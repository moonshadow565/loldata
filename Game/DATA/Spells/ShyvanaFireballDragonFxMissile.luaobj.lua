NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
IsDamagingSpell = true
SpellDamageRatio = 1
PopupMessage1 = "game_floatingtext_Slowed"
SpellFXOverrideSkins = {
  "FrostShyvana"
}
TriggersSpellCasts = false
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "shyvanafireballdragonfxmissile"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "shyvanafireballparticle"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "shyvanafireballmissile"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "shyvanafireballmissileminion"
    }
  }
}
