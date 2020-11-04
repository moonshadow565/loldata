NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Nocturne_ShroudofDarkness.dds"
BuffName = "FioraRiposte"
AutoBuffActivateEffect = "Fiora_Parry_buf.troy"
AutoBuffActivateAttachBoneName = "Weapon"
AutoBuffActivateEffect2 = "Fiora_Parry_buf2.troy"
AutoBuffActivateAttachBoneName2 = "Sword_b"
AutoBuffActivateEffect3 = "Fiora_Parry_buf3.troy"
AutoBuffActivateAttachBoneName3 = "C_BUFFBONE_GLB_CENTER_LOC"
AutoBuffActivateEffect4 = ""
AutoBuffActivateAttachBoneName4 = ""
PersistsThroughDeath = true
PreLoadBuildingBlocks = {
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
