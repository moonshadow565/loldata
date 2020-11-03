NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
BuffTextureName = "DrMundo_InfectedCleaver.dds"
BuffName = "InfectedCleaverDebuff"
SpellDamageRatio = 1
SpellFXOverrideSkins = {"MundoMundo"}
TriggersSpellCasts = false
PopupMessage1 = "game_floatingtext_Slowed"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "global_slow.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "dr_mundo_infected_cleaver_tar.troy"
    }
  }
}
