NotSingleTargetSpell = false
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
BuffTextureName = "FizzMarinerDoom.dds"
BuffName = "FizzChurnTheWatersCling"
AutoBuffActivateEffect = "Fizz_UltimateMissile_Orbit.troy"
AutoBuffActivateAttachBoneName = "head"
AutoBuffActivateEffect2 = ""
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "fizz_ring_green.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "fizz_ring_red.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "fizzmarinerdoomslow"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "fizzmoveback"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "fizzknockup"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "fizzshark"}
  },
  {
    Function = BBPreloadCharacter,
    Params = {Name = "fizzshark"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "fizz_sharksplash.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "fizz_sharksplash_ground.troy "
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "fizzmarinerdoommissile"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "timebombcountdown"
    }
  }
}
