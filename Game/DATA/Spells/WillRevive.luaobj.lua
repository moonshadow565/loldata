BuffTextureName = "3026_Guardian_Angel.dds"
BuffName = "Guardian Angel"
AutoBuffActivateEffect = "rebirthready.troy"
AutoBuffActivateAttachBoneName = "spine"
PersistsThroughDeath = true
NonDispellable = true
OnPreDamagePriority = 6
BuffOnPreDamageBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Value1 = DAMAGESOURCE_INTERNALRAW, CompareOp = CO_DAMAGE_SOURCETYPE_IS_NOT},
    SubBlocks = {
      {
        Function = BBGetPAROrHealth,
        Params = {
          DestVar = "CurHealth",
          OwnerVar = "Owner",
          Function = GetHealth,
          PARType = PAR_MANA
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "CurHealth",
          Src2Var = "DamageAmount",
          CompareOp = CO_LESS_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBIfNotHasBuff,
            Params = {
              OwnerVar = "Owner",
              CasterVar = "Owner",
              BuffName = "GuardianAngel"
            },
            SubBlocks = {
              {
                Function = BBIf,
                Params = {Src1Var = "Owner", CompareOp = CO_IS_TYPE_HERO},
                SubBlocks = {
                  {
                    Function = BBMath,
                    Params = {
                      Src1Var = "CurHealth",
                      Src1Value = 0,
                      Src2Value = 1,
                      DestVar = "DamageAmount",
                      MathOp = MO_SUBTRACT
                    }
                  },
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Owner",
                      AttackerVar = "Owner",
                      BuffName = "GuardianAngel",
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
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "guardianangel"
    }
  }
}
