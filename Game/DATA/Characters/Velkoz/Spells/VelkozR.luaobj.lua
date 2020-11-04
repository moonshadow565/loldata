NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Velkoz_R.dds"
BuffName = "VelkozR"
AutoCooldownByLevel = {
  12,
  11,
  10,
  9,
  8
}
SpellFXOverrideSkins = {
  "VelkozSkin01"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "testcuberender10vision"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "velkoz_base_r_beam.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "velkoz_base_r_beam_end.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "velkoz_base_r_lensbeam.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "velkoz_base_r_beam_eye.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "velkoz_base_r_lens.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "velkozrhitcounter"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "velkozrdamagestack"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "velkozrdamageticker"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "velkozrhitparticle"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "velkozresearchapply"
    }
  }
}
