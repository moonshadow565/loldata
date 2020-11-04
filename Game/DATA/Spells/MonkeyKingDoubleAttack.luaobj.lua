DoesntBreakShields = true
CastingBreaksStealth = false
BuffTextureName = "MonkeyKingCrushingBlow.dds"
BuffName = "MonkeyKingDoubleAttack"
AutoBuffActivateEffect = "monkey_king_crushingBlow_buf_self.troy"
AutoBuffActivateAttachBoneName = "weapon_a_bend3"
AutoBuffActivateEffect2 = "monkey_king_crushingBlow_buf_self.troy"
AutoBuffActivateAttachBoneName2 = "weapon_b_bend3"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "xenziou_battle_cry_weapon_01.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "monkey_king_crushingblow_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "monkeykingdoubleattack"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "monkeykingdoubleattackdebuff"
    }
  }
}
