NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "GemKnight_Radiance.dds"
BuffName = "Radiance"
AutoBuffActivateEffect = "Taric_HammerFlare.troy"
AutoBuffActivateAttachBoneName = "BUFFBONE_CSTM_WEAPON_1"
AutoBuffActivateEffect2 = "Taric_HammerFlare.troy"
AutoBuffActivateAttachBoneName2 = "BUFFBONE_CSTM_WEAPON_2"
AutoBuffActivateEffect3 = "Taric_ShoulderFlare.troy"
AutoBuffActivateAttachBoneName3 = "spine"
SpellToggleSlot = 4
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "taricgemstorm.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "radianceaura"
    }
  }
}
