NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "FallenAngel_Purgatory.dds"
BuffName = "Soul Shackles"
AutoCooldownByLevel = {
  80,
  80,
  80
}
PopupMessage1 = "game_floatingtext_Slowed"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "morgana_skin06_r_mis.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "morgana_skin06_r_tar_timer.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "soulshackle_beam.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "morgana_blackthorn_soulshackle_buf.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "morgana_blackthorn_soulshackle_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "soulshackle_buf.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "soulshackle_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "morgana_skin06_r_tar_explode.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "morgana_blackthorn_soulshackle_tar_explode.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "soulshackle_tar_explode.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "soulshacklesowner"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "soulshackles"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "slow"}
  }
}
