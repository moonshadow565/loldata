NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Tristana_BusterShot.dds"
BuffName = "Buster Shot"
SpellDamageRatio = 1
SpellFXOverrideSkins = {
  "RocketTristana"
}
TriggersSpellCasts = true
PopupMessage1 = "game_floatingtext_Knockup"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "tristana_bustershot_unit_impact.troy"
    }
  }
}
