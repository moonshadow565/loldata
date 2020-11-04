NotSingleTargetSpell = false
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
BuffTextureName = "KogMaw_VoidOoze.dds"
BuffName = "EzrealEssenceFluxDebuff"
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "kogmawvoidooze_green.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "kogmawvoidooze_red.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "kogmawvoidoozeslow"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "kogmawvoidoozemissile"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "kogmawvoidooze_tar.troy"
    }
  }
}
