NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "Vladimir_Hemoplague.dds"
BuffName = "VladimirHemoplagueDebuff"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
SpellFXOverrideSkins = {
  "BloodkingVladimir"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "vladhemoplague_bloodking_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "vladhemoplague_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "vladhemoplague_bloodking_proc.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "vladhemoplague_proc.troy"
    }
  }
}
