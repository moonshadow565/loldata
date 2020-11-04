NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Garen_W.dds"
BuffName = "GarenW"
SpellFXOverrideSkins = {
  "SteellegionGaren"
}
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "garen_base_w_avatar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "garen_base_w_shoulder_r.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "garen_base_w_shoulder_l.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "garen_base_w_buff.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "garen_base_w_avatar_fade.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "garen_base_w_cas.troy"
    }
  }
}
