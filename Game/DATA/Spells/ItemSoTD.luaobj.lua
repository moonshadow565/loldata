NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = true
CastingBreaksStealth = false
IsDamagingSpell = false
BuffTextureName = "3084_Widowmaker.dds"
BuffName = "Lightslicer"
AutoBuffActivateEffect = "sword_of_the_divine_03.troy"
AutoBuffActivateEffect2 = "sword_of_the_divine_02.troy"
AutoBuffActivateAttachBoneName2 = "R_hand"
AutoBuffActivateEffect3 = "sword_of_the_divine_02.troy"
AutoBuffActivateAttachBoneName3 = "L_hand"
AutoBuffActivateEffect4 = "sword_of_the_divine_01.troy"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "itemsotddebuff"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "sword_of_the_divine_03.troy"
    }
  }
}
