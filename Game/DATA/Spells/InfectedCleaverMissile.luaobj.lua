NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
BuffTextureName = "DrMundo_InfectedCleaver.dds"
BuffName = "InfectedCleaverDebuff"
SpellDamageRatio = 1
PopupMessage1 = "game_floatingtext_Slowed"
SpellFXOverrideSkins = {"MundoMundo"}
TriggersSpellCasts = false
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
      Name = "dr_mundo_tpamundo_infected_cleaver_tar_sound.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "dr_mundo_as_mundo_infected_cleaver_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "dr_mundo_infected_cleaver_tar.troy"
    }
  }
}
