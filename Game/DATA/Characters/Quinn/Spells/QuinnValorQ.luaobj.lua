NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
AutoBuffActivateEffect = "GLOBAL_SLOW.TROY"
PopupMessage1 = "game_floatingtext_Slowed"
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "quin_q_unit_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "quinn_q_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "quinnq"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "quinn_aoe_unit_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "quinnvalor_q_tar.troy"
    }
  }
}
