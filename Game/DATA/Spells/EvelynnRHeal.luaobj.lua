NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Evelynn_Drink.dds"
BuffName = "EvelynnWSlow"
AutoBuffActivateEffect = "Global_Slow.troy"
AutoCooldownByLevel = {
  0,
  0,
  0,
  0,
  0
}
SpellFXOverrideSkins = {
  "BloodkingVladimir"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "evelynnrshield"
    }
  }
}
