BuffTextureName = "Nocturne_UmbraBlades.dds"
BuffName = "NocturneUmbraBlades"
AutoBuffActivateEffect = "NocturnePassiveReady.troy"
AutoBuffActivateAttachBoneName = "BUFFBONE_CSTM_L_PALM"
AutoBuffActivateEffect2 = "NocturnePassiveReady.troy"
AutoBuffActivateAttachBoneName2 = "BUFFBONE_CSTM_R_PALM"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetDodgePiercing,
    Params = {TargetVar = "Owner", Value = true}
  },
  {
    Function = BBGetLevel,
    Params = {TargetVar = "Owner", DestVar = "Level"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Heal",
      SrcValueByLevel = {
        15,
        15,
        15,
        15,
        15,
        15,
        20,
        20,
        20,
        20,
        20,
        20,
        25,
        25,
        25,
        25,
        25,
        25
      }
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "Heal",
      Index = 1
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "count",
      DestVarTable = "CharVars",
      SrcValue = 0
    }
  },
  {
    Function = BBSetDodgePiercing,
    Params = {TargetVar = "Owner", Value = false}
  },
  {
    Function = BBRemoveOverrideAutoAttack,
    Params = {OwnerVar = "Owner", CancelAttack = true}
  }
}
BuffOnPreAttackBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_TURRET},
        SubBlocks = {
          {
            Function = BBRemoveOverrideAutoAttack,
            Params = {OwnerVar = "Owner", CancelAttack = true}
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBOverrideAutoAttack,
            Params = {
              SpellSlot = 0,
              SlotType = ExtraSlots,
              OwnerVar = "Owner",
              AutoAttackSpellLevel = 1,
              CancelAttack = true
            }
          }
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBRemoveOverrideAutoAttack,
        Params = {OwnerVar = "Owner", CancelAttack = true}
      }
    }
  }
}
