NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Wolfman_SeverArmor.dds"
SpellVOOverrideSkins = {
  "HyenaWarwick"
}
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "hungeringstrikefire_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "hungeringstrike_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "globaldrain"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "meditate_eff.troy"
    }
  }
}
