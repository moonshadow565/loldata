NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
ChannelDuration = 2.5
BuffTextureName = "AlZahar_NetherGrasp.dds"
BuffName = "AlZaharNetherGrasp"
AutoBuffActivateEffect2 = "AlZaharNetherGrasp_tar.troy"
AutoBuffActivateAttachBoneName2 = "root"
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "alzaharsummonvoidling"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "alzaharvoidlingcount"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "alzaharnethergraspsound"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "alzaharnethergrasp_beam.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "alzaharnethergrasp"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "suppression"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "alzaharnethergraspsoftlock"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "alzaharnethergraspon"
    }
  }
}
