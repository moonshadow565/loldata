BuffTextureName = "Sion_FeelNoPain.dds"
BuffName = "Feel No Pain"
PersistsThroughDeath = true
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "punchdmg",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  },
  {
    Function = BBOverrideAutoAttack,
    Params = {
      SpellSlot = 5,
      SlotType = ExtraSlots,
      OwnerVar = "Owner",
      AutoAttackSpellLevel = 1,
      CancelAttack = true
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBRemoveOverrideAutoAttack,
    Params = {OwnerVar = "Owner", CancelAttack = true}
  },
  {
    Function = BBCancelAutoAttack,
    Params = {TargetVar = "Owner", Reset = false}
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 5,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = true
    },
    SubBlocks = {
      {
        Function = BBGetLevel,
        Params = {TargetVar = "Owner", DestVar = "Level"}
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "punchdmg",
          DestVarTable = "InstanceVars",
          SrcValueByLevel = {
            25,
            30,
            35,
            40,
            45,
            50,
            55,
            60,
            65,
            70,
            75,
            80,
            85,
            90,
            95,
            100,
            105,
            110
          }
        }
      },
      {
        Function = BBSetBuffToolTipVar,
        Params = {
          Value = 0,
          ValueVar = "punchdmg",
          ValueVarTable = "InstanceVars",
          Index = 1
        }
      }
    }
  }
}
