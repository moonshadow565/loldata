NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "ShyvanaScorchedEarth.dds"
BuffName = "ShyvanaScorchedEarthDragon"
AutoBuffActivateEffect = "Shyvana_Frost_Dragon_W_Burnout.troy"
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
      Name = "shyvana_scorchedearth_unit_tar_shadow.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "shyvana_w_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "shyvanaimmolatedragon"
    }
  }
}
