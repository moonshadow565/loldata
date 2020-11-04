DoesntBreakShields = false
BuffTextureName = "AlZahar_MaleficVisions.dds"
BuffName = "AlZaharMaleficVisions"
AutoBuffActivateEffect = "AlzaharMaleficVisions_tar.troy"
AutoBuffActivateAttachBoneName = "C_Buffbone_Glb_Head_Loc"
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
      Name = "alzaharsummonvoidling"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "alzaharvoidlingcount"
    }
  }
}
