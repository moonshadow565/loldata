NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
BuffTextureName = "Lich_Defile.dds"
BuffName = "Defile"
AutoBuffActivateEffect = "Defile_glow.troy"
AutoBuffActivateAttachBoneName = "L_weapon"
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
SpellToggleSlot = 3
PersistsThroughDeath = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "defile_green_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "defile_red_cas.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "deathdefiedbuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "defile"}
  }
}
