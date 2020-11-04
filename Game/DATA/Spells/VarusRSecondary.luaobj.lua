NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "VarusR.dds"
BuffName = "VarusRShackles"
AutoBuffActivateEffect = ""
AutoBuffActivateEffect2 = ""
AutoCooldownByLevel = {
  80,
  80,
  80
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "varus_r_secondary_beam.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "varus_r_tendriltarget.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "varusrspellshieldcheck"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "varusrspellshieldcheck2"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "varusrroot"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "varusrimmune"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "varusrsecondary"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "varuswdetonate"
    }
  }
}
