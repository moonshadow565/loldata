NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
AutoBuffActivateEffect2 = "Stun_glb.troy"
AutoBuffActivateAttachBoneName2 = "C_BUFFBONE_GLB_HEAD_LOC"
SpellDamageRatio = 0.5
PopupMessage1 = "game_floatingtext_Stunned"
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "jinx_r_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "jinx_q_rocket_tar_unit.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "jinx_r_booster.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  }
}
