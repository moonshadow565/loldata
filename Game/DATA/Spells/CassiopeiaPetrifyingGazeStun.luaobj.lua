NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Cassiopeia_PetrifyingGaze.dds"
BuffName = "Stun"
AutoBuffActivateEffect = "LOC_Stun.troy"
AutoBuffActivateAttachBoneName = "C_BUFFBONE_GLB_HEAD_LOC"
SpellDamageRatio = 1
PopupMessage1 = "game_floatingtext_Stunned"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "turntostone.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "turntostonejade.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "casspetrifymiss_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "turnback.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "turnbackjade.troy"
    }
  }
}
