NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Averdrian_AstralBeam.dds"
BuffName = "WrathoftheAncients"
AutoBuffActivateEffect = "MouthFoam.troy"
AutoBuffActivateAttachBoneName = "R_jaw"
AutoBuffActivateEffect2 = "MouthFoam.troy"
AutoBuffActivateAttachBoneName2 = "L_jaw"
SpellDamageRatio = 0.35
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "wrathdamage"
    }
  }
}
