NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "ShyvanaScorchedEarth.dds"
BuffName = "ShyvanaScorchedEarthDragon"
SpellFXOverrideSkins = {
  "FrostShyvana"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {Name = "testcube"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "shyvanaidapplicator"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "shyvanaiddamage"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "shyvana_frost_dragon_w_burnout.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "shyvanaimmolatedragon"
    }
  }
}
