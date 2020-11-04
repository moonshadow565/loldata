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
  "AatroxSkin01"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "Aatrox_Base_Q_Tar_Green.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "Aatrox_Base_Q_Tar_Red.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "Aatrox_Base_Q_Cast.troy"
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
