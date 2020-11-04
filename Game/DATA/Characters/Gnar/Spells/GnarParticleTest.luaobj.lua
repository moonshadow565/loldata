NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Tristana_headshot.dds"
BuffName = "Rapid Fire"
AutoBuffActivateEffect = "rapidfire_buf.troy"
AutoBuffActivateAttachBoneName = "weapon"
SpellFXOverrideSkins = {
  "RocketTristana"
}
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "gnarredvfx"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "turntored.troy"
    }
  }
}
