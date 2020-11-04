NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
SpellDamageRatio = 1
IsDeathRecapSource = true
PersistsThroughDeath = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {Name = "testcube"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "akali_smoke_bomb_tar_team_green.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "akali_smoke_bomb_tar_team_red.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "akaliwdebuff"
    }
  }
}
