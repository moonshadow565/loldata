NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Destiny_temp.dds"
BuffName = "Destiny"
AutoBuffActivateEffect = "DestinyEye.troy"
SpellDamageRatio = 0.75
AutoCooldownByLevel = {
  150,
  135,
  120
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "rengar_base_r_teamindicator.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "rengar_teamindicatorr.troy"
    }
  }
}
