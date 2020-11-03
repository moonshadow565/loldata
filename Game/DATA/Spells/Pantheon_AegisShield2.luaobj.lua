BuffTextureName = "Pantheon_AOZ.dds"
BuffName = "PantheonAegisShield"
AutoBuffActivateEffect = "pantheon_aoz_passive.troy"
AutoBuffActivateAttachBoneName = "C_BUFFBONE_GLB_CENTER_LOC"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "executeOnce",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "executeOnce",
      Src1VarTable = "InstanceVars",
      Value2 = false,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetStatus,
        Params = {
          TargetVar = "Owner",
          DestVar = "isMoving",
          Status = IsMoving
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "isMoving",
          Value2 = true,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "executeOnce",
              DestVarTable = "InstanceVars",
              SrcValue = true
            }
          },
          {
            Function = BBOverrideAnimation,
            Params = {
              ToOverrideAnim = "Run",
              OverrideAnim = "Run2",
              OwnerVar = "Owner"
            }
          }
        }
      }
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "executeOnce",
      Src1VarTable = "InstanceVars",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBClearOverrideAnimation,
        Params = {ToOverrideAnim = "Run", OwnerVar = "Owner"}
      }
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "executeOnce",
      Src1VarTable = "InstanceVars",
      Value2 = false,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetStatus,
        Params = {
          TargetVar = "Owner",
          DestVar = "isMoving",
          Status = IsMoving
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "isMoving",
          Value2 = true,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "executeOnce",
              DestVarTable = "InstanceVars",
              SrcValue = true
            }
          },
          {
            Function = BBOverrideAnimation,
            Params = {
              ToOverrideAnim = "Run",
              OverrideAnim = "Run2",
              OwnerVar = "Owner"
            }
          }
        }
      }
    }
  }
}
