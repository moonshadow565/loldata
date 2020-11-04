NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Renekton_Dominus.dds"
BuffName = "RenekthonTyrantForm"
AutoBuffActivateEffect = "RenektonDominus_sword.troy"
AutoBuffActivateAttachBoneName = "weapon"
AutoBuffActivateEffect2 = "RenektonDominus_aura.troy"
AutoBuffActivateEffect3 = "Renekton_Runewars_Shoulder_R.troy"
AutoBuffActivateAttachBoneName3 = "r_uparm"
AutoBuffActivateEffect4 = "Renekton_Runewars_Shoulder_L.troy"
AutoBuffActivateAttachBoneName4 = "l_uparm"
NonDispellable = true
SpellFXOverrideSkins = {
  "Renekton_VolcanoGod"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "renekton_vg_dominus_idle.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "renektondominus_runewars_transform.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "renektondominus_transform.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "renektondominus_runewars_transform_off.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "renektonincombat"
    }
  }
}
