NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "Summoner_haste.dds"
BuffName = "ItemHorn"
AutoBuffActivateEffect = "TEMP_itemhorn_buff.troy"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "itemhorncounter"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "itemhorn"}
  }
}
