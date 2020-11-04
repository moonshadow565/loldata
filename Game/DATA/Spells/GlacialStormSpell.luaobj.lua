NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
AutoBuffActivateEffect = "RunePrison_tar.troy"
SpellFXOverrideSkins = {
  "BlackIceAnivia"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "cryo_storm.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "chilled"}
  }
}
