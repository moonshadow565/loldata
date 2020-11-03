NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "ShyvanaScorchedEarth.dds"
BuffName = "ShyvanaScorchedEarthDragon"
AutoBuffActivateEffect = "shyvana_scorchedEarth_dragon_01.troy"
AutoBuffActivateEffect2 = "shyvana_scorchedEarth_speed.troy"
AutoBuffActivateAttachBoneName2 = ""
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
    Function = BBPreloadSpell,
    Params = {
      Name = "shyvanaimmolatedragon"
    }
  }
}
