BuffTextureName = "ViktorGravitonField.dds"
BuffName = "ViktorGravitonSlow"
AutoBuffActivateEffect = "Global_Slow.troy"
AutoBuffActivateEffect2 = "Viktor_Catalyst_buf.troy"
AutoBuffActivateAttachBoneName2 = ""
AutoBuffActivateEffect3 = ""
AutoBuffActivateAttachBoneName3 = ""
PopupMessage1 = "game_floatingtext_Slowed"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "MovementSpeedMod",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBApplyAssistMarker,
    Params = {
      Duration = 10,
      TargetVar = "Owner",
      SourceVar = "Attacker"
    }
  },
  {
    Function = BBGetBuffCountFromAll,
    Params = {
      DestVar = "Count",
      TargetVar = "Owner",
      BuffName = "ViktorGravitonFieldDebuff"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Count",
      Value2 = 3,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIfNotHasBuff,
        Params = {
          OwnerVar = "Owner",
          CasterVar = "Attacker",
          BuffName = "ViktorGravitonFieldNoStun"
        },
        SubBlocks = {
          {
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Attacker",
              AttackerVar = "Attacker",
              BuffName = "ViktorAugmentW"
            },
            SubBlocks = {
              {
                Function = BBSpellBuffRemoveStacks,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Attacker",
                  BuffName = "ViktorGravitonFieldDebuff",
                  NumStacks = 0,
                  NumStacksVar = "Count"
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Attacker",
                  BuffName = "ViktorGravitonFieldNoStun",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Internal,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 4,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = false
                }
              },
              {
                Function = BBBreakSpellShields,
                Params = {TargetVar = "Owner"}
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Attacker",
                  BuffName = "ViktorGravitonFieldStun",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Stun,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 1.5,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = false
                }
              }
            }
          },
          {
            Function = BBElse,
            Params = {},
            SubBlocks = {
              {
                Function = BBSpellBuffRemoveStacks,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Attacker",
                  BuffName = "ViktorGravitonFieldDebuff",
                  NumStacks = 0,
                  NumStacksVar = "Count"
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Attacker",
                  BuffName = "ViktorGravitonFieldNoStun",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Internal,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 4,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = false
                }
              },
              {
                Function = BBBreakSpellShields,
                Params = {TargetVar = "Owner"}
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Attacker",
                  BuffName = "ViktorGravitonFieldStun",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Stun,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 1.5,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = false
                }
              }
            }
          }
        }
      },
      {
        Function = BBSpellBuffRemoveStacks,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Attacker",
          BuffName = "ViktorGravitonFieldDebuff",
          NumStacks = 0,
          NumStacksVar = "Count"
        }
      }
    }
  }
}
OnBuffDeactivateBuildingBlocks = {}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMultiplicativeMovementSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "MovementSpeedMod",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "viktorgravitonfieldnostun"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "viktorgravitonfieldstun"
    }
  }
}
