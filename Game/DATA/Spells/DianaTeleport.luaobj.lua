NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Voidwalker_Riftwalk.dds"
BuffName = "RiftWalk"
AutoBuffActivateEvent = ""
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "diana_r_end.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "dianateleportmarker"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "globalhit_mana.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "temp_diana_lance_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "diana_r_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "diana_r_teleport_success_valkyrie.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "diana_r_teleport_success.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "dianaarccatch"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "diana_r_tar_valkyrie.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "diana_r_tar.troy"
    }
  }
}
