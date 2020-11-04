NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "Caitlyn_YordleSnapTrap.dds"
BuffName = "NikoDreamCatcher"
AutoBuffActivateEffect2 = "caitlyn_yordleTrap_set.troy"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "Braum_trampoline_timer.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "Braumtrampolinearming"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "Braum_trampoline_idle_green.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "Braum_trampoline_idle_red.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "Braumtrampoline_ground_drawing.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "Braum_trampoline_ring.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "Braum_trampoline_trigger_sound.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "Braumtrampolinemove"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "Braumtrampoline"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "Braumtrampoline"
    }
  }
}
