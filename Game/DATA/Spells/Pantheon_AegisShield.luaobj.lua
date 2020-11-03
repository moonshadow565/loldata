BuffTextureName = "Pantheon_AOZ.dds"
BuffName = "PantheonAegisShield"
AutoBuffActivateEffect = "pantheon_aoz_passive.troy"
AutoBuffActivateAttachBoneName = "C_BUFFBONE_GLB_CENTER_LOC"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "damageThreshold",
      DestVarTable = "InstanceVars",
      SrcValue = 40
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
BuffOnBeingHitBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "HitResult",
      Value2 = HIT_Dodge,
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "HitResult",
          Value2 = HIT_Miss,
          CompareOp = CO_NOT_EQUAL
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "damageThreshold",
              Src1VarTable = "InstanceVars",
              Src2Var = "DamageAmount",
              CompareOp = CO_LESS_THAN_OR_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "DamageAmount",
                  SrcValue = 0
                }
              },
              {
                Function = BBSay,
                Params = {
                  OwnerVar = "Attacker",
                  ToSay = "game_lua_Aegis_Block"
                }
              },
              {
                Function = BBSay,
                Params = {
                  OwnerVar = "Owner",
                  ToSay = "game_lua_Aegis_Block"
                }
              },
              {
                Function = BBSpellBuffRemove,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Owner",
                  BuffName = "Pantheon_AegisShield"
                }
              }
            }
          }
        }
      }
    }
  }
}
BuffOnLevelUpBuildingBlocks = {
  {
    Function = BBGetLevel,
    Params = {TargetVar = "Owner", DestVar = "Level"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "damageThreshold",
      DestVarTable = "InstanceVars",
      SrcValueByLevel = {
        40,
        43,
        46,
        49,
        52,
        55,
        58,
        61,
        64,
        67,
        70,
        73,
        76,
        79,
        82,
        85,
        88,
        91,
        94,
        97,
        100
      }
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBClearOverrideAnimation,
    Params = {ToOverrideAnim = "Run", OwnerVar = "Owner"}
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "pantheon_aegisshield"
    }
  }
}
