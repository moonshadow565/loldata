NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "Garen_Passive.dds"
BuffName = "GarenPassiveHeal"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "garenpassivecooldown"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "garen_base_p_heal.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  }
}
