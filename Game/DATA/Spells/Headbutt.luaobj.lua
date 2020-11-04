NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Minotaur_Headbutt.dds"
BuffName = "Charging"
SpellDamageRatio = 1
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {Name = "testcube"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "alistarheadbuttmarker"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "expirationtimer"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "alistartrample"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "headbutt"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "headbutttarget"
    }
  }
}
