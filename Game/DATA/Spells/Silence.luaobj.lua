BuffTextureName = "Voidwalker_Spellseal.dds"
BuffName = "Silence"
AutoBuffActivateEffect = "Global_Silence.troy"
PopupMessage1 = "game_floatingtext_Silenced"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetSilenced
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetSilenced
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetSilenced
    }
  }
}
