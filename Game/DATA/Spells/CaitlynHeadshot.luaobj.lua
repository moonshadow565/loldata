BuffTextureName = "Caitlyn_Headshot2.dds"
BuffName = "CaitlynHeadshotReady"
AutoBuffActivateEffect = "caitlyn_headshot_rdy_indicator.troy"
AutoBuffActivateAttachBoneName = "R_BUFFBONE_GLB_HAND_LOC"
AutoBuffActivateEffect2 = "caitlyn_headshot_rdy_indicator.troy"
AutoBuffActivateAttachBoneName2 = "L_BUFFBONE_GLB_HAND_LOC"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetDodgePiercing,
    Params = {TargetVar = "Owner", Value = true}
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetDodgePiercing,
    Params = {TargetVar = "Owner", Value = false}
  }
}
BuffOnPreAttackBuildingBlocks = {
  {
    Function = BBRemoveOverrideAutoAttack,
    Params = {OwnerVar = "Owner", CancelAttack = false}
  },
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_TURRET}
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBOverrideAutoAttack,
            Params = {
              SpellSlot = 2,
              SlotType = ExtraSlots,
              OwnerVar = "Owner",
              AutoAttackSpellLevel = 1,
              CancelAttack = true
            }
          }
        }
      }
    }
  }
}
