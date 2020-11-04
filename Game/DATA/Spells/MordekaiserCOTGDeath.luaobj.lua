OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetRandomPointInAreaUnit,
    Params = {
      TargetVar = "Owner",
      Radius = 400,
      InnerRadius = 200,
      ResultVar = "Pos"
    }
  },
  {
    Function = BBCloneUnitPet,
    Params = {
      UnitToCloneVar = "Attacker",
      Buff = "MordekaiserCOTGPetBuff",
      Duration = 0,
      PosVar = "Pos",
      HealthBonus = 0,
      DamageBonus = 0,
      DestVar = "Other1"
    }
  }
}
