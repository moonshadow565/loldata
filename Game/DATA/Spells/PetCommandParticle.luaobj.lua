NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
BuffTextureName = "27.dds"
BuffName = "PetCommanded"
SpellDamageRatio = 0.5
IsPetDurationBuff = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "generic_pet_indicator.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "generic_pet_indicator_attack_tower.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "generic_pet_indicator_attack.troy"
    }
  }
}
