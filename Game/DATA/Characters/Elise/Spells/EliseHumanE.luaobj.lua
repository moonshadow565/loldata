NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "EliseHumanE.dds"
BuffName = "BuffEliseCocoon"
AutoBuffActivateEffect = "Stun_glb.troy"
AutoBuffActivateAttachBoneName = "head"
PopupMessage1 = "game_floatingtext_Stunned"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "elise_human_e_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "elise_human_e_tar2.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "elisespiderlingsready"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "elisespiderlingsheal"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "elisermidshift"
    }
  }
}
