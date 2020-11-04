NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "Summoner_haste.dds"
BuffName = "ItemHorn"
AutoBuffActivateEffect = "TEMP_itemhorn_buff.troy"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "howlingabyssporocooldown"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "itemporosnackgrow"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "itemporosnackgrowtest"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "howlingabyssporoaction"
    }
  }
}
