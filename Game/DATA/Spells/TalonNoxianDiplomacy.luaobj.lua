NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = false
BuffTextureName = "Armsmaster_Empower.dds"
BuffName = "TalonNoxianDiplomacy"
IsDeathRecapSource = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "talonbleeddebuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "talonnoxiandiplomacybuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "talonnoxiandiplomacy"
    }
  }
}
