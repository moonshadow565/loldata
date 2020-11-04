BuffTextureName = "48thSlave_Pacify.dds"
BuffName = "Charm"
AutoBuffActivateEffect = "Charm_tar.troy"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetCharmed
    }
  },
  {
    Function = BBRedirectGold,
    Params = {RedirectSourceVar = "Owner", RedirectTargetVar = "Attacker"}
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetCharmed
    }
  },
  {
    Function = BBRedirectGold,
    Params = {RedirectSourceVar = "Owner", RedirectTargetVar = "Nothing"}
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetCharmed
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentPhysicalDamageMod,
      TargetVar = "Owner",
      Delta = -0.3
    }
  }
}
