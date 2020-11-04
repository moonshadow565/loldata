NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Renekton_SliceAndDice.dds"
BuffName = "RenekthonSliceAndDice"
AutoBuffActivateEffect = "Global_Haste.troy"
AutoBuffActivateAttachBoneName = "lhnd"
AutoBuffActivateEffect2 = "Global_Haste.troy"
AutoBuffActivateAttachBoneName2 = "rhnd"
IsDeathRecapSource = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "renektontargetsliced"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "renektonsliceanddicedelay"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "renektonbloodsplattertarget"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "renektonsliceanddicedebuff"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "renektonslicedice_buf_rage.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "renektonslicedice_buf.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "renektonsliceanddicetimer"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "renektonsliceanddice"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "renektonunlockanimationattack"
    }
  }
}
