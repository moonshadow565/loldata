NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
BuffTextureName = "MonkeyKingCyclone.dds"
BuffName = "MonkeyKingSpinToWin"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "monkey_king_ult_spin.troy"
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
      Name = "monkeykingspintowin"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "monkey_king_ult_unit_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "monkeykingspinmarkerorder"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "monkey_king_ult_unit_tar_02.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "monkeykingspinknockup"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "monkeykingspinmarkerchaos"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "monkeykingspintowinleave"
    }
  }
}
