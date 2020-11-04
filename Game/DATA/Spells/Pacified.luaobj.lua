BuffTextureName = "Minotaur_TriumphantRoar.dds"
BuffName = "Pacified"
AutoBuffActivateEffect = "Stun_glb.troy"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetPacified
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetPacified
    }
  }
}
