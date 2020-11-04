NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Gnar_Passive.dds"
AutoCooldownByLevel = {
  20,
  18,
  16,
  14,
  12
}
SpellFXOverrideSkins = {
  "RocketTristana"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "gnar_base_transform_warning_red.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "gnar_base_transform_warning_white.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "gnar_base_p_eyes_white.troy "
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "gnar_base_transform_warning_blue.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "gnar_skin01_transform_warning_white.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "gnar_skin01_p_eyes_white.troy "
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "gnar_base_p_eye_glow.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "gnarbigq"}
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "gnarbigw"}
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "gnarbige"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "gnartransform"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "gnarq"}
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "gnarw"}
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "gnare"}
  }
}
