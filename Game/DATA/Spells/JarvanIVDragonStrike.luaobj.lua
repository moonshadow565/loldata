NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
CastTime = 0.4
BuffTextureName = "JarvanIV_DragonStrike.dds"
SpellFXOverrideSkins = {
  "LubuJarvanIV"
}
SpellVOOverrideSkins = {
  "LubuJarvanIV"
}
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jarvanivdragonstrikedebuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jarvanivdragonstrikeph"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jarvanivdragonstrikesound"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "caitlyn_peacemaker_tar_02.troy"
    }
  }
}
