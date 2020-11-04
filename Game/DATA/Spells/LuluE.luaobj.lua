NotSingleTargetSpell = false
AutoBuffActivateEffect = "Chicken_buf.troy"
AutoBuffActivateAttachBoneName = "C_BUFFBONE_GLB_HEAD_LOC"
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "lulufaerieshield"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "lulufaerieburn"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "luluevision"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "lulu_e_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "lulu_faerie_flash.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "waena_faerie_flash.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "lulufaerieoverride"
    }
  }
}
