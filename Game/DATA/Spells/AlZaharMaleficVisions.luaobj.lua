DoesntBreakShields = false
BuffTextureName = "AlZahar_MaleficVisions.dds"
BuffName = "AlZaharMaleficVisions"
AutoBuffActivateEffect = "AlzaharMaleficVisions_tar.troy"
AutoBuffActivateAttachBoneName = "head"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "alzaharrecentvis"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "alzaharmaleficvisions"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "alzaharvoidlingcount"
    }
  }
}
