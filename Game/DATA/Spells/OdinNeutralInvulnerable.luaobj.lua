NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Judicator_EyeforanEye.dds"
BuffName = "JudicatorIntervention"
AutoBuffActivateEffect = "minatuar_unbreakableWill_cas.troy"
AutoBuffActivateEffect2 = "feroscioushowl_cas2.troy"
AutoCooldownByLevel = {
  90,
  90,
  90,
  90,
  90
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "odinneutralinvulnerable.troy"
    }
  }
}
