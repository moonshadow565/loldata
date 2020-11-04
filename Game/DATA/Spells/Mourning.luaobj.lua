BuffTextureName = "3069_Sword_of_Light_and_Shadow.dds"
BuffName = "Mourning"
AutoBuffActivateEffect = "Global_Mortal_Strike.troy"
AutoBuffActivateAttachBoneName = "head"
BuffOnHealBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src1Var = "Health",
      Src1Value = 0,
      Src2Value = 0.6,
      DestVar = "EffectiveHeal",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetReturnValue,
    Params = {
      SrcVar = "EffectiveHeal"
    }
  }
}
