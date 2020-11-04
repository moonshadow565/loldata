NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Garen_KeepingthePeace.dds"
BuffName = "GarenBladestorm"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "garen_bladestorm_cas_02.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "garen_weapon_glow_01.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "garenbladestorm"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "garen_bladestormcrit_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "garen_keeper0fpeace_tar_01.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "garenbladestormleave"
    }
  }
}
