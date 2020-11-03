NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "Armsmaster_Empower.dds"
BuffName = "BladeRogue_BrewPoison"
AutoBuffActivateEffect = "Global_Poison.troy"
AutoBuffActivateAttachBoneName = ""
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "talonshadowassaultbuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "talonshadowassaultmisone"
    }
  }
}
