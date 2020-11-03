DoesntBreakShields = true
CastingBreaksStealth = false
BuffTextureName = "ShyvanaTwinBite.dds"
BuffName = "ShyvanaDoubleAttackDragon"
AutoBuffActivateEffect = "shyvana_doubleAttack_buf.troy"
AutoBuffActivateAttachBoneName = "R_Hand"
AutoBuffActivateEffect2 = "shyvana_doubleAttack_buf.troy"
AutoBuffActivateAttachBoneName2 = "L_Hand"
IsDeathRecapSource = true
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "shyvana_flamebreath_reignite.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "shyvana_doubleattack_tar.troy"
    }
  }
}
