NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Aatrox_R.dds"
BuffName = "AatroxR"
AutoBuffActivateEffect = "Aatrox_Base_RModel.troy"
AutoBuffActivateEffect2 = "Aatrox_Base_R_Decal.troy"
AutoBuffActivateAttachBoneName2 = "Spine2"
NonDispellable = true
SpellFXOverrideSkins = {
  "AatroxSkin01",
  "AatroxSkin02"
}
SpellVOOverrideSkins = {
  "AatroxSkin02"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "aatrox_base_r_activate.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "aatrox_base_r_active_hit_tar.troy"
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
      Name = "aatrox_base_r_aura_self.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "aatrox_skin02_r_foot_01.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "aatrox_skin02_l_foot_01.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "aatrox_skin02_r_engine_01.troy"
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
