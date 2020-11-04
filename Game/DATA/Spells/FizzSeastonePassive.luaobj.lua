NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "FizzSeastoneActive.dds"
BuffName = "FizzSeastoneActive"
AutoBuffActivateEffect = "Fizz_SeastonePassive_Weapon.troy"
AutoBuffActivateAttachBoneName = "BUFFBONE_CSTM_WEAPON_1"
AutoBuffActivateEffect2 = "Fizz_SeastonePassive.troy"
AutoBuffActivateAttachBoneName2 = "Chest"
SpellToggleSlot = 2
SpellFXOverrideSkins = {"FizzSkin04"}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "internal_50ms"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "grievouswound"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "fizz_seastoneactive_hit_sound.troy"
    }
  }
}
