NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Aatrox_Q.dds"
BuffName = "AatroxQ"
AutoCooldownByLevel = {
  20,
  18,
  16,
  14,
  12
}
IsDeathRecapSource = true
SpellFXOverrideSkins = {
  "AatroxSkin01",
  "AatroxSkin02"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "aatrox_base_q_tar_green.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "aatrox_base_q_tar_red.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "aatrox_base_q_cast.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "aatroxqanimfix"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "aatroxqdescent"
    }
  }
}
