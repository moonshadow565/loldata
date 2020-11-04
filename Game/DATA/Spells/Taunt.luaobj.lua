BuffTextureName = "GSB_taunt.dds"
BuffName = "Taunt"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
PopupMessage1 = "game_floatingtext_Taunted"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBStopChanneling,
    Params = {
      CasterVar = "Owner",
      StopCondition = ChannelingStopCondition_Cancel,
      StopSource = ChannelingStopSource_StunnedOrSilencedOrTaunted
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetTaunted
    }
  },
  {
    Function = BBApplyAssistMarker,
    Params = {
      Duration = 10,
      TargetVar = "Owner",
      SourceVar = "Attacker"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetTaunted
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Attacker", CompareOp = CO_IS_DEAD},
    SubBlocks = {
      {
        Function = BBSpellBuffRemoveCurrent,
        Params = {TargetVar = "Owner"}
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSetStatus,
        Params = {
          TargetVar = "Owner",
          SrcValue = true,
          Status = SetTaunted
        }
      }
    }
  }
}
