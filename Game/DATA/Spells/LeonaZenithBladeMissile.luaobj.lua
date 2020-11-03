NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Teemo_TranquilizingShot.dds"
BuffName = "Blind"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
SpellToggleSlot = 1
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "leonazenithbladebufforder"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "leonazenithbladeroot"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "leona_zenithblade_trail.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "leonasunlight"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "leona_zenithblade_sound.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "leona_zenithblade_arrive.troy"
    }
  }
}
