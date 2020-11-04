NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Fiora_Parry.dds"
BuffName = "FioraRiposte"
AutoBuffActivateEffect = "Fiora_Parry_buf.troy"
AutoBuffActivateAttachBoneName = "Weapon"
AutoBuffActivateEffect2 = "Fiora_Parry_buf2.troy"
AutoBuffActivateAttachBoneName2 = "Sword_b"
AutoBuffActivateEffect3 = "Fiora_Parry_buf3.troy"
AutoBuffActivateAttachBoneName3 = "C_BUFFBONE_GLB_CENTER_LOC"
PersistsThroughDeath = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "fiora_parry_block_sound.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "fioraripostemissile"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "fiora_parry_block.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "fiorariposte"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "unlockanimation"
    }
  }
}
