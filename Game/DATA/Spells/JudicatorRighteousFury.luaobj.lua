NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Judicator_RighteousFury.dds"
BuffName = "JudicatorRighteousFury"
AutoBuffActivateEffect = "Flamesword.troy"
AutoBuffActivateAttachBoneName = "weapon"
AutoBuffActivateEffect2 = "RighteousFuryHalo_buf.troy"
AutoBuffActivateAttachBoneName2 = "head"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "kaylerighteousfuryanim"
    }
  }
}
