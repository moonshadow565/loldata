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
    Function = BBPreloadParticle,
    Params = {
      Name = "jayce_charged_hit_skn1.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "jayce_charged_hit.troy"
    }
  }
}
