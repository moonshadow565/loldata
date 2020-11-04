NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = false
BuffTextureName = "RengarQReg.dds"
BuffName = "RengarQEmp"
AutoBuffActivateEffect = "Rengar_Base_Q_Buf_Blade.troy"
AutoBuffActivateAttachBoneName = "Weapon"
AutoBuffActivateEffect2 = "Rengar_Base_Q_Buf_Claw.troy"
AutoBuffActivateAttachBoneName2 = "L_Buffbone_Glb_Hand_Loc"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "rengar_base_q_max_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rengarqbuffbonus"
    }
  }
}
