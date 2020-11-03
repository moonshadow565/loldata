NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "3057_Sheen.dds"
BuffName = "Sheen"
SpellVOOverrideSkins = {"BroOlaf"}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "oriannaball"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "oriana_izuna_nova.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "orianaizunadamage"
    }
  }
}
