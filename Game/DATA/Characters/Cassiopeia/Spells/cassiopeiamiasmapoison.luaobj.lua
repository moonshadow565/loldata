BuffTextureName = "Cassiopeia_Miasma.dds"
BuffName = "CassiopeiaMiasma"
AutoBuffActivateEffect = "Global_Poison.troy"
AutoBuffActivateAttachBoneName = "C_BUFFBONE_GLB_HEAD_LOC"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "cassiopeiapoisonparticlemanager"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "cassiopeiapoisontickerlockout"
    }
  }
}
