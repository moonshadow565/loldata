NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "BlindMonkR.dds"
BuffName = "BlindMonkDragonsRage"
AutoBuffActivateEffect = "blindMonk_R_self_mis.troy"
IsDeathRecapSource = true
PopupMessage1 = "game_floatingtext_Knockup"
ChainMissileParameters = {
  MaximumHits = {
    4,
    4,
    4,
    4,
    4
  },
  CanHitCaster = 0,
  CanHitSameTarget = 0,
  CanHitSameTargetConsecutively = 0,
  CanHitEnemies = 1,
  CanHitFriends = 0
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "blindmonkrmarker"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "blind_monk_ult_unit_impact.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "blindmonkrdamage"
    }
  }
}
