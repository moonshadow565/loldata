NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
BuffTextureName = "Soraka_Starcall.dds"
BuffName = "RumbleGrenadeDebuff"
AutoBuffActivateEffect = ""
AutoBuffActivateEffect2 = ""
PopupMessage1 = "game_floatingtext_Snared"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rumblegrenadedz"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rumblegrenadedebuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rumblegrenadezapeffect"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rumblegrenadeslow"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "rumble_taze_tar.troy"
    }
  }
}
