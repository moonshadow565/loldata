NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "Olaf_R.dds"
BuffName = "OlafRagnarok"
AutoBuffActivateEffect3 = "olaf_ragnorok_buff.troy"
AutoBuffActivateAttachBoneName3 = "L_BUFFBONE_GLB_HAND_LOC"
AutoBuffActivateEffect4 = "olaf_ragnorok_buff.troy"
AutoBuffActivateAttachBoneName4 = "R_BUFFBONE_GLB_HAND_LOC"
AutoCooldownByLevel = {
  120,
  120,
  120
}
SpellVOOverrideSkins = {"BroOlaf"}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "olaf_ragnorok_enraged.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "olafragnarokpassivebuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "olafragnarok"
    }
  }
}
