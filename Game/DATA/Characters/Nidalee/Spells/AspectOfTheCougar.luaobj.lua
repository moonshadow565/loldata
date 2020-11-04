NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "Nidalee_AspectOfTheCougar.dds"
BuffName = "AspectOfTheCougar"
SpellToggleSlot = 4
PersistsThroughDeath = true
NonDispellable = true
SpellFXOverrideSkins = {
  "HeadhunterNidalee"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "nidalee_cougar"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nidalee_base_r_cas.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "nidaleecougarscent"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "aspectofthehuntress"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "aspectofthecougar"
    }
  }
}
