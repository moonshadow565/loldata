BuffTextureName = "Pantheon_AOZ.dds"
BuffName = "PantheonAegisShield"
AutoBuffActivateEffect = "pantheon_aoz_passive.troy"
AutoBuffActivateAttachBoneName = "waist"
OnBuffActivateBuildingBlocks = {}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBClearOverrideAnimation,
    Params = {ToOverrideAnim = "Run", OwnerVar = "Owner"}
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
              Src1Var = "DamageAmount",
              Value2 = 40,
              CompareOp = CO_GREATER_THAN_OR_EQUAL
            },
            SubBlocks = {
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
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "DamageAmount",
                  SrcValue = 0
                }
              },
              {
                Function = BBSpellBuffRemoveCurrent,
                Params = {TargetVar = "Owner"}
              }
            }
          }
        }
      }
    }
  }
}
