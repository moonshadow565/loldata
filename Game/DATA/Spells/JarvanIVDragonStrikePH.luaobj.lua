NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
AutoBuffActivateEffect = "JarvanQuick_buf.troy"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jarvanivdragonstrikebehindme"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "slashbeenhit"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "bloodslash.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jarvanivdragonstrikeph2"
    }
  }
}
