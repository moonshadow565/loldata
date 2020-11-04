BuffTextureName = "Katarina_BouncingBlade.dds"
BuffName = "BouncingBladeMS"
AutoBuffActivateEffect = "global_grievousWound_tar.troy"
AutoBuffActivateAttachBoneName = "head"
BuffOnHealBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src1Var = "Health",
      Src1Value = 0,
      Src2Value = 0.35,
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
