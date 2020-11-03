NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "Teemo_PoisonedDart.dds"
BuffName = "Toxic Shot"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
SpellFXOverrideSkins = {
  "AstronautTeemo"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "toxicshotapplicator"
    }
  }
}
