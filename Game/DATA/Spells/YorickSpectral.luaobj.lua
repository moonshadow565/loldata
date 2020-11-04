DoesntBreakShields = true
BuffTextureName = "YorickOmenOfWarPreHit.dds"
BuffName = "YorickSpectralPreHit"
AutoBuffActivateEffect = "yorick_spectralGhoul_attack_buf_self.troy"
AutoBuffActivateAttachBoneName = "l_hand"
AutoBuffActivateEffect2 = "yorick_spectralGhoul_attack_buf_self.troy"
AutoBuffActivateAttachBoneName2 = "r_hand"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "yorick_spectralghoul_attack_buf_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "yorickspectralprimarytarget"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "yorickspectralunlock"
    }
  }
}
