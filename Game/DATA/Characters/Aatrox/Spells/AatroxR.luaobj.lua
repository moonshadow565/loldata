NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Aatrox_R.dds"
BuffName = "AatroxR"
AutoBuffActivateEffect = "AatroxRModel.troy"
AutoBuffActivateEffect2 = "Aatrox_Skin01_R_decal.troy"
AutoBuffActivateAttachBoneName2 = "Spine2"
NonDispellable = true
SpellFXOverrideSkins = {
  "AatroxSkin01"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "aatrox_r_activate.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "aatrox_r_active_hit_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "aatroxwparticler"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "aatrox_r_aura_self.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "aatroxwparticle"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "aatroxr"}
  }
}
