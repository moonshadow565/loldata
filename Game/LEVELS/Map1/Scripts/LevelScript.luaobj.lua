MAX_MINIONS_EVER = 180
TEAM_ORDER = 100
TEAM_CHAOS = 200
ORDER_HQ = 1
CHAOS_HQ = 2
FRONT_TOWER = 3
MIDDLE_TOWER = 2
BACK_TOWER = 1
HQ_TOWER2 = 4
HQ_TOWER1 = 5
RIGHT_LANE = 0
CENTER_LANE = 1
LEFT_LANE = 2
INITIAL_TIME_TO_SPAWN = 90
CASTER_MINION_SPAWN_FREQUENCY = 3
MINION_HEALTH_DENIAL_PERCENT = 0
MELEE_EXP_GIVEN = 64
MELEE_GOLD_GIVEN = 22
ARCHER_EXP_GIVEN = 32
ARCHER_GOLD_GIVEN = 16
CASTER_EXP_GIVEN = 100
CASTER_GOLD_GIVEN = 27
SUPER_EXP_GIVEN = 100
SUPER_GOLD_GIVEN = 27
MELEE_HEALTH_UPGRADE = 20
MELEE_DAMAGE_UPGRADE = 1
MELEE_GOLD_UPGRADE = 0.5
MELEE_EXP_UPGRADE = 5
MELEE_ARMOR_UPGRADE = 2
MELEE_MR_UPGRADE = 0.5
ARCHER_HEALTH_UPGRADE = 15
ARCHER_DAMAGE_UPGRADE = 2
ARCHER_GOLD_UPGRADE = 0.5
ARCHER_EXP_UPGRADE = 3
ARCHER_ARMOR_UPGRADE = 0.5
ARCHER_MR_UPGRADE = 2
CASTER_HEALTH_UPGRADE = 27
CASTER_DAMAGE_UPGRADE = 3
CASTER_GOLD_UPGRADE = 1
CASTER_EXP_UPGRADE = 7
CASTER_ARMOR_UPGRADE = 2
CASTER_MR_UPGRADE = 2
SUPER_HEALTH_UPGRADE = 200
SUPER_DAMAGE_UPGRADE = 10
SUPER_GOLD_UPGRADE = 0
SUPER_EXP_UPGRADE = 0
SUPER_ARMOR_UPGRADE = 0
SUPER_MR_UPGRADE = 0
MAXIMUM_MELEE_GOLD_BONUS = 10
MAXIMUM_ARCHER_GOLD_BONUS = 10
MAXIMUM_CASTER_GOLD_BONUS = 20
MAXIMUM_SUPER_GOLD_BONUS = 20
UPGRADE_MINION_TIMER = 180
MELEE_HEALTH_INHIBITOR = 100
MELEE_DAMAGE_INHIBITOR = 10
MELEE_GOLD_INHIBITOR = 0
MELEE_EXP_INHIBITOR = 0
ARCHER_HEALTH_INHIBITOR = 60
ARCHER_DAMAGE_INHIBITOR = 18
ARCHER_GOLD_INHIBITOR = 0
ARCHER_EXP_INHIBITOR = 0
CASTER_HEALTH_INHIBITOR = 200
CASTER_DAMAGE_INHIBITOR = 25
CASTER_GOLD_INHIBITOR = 0
CASTER_EXP_INHIBITOR = 0
SUPER_HEALTH_INHIBITOR = 0
SUPER_DAMAGE_INHIBITOR = 0
SUPER_GOLD_INHIBITOR = 0
SUPER_EXP_INHIBITOR = 0
EXP_GIVEN_RADIUS = 1250
DISABLE_MINION_SPAWN_BASE_TIME = 300
DISABLE_MINION_SPAWN_MAG_TIME = 90
LAST_WAVE = -1
SPECIAL_MINION_MODE = "none"
HQTurretAttackable = false
OrderNames = {
  MeleeMinionName = "Blue_Minion_Basic",
  ArcherMinionName = "Blue_Minion_Wizard",
  CasterMinionName = "Blue_Minion_MechCannon",
  SuperMinionName = "Blue_Minion_MechMelee"
}
ChaosNames = {
  MeleeMinionName = "Red_Minion_Basic",
  ArcherMinionName = "Red_Minion_Wizard",
  CasterMinionName = "Red_Minion_MechCannon",
  SuperMinionName = "Red_Minion_MechMelee"
}
SpawnTable = {
  WaveSpawnRate = 0,
  NumOfMeleeMinionsPerWave = 0,
  NumOfArcherMinionsPerWave = 0,
  NumOfCasterMinionsPerWave = 0,
  NumOfSuperMinionsPerWave = 0,
  SingleMinionSpawnDelay = 0,
  DidPowerGroup = 0,
  MeleeMinionName = 0,
  ArcherMinionName = 0,
  CasterMinionName = 0,
  SuperMinionName = 0
}
ChaosBarrack0 = {
  IsDestroyed = false,
  MeleeMinionArmor = 0,
  MeleeMinionMagicResistance = 0,
  MeleeHPBonus = 0,
  MeleeDamageBonus = 0,
  MeleeGoldBonus = 0,
  MeleeExpBonus = 0,
  MeleeExpGiven = MELEE_EXP_GIVEN,
  MeleeGoldGiven = MELEE_GOLD_GIVEN,
  ArcherMinionArmor = 0,
  ArcherMinionMagicResistance = 0,
  ArcherHPBonus = 0,
  ArcherDamageBonus = 0,
  ArcherGoldBonus = 0,
  ArcherExpBonus = 0,
  ArcherExpGiven = ARCHER_EXP_GIVEN,
  ArcherGoldGiven = ARCHER_GOLD_GIVEN,
  CasterMinionArmor = 0,
  CasterMinionMagicResistance = 0,
  CasterHPBonus = 0,
  CasterDamageBonus = 0,
  CasterGoldBonus = 0,
  CasterExpBonus = 0,
  CasterExpGiven = CASTER_EXP_GIVEN,
  SuperMinionArmor = 0,
  SuperMinionMagicResistance = 0,
  SuperHPBonus = 0,
  SuperDamageBonus = 0,
  SuperGoldBonus = 0,
  SuperExpBonus = 0,
  SuperExpGiven = SUPER_EXP_GIVEN,
  NumOfSpawnDisables = 0,
  WillSpawnSuperMinion = 0,
  MeleeMinionName = 0,
  RangedMinionName = 0,
  CasterMinionName = 0,
  CasterGoldGiven = CASTER_GOLD_GIVEN,
  SuperMinionName = 0,
  SuperGoldGiven = CASTER_GOLD_GIVEN
}
ChaosBarrack1 = {
  IsDestroyed = false,
  MeleeMinionArmor = 0,
  MeleeMinionMagicResistance = 0,
  MeleeHPBonus = 0,
  MeleeDamageBonus = 0,
  MeleeGoldBonus = 0,
  MeleeExpBonus = 0,
  MeleeExpGiven = MELEE_EXP_GIVEN,
  MeleeGoldGiven = MELEE_GOLD_GIVEN,
  ArcherMinionArmor = 0,
  ArcherMinionMagicResistance = 0,
  ArcherHPBonus = 0,
  ArcherDamageBonus = 0,
  ArcherGoldBonus = 0,
  ArcherExpBonus = 0,
  ArcherExpGiven = ARCHER_EXP_GIVEN,
  ArcherGoldGiven = ARCHER_GOLD_GIVEN,
  CasterMinionArmor = 0,
  CasterMinionMagicResistance = 0,
  CasterHPBonus = 0,
  CasterDamageBonus = 0,
  CasterGoldBonus = 0,
  CasterExpBonus = 0,
  CasterExpGiven = CASTER_EXP_GIVEN,
  SuperMinionArmor = 0,
  SuperMinionMagicResistance = 0,
  SuperHPBonus = 0,
  SuperDamageBonus = 0,
  SuperGoldBonus = 0,
  SuperExpBonus = 0,
  SuperExpGiven = SUPER_EXP_GIVEN,
  NumOfSpawnDisables = 0,
  WillSpawnSuperMinion = 0,
  MeleeMinionName = 0,
  RangedMinionName = 0,
  CasterMinionName = 0,
  CasterGoldGiven = CASTER_GOLD_GIVEN,
  SuperMinionName = 0,
  SuperGoldGiven = CASTER_GOLD_GIVEN
}
ChaosBarrack2 = {
  IsDestroyed = false,
  MeleeMinionArmor = 0,
  MeleeMinionMagicResistance = 0,
  MeleeHPBonus = 0,
  MeleeDamageBonus = 0,
  MeleeGoldBonus = 0,
  MeleeExpBonus = 0,
  MeleeExpGiven = MELEE_EXP_GIVEN,
  MeleeGoldGiven = MELEE_GOLD_GIVEN,
  ArcherMinionArmor = 0,
  ArcherMinionMagicResistance = 0,
  ArcherHPBonus = 0,
  ArcherDamageBonus = 0,
  ArcherGoldBonus = 0,
  ArcherExpBonus = 0,
  ArcherExpGiven = ARCHER_EXP_GIVEN,
  ArcherGoldGiven = ARCHER_GOLD_GIVEN,
  CasterMinionArmor = 0,
  CasterMinionMagicResistance = 0,
  CasterHPBonus = 0,
  CasterDamageBonus = 0,
  CasterGoldBonus = 0,
  CasterExpBonus = 0,
  CasterExpGiven = CASTER_EXP_GIVEN,
  SuperMinionArmor = 0,
  SuperMinionMagicResistance = 0,
  SuperHPBonus = 0,
  SuperDamageBonus = 0,
  SuperGoldBonus = 0,
  SuperExpBonus = 0,
  SuperExpGiven = SUPER_EXP_GIVEN,
  NumOfSpawnDisables = 0,
  WillSpawnSuperMinion = 0,
  MeleeMinionName = 0,
  RangedMinionName = 0,
  CasterMinionName = 0,
  CasterGoldGiven = CASTER_GOLD_GIVEN,
  SuperMinionName = 0,
  SuperGoldGiven = CASTER_GOLD_GIVEN
}
OrderBarrack0 = {
  IsDestroyed = false,
  MeleeMinionArmor = 0,
  MeleeMinionMagicResistance = 0,
  MeleeHPBonus = 0,
  MeleeDamageBonus = 0,
  MeleeGoldBonus = 0,
  MeleeExpBonus = 0,
  MeleeExpGiven = MELEE_EXP_GIVEN,
  MeleeGoldGiven = MELEE_GOLD_GIVEN,
  ArcherMinionArmor = 0,
  ArcherMinionMagicResistance = 0,
  ArcherHPBonus = 0,
  ArcherDamageBonus = 0,
  ArcherGoldBonus = 0,
  ArcherExpBonus = 0,
  ArcherExpGiven = ARCHER_EXP_GIVEN,
  ArcherGoldGiven = ARCHER_GOLD_GIVEN,
  CasterMinionArmor = 0,
  CasterMinionMagicResistance = 0,
  CasterHPBonus = 0,
  CasterDamageBonus = 0,
  CasterGoldBonus = 0,
  CasterExpBonus = 0,
  CasterExpGiven = CASTER_EXP_GIVEN,
  SuperMinionArmor = 0,
  SuperMinionMagicResistance = 0,
  SuperHPBonus = 0,
  SuperDamageBonus = 0,
  SuperGoldBonus = 0,
  SuperExpBonus = 0,
  SuperExpGiven = SUPER_EXP_GIVEN,
  NumOfSpawnDisables = 0,
  WillSpawnSuperMinion = 0,
  MeleeMinionName = 0,
  RangedMinionName = 0,
  CasterMinionName = 0,
  CasterGoldGiven = CASTER_GOLD_GIVEN,
  SuperMinionName = 0,
  SuperGoldGiven = CASTER_GOLD_GIVEN
}
OrderBarrack1 = {
  IsDestroyed = false,
  MeleeMinionArmor = 0,
  MeleeMinionMagicResistance = 0,
  MeleeHPBonus = 0,
  MeleeDamageBonus = 0,
  MeleeGoldBonus = 0,
  MeleeExpBonus = 0,
  MeleeExpGiven = MELEE_EXP_GIVEN,
  MeleeGoldGiven = MELEE_GOLD_GIVEN,
  ArcherMinionArmor = 0,
  ArcherMinionMagicResistance = 0,
  ArcherHPBonus = 0,
  ArcherDamageBonus = 0,
  ArcherGoldBonus = 0,
  ArcherExpBonus = 0,
  ArcherExpGiven = ARCHER_EXP_GIVEN,
  ArcherGoldGiven = ARCHER_GOLD_GIVEN,
  CasterMinionArmor = 0,
  CasterMinionMagicResistance = 0,
  CasterHPBonus = 0,
  CasterDamageBonus = 0,
  CasterGoldBonus = 0,
  CasterExpBonus = 0,
  CasterExpGiven = CASTER_EXP_GIVEN,
  SuperMinionArmor = 0,
  SuperMinionMagicResistance = 0,
  SuperHPBonus = 0,
  SuperDamageBonus = 0,
  SuperGoldBonus = 0,
  SuperExpBonus = 0,
  SuperExpGiven = SUPER_EXP_GIVEN,
  NumOfSpawnDisables = 0,
  WillSpawnSuperMinion = 0,
  MeleeMinionName = 0,
  RangedMinionName = 0,
  CasterMinionName = 0,
  CasterGoldGiven = CASTER_GOLD_GIVEN,
  SuperMinionName = 0,
  SuperGoldGiven = CASTER_GOLD_GIVEN
}
OrderBarrack2 = {
  IsDestroyed = false,
  MeleeMinionArmor = 0,
  MeleeMinionMagicResistance = 0,
  MeleeHPBonus = 0,
  MeleeDamageBonus = 0,
  MeleeGoldBonus = 0,
  MeleeExpBonus = 0,
  MeleeExpGiven = MELEE_EXP_GIVEN,
  MeleeGoldGiven = MELEE_GOLD_GIVEN,
  ArcherMinionArmor = 0,
  ArcherMinionMagicResistance = 0,
  ArcherHPBonus = 0,
  ArcherDamageBonus = 0,
  ArcherGoldBonus = 0,
  ArcherExpBonus = 0,
  ArcherExpGiven = ARCHER_EXP_GIVEN,
  ArcherGoldGiven = ARCHER_GOLD_GIVEN,
  CasterMinionArmor = 0,
  CasterMinionMagicResistance = 0,
  CasterHPBonus = 0,
  CasterDamageBonus = 0,
  CasterGoldBonus = 0,
  CasterExpBonus = 0,
  CasterExpGiven = CASTER_EXP_GIVEN,
  SuperMinionArmor = 0,
  SuperMinionMagicResistance = 0,
  SuperHPBonus = 0,
  SuperDamageBonus = 0,
  SuperGoldBonus = 0,
  SuperExpBonus = 0,
  SuperExpGiven = SUPER_EXP_GIVEN,
  NumOfSpawnDisables = 0,
  WillSpawnSuperMinion = 0,
  MeleeMinionName = 0,
  RangedMinionName = 0,
  CasterMinionName = 0,
  CasterGoldGiven = CASTER_GOLD_GIVEN,
  SuperMinionName = 0,
  SuperGoldGiven = CASTER_GOLD_GIVEN
}
ChaosBarracksBonuses = {
  ChaosBarrack0,
  ChaosBarrack1,
  ChaosBarrack2
}
OrderBarracksBonuses = {
  OrderBarrack0,
  OrderBarrack1,
  OrderBarrack2
}
NeutralMinionNames = {
  "Lizard",
  "Dragon",
  "Golem",
  "wolf",
  "Wraith"
}
function CreateLaneBuildingTable()
  return {
    Turret3 = true,
    Turret2 = true,
    Turret1 = true,
    Barracks = true
  }
end
OrderBuildingStatus = {
  CreateLaneBuildingTable(),
  CreateLaneBuildingTable(),
  CreateLaneBuildingTable(),
  HQTower2 = true,
  HQTower1 = true,
  HQ = true
}
ChaosBuildingStatus = {
  CreateLaneBuildingTable(),
  CreateLaneBuildingTable(),
  CreateLaneBuildingTable(),
  HQTower2 = true,
  HQTower1 = true,
  HQ = true
}
TotalNumberOfMinions = 0
totalNumberOfChaosBarracks = 3
totalNumberOfOrderBarracks = 3
function OnLevelInit()
  for _FORV_3_, _FORV_4_ in pairs(OrderNames) do
    PreloadCharacter(_FORV_4_)
  end
  for _FORV_3_, _FORV_4_ in pairs(ChaosNames) do
    PreloadCharacter(_FORV_4_)
  end
  PreloadCharacter("OrderTurretAngel")
  PreloadCharacter("OrderTurretDragon")
  PreloadCharacter("OrderTurretNormal2")
  PreloadCharacter("OrderTurretNormal")
  PreloadCharacter("ChaosTurretWorm")
  PreloadCharacter("ChaosTurretWorm2")
  PreloadCharacter("ChaosTurretGiant")
  PreloadCharacter("ChaosTurretNormal")
  PreloadSpell("SpellShieldMarker")
  math.randomseed(os.time())
  LoadScriptIntoScript("NeutralMinionSpawn.lua")
  NeutralMinionInit()
  LoadScriptIntoScript("Data\\Scripts\\EndOfGame.lua")
  SpawnTable.WaveSpawnRate = 30000
  SpawnTable.NumOfMeleeMinionsPerWave = 3
  SpawnTable.NumOfArcherMinionsPerWave = 3
  SpawnTable.SingleMinionSpawnDelay = 800
  SpawnTable.DidPowerGroup = false
  InitTimer("UpgradeMinionTimer", UPGRADE_MINION_TIMER, true)
  InitTimer("AllowDamageOnBuildings", 10, false)
end
function OnPostLevelLoad()
  LoadScriptIntoScript("CreateLevelProps.lua")
  CreateLevelProps()
end
function OppositeTeam(_ARG_0_)
  if _ARG_0_ == TEAM_CHAOS then
    return TEAM_ORDER
  else
    return TEAM_CHAOS
  end
end
function UpgradeMinionTimer()
  for _FORV_3_ = 1, 3 do
    OrderBarracksBonuses[_FORV_3_].MeleeHPBonus = OrderBarracksBonuses[_FORV_3_].MeleeHPBonus + MELEE_HEALTH_UPGRADE
    OrderBarracksBonuses[_FORV_3_].MeleeDamageBonus = OrderBarracksBonuses[_FORV_3_].MeleeDamageBonus + MELEE_DAMAGE_UPGRADE
    OrderBarracksBonuses[_FORV_3_].MeleeGoldBonus = OrderBarracksBonuses[_FORV_3_].MeleeGoldBonus + MELEE_GOLD_UPGRADE
    OrderBarracksBonuses[_FORV_3_].MeleeMinionArmor = OrderBarracksBonuses[_FORV_3_].MeleeMinionArmor + MELEE_ARMOR_UPGRADE
    OrderBarracksBonuses[_FORV_3_].MeleeMinionMagicResistance = OrderBarracksBonuses[_FORV_3_].MeleeMinionMagicResistance + MELEE_MR_UPGRADE
    if OrderBarracksBonuses[_FORV_3_].MeleeGoldBonus > MAXIMUM_MELEE_GOLD_BONUS then
      OrderBarracksBonuses[_FORV_3_].MeleeGoldBonus = MAXIMUM_MELEE_GOLD_BONUS
    end
    OrderBarracksBonuses[_FORV_3_].MeleeExpBonus = OrderBarracksBonuses[_FORV_3_].MeleeExpBonus + MELEE_EXP_UPGRADE
    OrderBarracksBonuses[_FORV_3_].MeleeGoldGiven = OrderBarracksBonuses[_FORV_3_].MeleeGoldBonus + MELEE_GOLD_GIVEN
    OrderBarracksBonuses[_FORV_3_].MeleeExpGiven = OrderBarracksBonuses[_FORV_3_].MeleeExpBonus + MELEE_EXP_GIVEN
    OrderBarracksBonuses[_FORV_3_].ArcherHPBonus = OrderBarracksBonuses[_FORV_3_].ArcherHPBonus + ARCHER_HEALTH_UPGRADE
    OrderBarracksBonuses[_FORV_3_].ArcherDamageBonus = OrderBarracksBonuses[_FORV_3_].ArcherDamageBonus + ARCHER_DAMAGE_UPGRADE
    OrderBarracksBonuses[_FORV_3_].ArcherGoldBonus = OrderBarracksBonuses[_FORV_3_].ArcherGoldBonus + ARCHER_GOLD_UPGRADE
    OrderBarracksBonuses[_FORV_3_].ArcherMinionArmor = OrderBarracksBonuses[_FORV_3_].ArcherMinionArmor + ARCHER_ARMOR_UPGRADE
    OrderBarracksBonuses[_FORV_3_].ArcherMinionMagicResistance = OrderBarracksBonuses[_FORV_3_].ArcherMinionMagicResistance + ARCHER_MR_UPGRADE
    if OrderBarracksBonuses[_FORV_3_].ArcherGoldBonus > MAXIMUM_ARCHER_GOLD_BONUS then
      OrderBarracksBonuses[_FORV_3_].ArcherGoldBonus = MAXIMUM_ARCHER_GOLD_BONUS
    end
    OrderBarracksBonuses[_FORV_3_].ArcherExpBonus = OrderBarracksBonuses[_FORV_3_].ArcherExpBonus + ARCHER_EXP_UPGRADE
    OrderBarracksBonuses[_FORV_3_].ArcherGoldGiven = OrderBarracksBonuses[_FORV_3_].ArcherGoldBonus + ARCHER_GOLD_GIVEN
    OrderBarracksBonuses[_FORV_3_].ArcherExpGiven = OrderBarracksBonuses[_FORV_3_].ArcherExpBonus + ARCHER_EXP_GIVEN
    OrderBarracksBonuses[_FORV_3_].CasterHPBonus = OrderBarracksBonuses[_FORV_3_].CasterHPBonus + CASTER_HEALTH_UPGRADE
    OrderBarracksBonuses[_FORV_3_].CasterDamageBonus = OrderBarracksBonuses[_FORV_3_].CasterDamageBonus + CASTER_DAMAGE_UPGRADE
    OrderBarracksBonuses[_FORV_3_].CasterGoldBonus = OrderBarracksBonuses[_FORV_3_].CasterGoldBonus + CASTER_GOLD_UPGRADE
    OrderBarracksBonuses[_FORV_3_].CasterMinionArmor = OrderBarracksBonuses[_FORV_3_].CasterMinionArmor + CASTER_ARMOR_UPGRADE
    OrderBarracksBonuses[_FORV_3_].CasterMinionMagicResistance = OrderBarracksBonuses[_FORV_3_].CasterMinionMagicResistance + CASTER_MR_UPGRADE
    if OrderBarracksBonuses[_FORV_3_].CasterGoldBonus > MAXIMUM_CASTER_GOLD_BONUS then
      OrderBarracksBonuses[_FORV_3_].CasterGoldBonus = MAXIMUM_CASTER_GOLD_BONUS
    end
    OrderBarracksBonuses[_FORV_3_].CasterExpBonus = OrderBarracksBonuses[_FORV_3_].CasterExpBonus + CASTER_EXP_UPGRADE
    OrderBarracksBonuses[_FORV_3_].CasterGoldGiven = OrderBarracksBonuses[_FORV_3_].CasterGoldBonus + CASTER_GOLD_GIVEN
    OrderBarracksBonuses[_FORV_3_].CasterExpGiven = OrderBarracksBonuses[_FORV_3_].CasterExpBonus + CASTER_EXP_GIVEN
    OrderBarracksBonuses[_FORV_3_].SuperHPBonus = OrderBarracksBonuses[_FORV_3_].SuperHPBonus + SUPER_HEALTH_UPGRADE
    OrderBarracksBonuses[_FORV_3_].SuperDamageBonus = OrderBarracksBonuses[_FORV_3_].SuperDamageBonus + SUPER_DAMAGE_UPGRADE
    OrderBarracksBonuses[_FORV_3_].SuperGoldBonus = OrderBarracksBonuses[_FORV_3_].SuperGoldBonus + SUPER_GOLD_UPGRADE
    OrderBarracksBonuses[_FORV_3_].SuperMinionArmor = OrderBarracksBonuses[_FORV_3_].SuperMinionArmor + SUPER_ARMOR_UPGRADE
    OrderBarracksBonuses[_FORV_3_].SuperMinionMagicResistance = OrderBarracksBonuses[_FORV_3_].SuperMinionMagicResistance + SUPER_MR_UPGRADE
    if OrderBarracksBonuses[_FORV_3_].SuperGoldBonus > MAXIMUM_SUPER_GOLD_BONUS then
      OrderBarracksBonuses[_FORV_3_].SuperGoldBonus = MAXIMUM_SUPER_GOLD_BONUS
    end
    OrderBarracksBonuses[_FORV_3_].SuperExpBonus = OrderBarracksBonuses[_FORV_3_].SuperExpBonus + SUPER_EXP_UPGRADE
    OrderBarracksBonuses[_FORV_3_].SuperGoldGiven = OrderBarracksBonuses[_FORV_3_].SuperGoldBonus + SUPER_GOLD_GIVEN
    OrderBarracksBonuses[_FORV_3_].SuperExpGiven = OrderBarracksBonuses[_FORV_3_].SuperExpBonus + SUPER_EXP_GIVEN
    ChaosBarracksBonuses[_FORV_3_].MeleeHPBonus = ChaosBarracksBonuses[_FORV_3_].MeleeHPBonus + MELEE_HEALTH_UPGRADE
    ChaosBarracksBonuses[_FORV_3_].MeleeDamageBonus = ChaosBarracksBonuses[_FORV_3_].MeleeDamageBonus + MELEE_DAMAGE_UPGRADE
    ChaosBarracksBonuses[_FORV_3_].MeleeGoldBonus = ChaosBarracksBonuses[_FORV_3_].MeleeGoldBonus + MELEE_GOLD_UPGRADE
    ChaosBarracksBonuses[_FORV_3_].MeleeMinionArmor = ChaosBarracksBonuses[_FORV_3_].MeleeMinionArmor + MELEE_ARMOR_UPGRADE
    ChaosBarracksBonuses[_FORV_3_].MeleeMinionMagicResistance = ChaosBarracksBonuses[_FORV_3_].MeleeMinionMagicResistance + MELEE_MR_UPGRADE
    if ChaosBarracksBonuses[_FORV_3_].MeleeGoldBonus > MAXIMUM_MELEE_GOLD_BONUS then
      ChaosBarracksBonuses[_FORV_3_].MeleeGoldBonus = MAXIMUM_MELEE_GOLD_BONUS
    end
    ChaosBarracksBonuses[_FORV_3_].MeleeExpBonus = ChaosBarracksBonuses[_FORV_3_].MeleeExpBonus + MELEE_EXP_UPGRADE
    ChaosBarracksBonuses[_FORV_3_].MeleeGoldGiven = ChaosBarracksBonuses[_FORV_3_].MeleeGoldBonus + MELEE_GOLD_GIVEN
    ChaosBarracksBonuses[_FORV_3_].MeleeExpGiven = ChaosBarracksBonuses[_FORV_3_].MeleeExpBonus + MELEE_EXP_GIVEN
    ChaosBarracksBonuses[_FORV_3_].ArcherHPBonus = ChaosBarracksBonuses[_FORV_3_].ArcherHPBonus + ARCHER_HEALTH_UPGRADE
    ChaosBarracksBonuses[_FORV_3_].ArcherDamageBonus = ChaosBarracksBonuses[_FORV_3_].ArcherDamageBonus + ARCHER_DAMAGE_UPGRADE
    ChaosBarracksBonuses[_FORV_3_].ArcherGoldBonus = ChaosBarracksBonuses[_FORV_3_].ArcherGoldBonus + ARCHER_GOLD_UPGRADE
    ChaosBarracksBonuses[_FORV_3_].ArcherMinionArmor = ChaosBarracksBonuses[_FORV_3_].ArcherMinionArmor + ARCHER_ARMOR_UPGRADE
    ChaosBarracksBonuses[_FORV_3_].ArcherMinionMagicResistance = ChaosBarracksBonuses[_FORV_3_].ArcherMinionMagicResistance + ARCHER_MR_UPGRADE
    if ChaosBarracksBonuses[_FORV_3_].ArcherGoldBonus > MAXIMUM_ARCHER_GOLD_BONUS then
      ChaosBarracksBonuses[_FORV_3_].ArcherGoldBonus = MAXIMUM_ARCHER_GOLD_BONUS
    end
    ChaosBarracksBonuses[_FORV_3_].ArcherExpBonus = ChaosBarracksBonuses[_FORV_3_].ArcherExpBonus + ARCHER_EXP_UPGRADE
    ChaosBarracksBonuses[_FORV_3_].ArcherGoldGiven = ChaosBarracksBonuses[_FORV_3_].ArcherGoldBonus + ARCHER_GOLD_GIVEN
    ChaosBarracksBonuses[_FORV_3_].ArcherExpGiven = ChaosBarracksBonuses[_FORV_3_].ArcherExpBonus + ARCHER_EXP_GIVEN
    ChaosBarracksBonuses[_FORV_3_].CasterHPBonus = ChaosBarracksBonuses[_FORV_3_].CasterHPBonus + CASTER_HEALTH_UPGRADE
    ChaosBarracksBonuses[_FORV_3_].CasterDamageBonus = ChaosBarracksBonuses[_FORV_3_].CasterDamageBonus + CASTER_DAMAGE_UPGRADE
    ChaosBarracksBonuses[_FORV_3_].CasterGoldBonus = ChaosBarracksBonuses[_FORV_3_].CasterGoldBonus + CASTER_GOLD_UPGRADE
    ChaosBarracksBonuses[_FORV_3_].CasterMinionArmor = ChaosBarracksBonuses[_FORV_3_].CasterMinionArmor + CASTER_ARMOR_UPGRADE
    ChaosBarracksBonuses[_FORV_3_].CasterMinionMagicResistance = ChaosBarracksBonuses[_FORV_3_].CasterMinionMagicResistance + CASTER_MR_UPGRADE
    if ChaosBarracksBonuses[_FORV_3_].CasterGoldBonus > MAXIMUM_CASTER_GOLD_BONUS then
      ChaosBarracksBonuses[_FORV_3_].CasterGoldBonus = MAXIMUM_CASTER_GOLD_BONUS
    end
    ChaosBarracksBonuses[_FORV_3_].CasterExpBonus = ChaosBarracksBonuses[_FORV_3_].CasterExpBonus + CASTER_EXP_UPGRADE
    ChaosBarracksBonuses[_FORV_3_].CasterGoldGiven = ChaosBarracksBonuses[_FORV_3_].CasterGoldBonus + CASTER_GOLD_GIVEN
    ChaosBarracksBonuses[_FORV_3_].CasterExpGiven = ChaosBarracksBonuses[_FORV_3_].CasterExpBonus + CASTER_EXP_GIVEN
    ChaosBarracksBonuses[_FORV_3_].SuperHPBonus = ChaosBarracksBonuses[_FORV_3_].SuperHPBonus + SUPER_HEALTH_UPGRADE
    ChaosBarracksBonuses[_FORV_3_].SuperDamageBonus = ChaosBarracksBonuses[_FORV_3_].SuperDamageBonus + SUPER_DAMAGE_UPGRADE
    ChaosBarracksBonuses[_FORV_3_].SuperGoldBonus = ChaosBarracksBonuses[_FORV_3_].SuperGoldBonus + SUPER_GOLD_UPGRADE
    ChaosBarracksBonuses[_FORV_3_].SuperMinionArmor = ChaosBarracksBonuses[_FORV_3_].SuperMinionArmor + SUPER_ARMOR_UPGRADE
    ChaosBarracksBonuses[_FORV_3_].SuperMinionMagicResistance = ChaosBarracksBonuses[_FORV_3_].SuperMinionMagicResistance + SUPER_MR_UPGRADE
    if ChaosBarracksBonuses[_FORV_3_].SuperGoldBonus > MAXIMUM_SUPER_GOLD_BONUS then
      ChaosBarracksBonuses[_FORV_3_].SuperGoldBonus = MAXIMUM_SUPER_GOLD_BONUS
    end
    ChaosBarracksBonuses[_FORV_3_].SuperExpBonus = ChaosBarracksBonuses[_FORV_3_].SuperExpBonus + SUPER_EXP_UPGRADE
    ChaosBarracksBonuses[_FORV_3_].SuperGoldGiven = ChaosBarracksBonuses[_FORV_3_].SuperGoldBonus + SUPER_GOLD_GIVEN
    ChaosBarracksBonuses[_FORV_3_].SuperExpGiven = ChaosBarracksBonuses[_FORV_3_].SuperExpBonus + SUPER_EXP_GIVEN
  end
end
function AllowDamageOnBuildings()
  for _FORV_3_ = RIGHT_LANE, LEFT_LANE do
    for _FORV_7_ = BACK_TOWER, HQ_TOWER1 do
      orderTurret = GetTurret(TEAM_ORDER, _FORV_3_, _FORV_7_)
      if orderTurret ~= nil then
        if _FORV_7_ == FRONT_TOWER then
          SetInvulnerable(orderTurret, false)
          SetTargetable(orderTurret, true)
        else
          SetInvulnerable(orderTurret, true)
          SetNotTargetableToTeam(orderTurret, true, TEAM_CHAOS)
        end
      end
      chaosTurret = GetTurret(TEAM_CHAOS, _FORV_3_, _FORV_7_)
      if chaosTurret ~= nil then
        if _FORV_7_ == FRONT_TOWER then
          SetInvulnerable(chaosTurret, false)
          SetTargetable(chaosTurret, true)
        else
          SetInvulnerable(chaosTurret, true)
          SetNotTargetableToTeam(chaosTurret, true, TEAM_ORDER)
        end
      end
    end
  end
end
function GetMinionSpawnInfo(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_)
  TableForBarrack = SpawnTable
  if TableForBarrack.DidPowerGroup then
    TableForBarrack.NumOfCasterMinionsPerWave = TableForBarrack.NumOfCasterMinionsPerWave - 1
    TableForBarrack.DidPowerGroup = false
  end
  if _ARG_1_ % CASTER_MINION_SPAWN_FREQUENCY == 0 then
    TableForBarrack.NumOfCasterMinionsPerWave = TableForBarrack.NumOfCasterMinionsPerWave + 1
    TableForBarrack.DidPowerGroup = true
  end
  if _ARG_3_ == TEAM_ORDER then
  else
  end
  TableForBarrack.ExpRadius = EXP_GIVEN_RADIUS
  lNumOfMeleeMinionsPerWave = TableForBarrack.NumOfMeleeMinionsPerWave
  lNumOfArcherMinionsPerWave = TableForBarrack.NumOfArcherMinionsPerWave
  lNumOfCasterMinionsPerWave = TableForBarrack.NumOfCasterMinionsPerWave
  lNumOfSuperMinionsPerWave = TableForBarrack.NumOfSuperMinionsPerWave
  if _ARG_4_ ~= LAST_WAVE then
    BARRACKSCOUNT = 6
    totalMinionsRemaining = MAX_MINIONS_EVER - GetTotalTeamMinionsSpawned()
    if totalMinionsRemaining <= BARRACKSCOUNT * 7 then
      if 0 >= totalMinionsRemaining then
        SPECIAL_MINION_MODE = "None"
      elseif totalMinionsRemaining >= BARRACKSCOUNT * 3 then
        SPECIAL_MINION_MODE = "3Archers"
      elseif totalMinionsRemaining >= BARRACKSCOUNT then
        SPECIAL_MINION_MODE = "SpecialPowerMinion"
      else
        SPECIAL_MINION_MODE = "None"
      end
    else
      SPECIAL_MINION_MODE = ""
    end
    LAST_WAVE = _ARG_4_
  end
  if SPECIAL_MINION_MODE == "3Archers" then
    lNumOfMeleeMinionsPerWave = 0
    lNumOfArcherMinionsPerWave = 3
    lNumOfCasterMinionsPerWave = 0
    lNumOfSuperMinionsPerWave = 0
  elseif SPECIAL_MINION_MODE == "SpecialPowerMinion" then
    lNumOfMeleeMinionsPerWave = 0
    lNumOfArcherMinionsPerWave = 0
    lNumOfCasterMinionsPerWave = 0
    lNumOfSuperMinionsPerWave = 2
  elseif SPECIAL_MINION_MODE == "None" then
    lNumOfMeleeMinionsPerWave = 0
    lNumOfArcherMinionsPerWave = 0
    lNumOfCasterMinionsPerWave = 0
    lNumOfSuperMinionsPerWave = 0
  end
  if ChaosBarracksBonuses[_ARG_0_ + 1].WillSpawnSuperMinion == 1 then
    if _ARG_3_ == TEAM_ORDER and totalNumberOfChaosBarracks == 0 or _ARG_3_ == TEAM_CHAOS and totalNumberOfOrderBarracks == 0 then
      lNumOfSuperMinionsPerWave = 2
    else
      lNumOfSuperMinionsPerWave = 1
    end
    lNumOfCasterMinionsPerWave = 0
  end
  if _ARG_3_ == TEAM_ORDER then
    ChaosBarracksBonuses[_ARG_0_ + 1].MeleeMinionName = OrderNames.MeleeMinionName
    ChaosBarracksBonuses[_ARG_0_ + 1].ArcherMinionName = OrderNames.ArcherMinionName
    ChaosBarracksBonuses[_ARG_0_ + 1].CasterMinionName = OrderNames.CasterMinionName
    ChaosBarracksBonuses[_ARG_0_ + 1].SuperMinionName = OrderNames.SuperMinionName
  else
    ChaosBarracksBonuses[_ARG_0_ + 1].MeleeMinionName = ChaosNames.MeleeMinionName
    ChaosBarracksBonuses[_ARG_0_ + 1].ArcherMinionName = ChaosNames.ArcherMinionName
    ChaosBarracksBonuses[_ARG_0_ + 1].CasterMinionName = ChaosNames.CasterMinionName
    ChaosBarracksBonuses[_ARG_0_ + 1].SuperMinionName = ChaosNames.SuperMinionName
  end
  ReturnTable = {
    NumOfMeleeMinionsPerWave = lNumOfMeleeMinionsPerWave,
    NumOfArcherMinionsPerWave = lNumOfArcherMinionsPerWave,
    NumOfCasterMinionsPerWave = lNumOfCasterMinionsPerWave,
    NumOfSuperMinionsPerWave = lNumOfSuperMinionsPerWave,
    WaveSpawnRate = TableForBarrack.WaveSpawnRate,
    SingleMinionSpawnDelay = TableForBarrack.SingleMinionSpawnDelay,
    MeleeMinionName = ChaosBarracksBonuses[_ARG_0_ + 1].MeleeMinionName,
    ArcherMinionName = ChaosBarracksBonuses[_ARG_0_ + 1].ArcherMinionName,
    CasterMinionName = ChaosBarracksBonuses[_ARG_0_ + 1].CasterMinionName,
    SuperMinionName = ChaosBarracksBonuses[_ARG_0_ + 1].SuperMinionName,
    IsDestroyed = ChaosBarracksBonuses[_ARG_0_ + 1].IsDestroyed,
    MeleeMinionArmor = ChaosBarracksBonuses[_ARG_0_ + 1].MeleeMinionArmor,
    MeleeMinionMagicResistance = ChaosBarracksBonuses[_ARG_0_ + 1].MeleeMinionMagicResistance,
    MeleeHPBonus = ChaosBarracksBonuses[_ARG_0_ + 1].MeleeHPBonus,
    MeleeDamageBonus = ChaosBarracksBonuses[_ARG_0_ + 1].MeleeDamageBonus,
    MeleeExpGiven = ChaosBarracksBonuses[_ARG_0_ + 1].MeleeExpGiven,
    MeleeGoldGiven = ChaosBarracksBonuses[_ARG_0_ + 1].MeleeGoldGiven,
    ArcherMinionArmor = ChaosBarracksBonuses[_ARG_0_ + 1].ArcherMinionArmor,
    ArcherMinionMagicResistance = ChaosBarracksBonuses[_ARG_0_ + 1].ArcherMinionMagicResistance,
    ArcherHPBonus = ChaosBarracksBonuses[_ARG_0_ + 1].ArcherHPBonus,
    ArcherDamageBonus = ChaosBarracksBonuses[_ARG_0_ + 1].ArcherDamageBonus,
    ArcherExpGiven = ChaosBarracksBonuses[_ARG_0_ + 1].ArcherExpGiven,
    ArcherGoldGiven = ChaosBarracksBonuses[_ARG_0_ + 1].ArcherGoldGiven,
    CasterMinionArmor = ChaosBarracksBonuses[_ARG_0_ + 1].CasterMinionArmor,
    CasterMinionMagicResistance = ChaosBarracksBonuses[_ARG_0_ + 1].CasterMinionMagicResistance,
    CasterHPBonus = ChaosBarracksBonuses[_ARG_0_ + 1].CasterHPBonus,
    CasterDamageBonus = ChaosBarracksBonuses[_ARG_0_ + 1].CasterDamageBonus,
    CasterExpGiven = ChaosBarracksBonuses[_ARG_0_ + 1].CasterExpGiven,
    CasterGoldGiven = ChaosBarracksBonuses[_ARG_0_ + 1].CasterGoldGiven,
    SuperMinionArmor = ChaosBarracksBonuses[_ARG_0_ + 1].SuperMinionArmor,
    SuperMinionMagicResistance = ChaosBarracksBonuses[_ARG_0_ + 1].SuperMinionMagicResistance,
    SuperHPBonus = ChaosBarracksBonuses[_ARG_0_ + 1].SuperHPBonus,
    SuperDamageBonus = ChaosBarracksBonuses[_ARG_0_ + 1].SuperDamageBonus,
    SuperExpGiven = ChaosBarracksBonuses[_ARG_0_ + 1].SuperExpGiven,
    SuperGoldGiven = ChaosBarracksBonuses[_ARG_0_ + 1].SuperGoldGiven,
    ExperienceRadius = TableForBarrack.ExpRadius
  }
  return ReturnTable
end
function DeactivateCorrectStructure(_ARG_0_, _ARG_1_, _ARG_2_)
  if _ARG_0_ == TEAM_ORDER then
  else
  end
  if _ARG_2_ == FRONT_TOWER then
    ChaosBuildingStatus[_ARG_1_ + 1].Turret3 = false
    SetInvulnerable(GetTurret(_ARG_0_, _ARG_1_, MIDDLE_TOWER), false)
    SetTargetable(GetTurret(_ARG_0_, _ARG_1_, MIDDLE_TOWER), true)
  elseif _ARG_2_ == MIDDLE_TOWER then
    ChaosBuildingStatus[_ARG_1_ + 1].Turret2 = false
    SetInvulnerable(GetTurret(_ARG_0_, _ARG_1_, BACK_TOWER), false)
    SetTargetable(GetTurret(_ARG_0_, _ARG_1_, BACK_TOWER), true)
  elseif _ARG_2_ == BACK_TOWER then
    ChaosBuildingStatus[_ARG_1_ + 1].Turret1 = false
    SetInvulnerable(GetDampener(_ARG_0_, _ARG_1_), false)
    SetTargetable(GetDampener(_ARG_0_, _ARG_1_), true)
  elseif _ARG_2_ == HQ_TOWER2 then
    ChaosBuildingStatus.HQTower2 = false
    if ChaosBuildingStatus.HQTower1 == false then
      SetInvulnerable(GetHQ(_ARG_0_), false)
      SetTargetable(GetHQ(_ARG_0_), true)
    end
  elseif _ARG_2_ == HQ_TOWER1 then
    ChaosBuildingStatus.HQTower1 = false
    if ChaosBuildingStatus.HQTower2 == false then
      SetInvulnerable(GetHQ(_ARG_0_), false)
      SetTargetable(GetHQ(_ARG_0_), true)
    end
  end
end
function GetLuaBarracks(_ARG_0_, _ARG_1_)
  if _ARG_0_ == TEAM_ORDER then
  else
  end
  return ChaosBarracksBonuses[_ARG_1_ + 1]
end
function GetDisableMinionSpawnTime(_ARG_0_, _ARG_1_)
  barrack = GetLuaBarracks(_ARG_1_, _ARG_0_)
  return DISABLE_MINION_SPAWN_BASE_TIME + DISABLE_MINION_SPAWN_MAG_TIME * barrack.NumOfSpawnDisables
end
function DisableBarracksSpawn(_ARG_0_, _ARG_1_)
  cLangBarracks = GetBarracks(_ARG_1_, _ARG_0_)
  luaBarrack = GetLuaBarracks(_ARG_1_, _ARG_0_)
  SetDisableMinionSpawn(cLangBarracks, GetDisableMinionSpawnTime(_ARG_0_, _ARG_1_))
  luaBarrack.NumOfSpawnDisables = luaBarrack.NumOfSpawnDisables + 1
end
BonusesCounter = 0
function ApplyBarracksDestructionBonuses(_ARG_0_, _ARG_1_)
  BonusesCounter = BonusesCounter + 1
  for _FORV_5_ = 1, 3 do
    if _ARG_0_ == TEAM_ORDER then
      OrderBarracksBonuses[_FORV_5_].MeleeHPBonus = OrderBarracksBonuses[_FORV_5_].MeleeHPBonus + MELEE_HEALTH_INHIBITOR
      OrderBarracksBonuses[_FORV_5_].MeleeDamageBonus = OrderBarracksBonuses[_FORV_5_].MeleeDamageBonus + MELEE_DAMAGE_INHIBITOR
      OrderBarracksBonuses[_FORV_5_].ArcherHPBonus = OrderBarracksBonuses[_FORV_5_].ArcherHPBonus + ARCHER_HEALTH_INHIBITOR
      OrderBarracksBonuses[_FORV_5_].ArcherDamageBonus = OrderBarracksBonuses[_FORV_5_].ArcherDamageBonus + ARCHER_DAMAGE_INHIBITOR
      OrderBarracksBonuses[_FORV_5_].CasterHPBonus = OrderBarracksBonuses[_FORV_5_].CasterHPBonus + CASTER_HEALTH_INHIBITOR
      OrderBarracksBonuses[_FORV_5_].CasterDamageBonus = OrderBarracksBonuses[_FORV_5_].CasterDamageBonus + CASTER_DAMAGE_INHIBITOR
      OrderBarracksBonuses[_FORV_5_].SuperHPBonus = OrderBarracksBonuses[_FORV_5_].SuperHPBonus + SUPER_HEALTH_INHIBITOR
      OrderBarracksBonuses[_FORV_5_].SuperDamageBonus = OrderBarracksBonuses[_FORV_5_].SuperDamageBonus + SUPER_DAMAGE_INHIBITOR
      OrderBarracksBonuses[_FORV_5_].MeleeExpGiven = OrderBarracksBonuses[_FORV_5_].MeleeExpGiven - MELEE_EXP_INHIBITOR
      OrderBarracksBonuses[_FORV_5_].MeleeGoldGiven = OrderBarracksBonuses[_FORV_5_].MeleeGoldGiven - MELEE_GOLD_INHIBITOR
      OrderBarracksBonuses[_FORV_5_].ArcherExpGiven = OrderBarracksBonuses[_FORV_5_].ArcherExpGiven - ARCHER_EXP_INHIBITOR
      OrderBarracksBonuses[_FORV_5_].ArcherGoldGiven = OrderBarracksBonuses[_FORV_5_].MeleeGoldGiven - ARCHER_GOLD_INHIBITOR
      OrderBarracksBonuses[_FORV_5_].CasterExpGiven = OrderBarracksBonuses[_FORV_5_].CasterExpGiven - CASTER_EXP_INHIBITOR
      OrderBarracksBonuses[_FORV_5_].CasterGoldGiven = OrderBarracksBonuses[_FORV_5_].MeleeGoldGiven - CASTER_EXP_INHIBITOR
      OrderBarracksBonuses[_FORV_5_].SuperExpGiven = OrderBarracksBonuses[_FORV_5_].SuperExpGiven - SUPER_EXP_INHIBITOR
      OrderBarracksBonuses[_FORV_5_].SuperGoldGiven = OrderBarracksBonuses[_FORV_5_].MeleeGoldGiven - SUPER_EXP_INHIBITOR
      if _FORV_5_ == _ARG_1_ + 1 then
        totalNumberOfChaosBarracks = totalNumberOfChaosBarracks - 1
        OrderBarracksBonuses[_FORV_5_].WillSpawnSuperMinion = 1
      end
    elseif _ARG_0_ == TEAM_CHAOS then
      ChaosBarracksBonuses[_FORV_5_].MeleeHPBonus = ChaosBarracksBonuses[_FORV_5_].MeleeHPBonus + MELEE_HEALTH_INHIBITOR
      ChaosBarracksBonuses[_FORV_5_].MeleeDamageBonus = ChaosBarracksBonuses[_FORV_5_].MeleeDamageBonus + MELEE_DAMAGE_INHIBITOR
      ChaosBarracksBonuses[_FORV_5_].ArcherHPBonus = ChaosBarracksBonuses[_FORV_5_].ArcherHPBonus + ARCHER_HEALTH_INHIBITOR
      ChaosBarracksBonuses[_FORV_5_].ArcherDamageBonus = ChaosBarracksBonuses[_FORV_5_].ArcherDamageBonus + ARCHER_DAMAGE_INHIBITOR
      ChaosBarracksBonuses[_FORV_5_].CasterHPBonus = ChaosBarracksBonuses[_FORV_5_].CasterHPBonus + CASTER_HEALTH_INHIBITOR
      ChaosBarracksBonuses[_FORV_5_].CasterDamageBonus = ChaosBarracksBonuses[_FORV_5_].CasterDamageBonus + CASTER_DAMAGE_INHIBITOR
      ChaosBarracksBonuses[_FORV_5_].SuperHPBonus = ChaosBarracksBonuses[_FORV_5_].SuperHPBonus + SUPER_HEALTH_INHIBITOR
      ChaosBarracksBonuses[_FORV_5_].SuperDamageBonus = ChaosBarracksBonuses[_FORV_5_].SuperDamageBonus + SUPER_DAMAGE_INHIBITOR
      ChaosBarracksBonuses[_FORV_5_].MeleeExpGiven = ChaosBarracksBonuses[_FORV_5_].MeleeExpGiven - MELEE_EXP_INHIBITOR
      ChaosBarracksBonuses[_FORV_5_].MeleeGoldGiven = ChaosBarracksBonuses[_FORV_5_].MeleeGoldGiven - MELEE_GOLD_INHIBITOR
      ChaosBarracksBonuses[_FORV_5_].ArcherExpGiven = ChaosBarracksBonuses[_FORV_5_].ArcherExpGiven - ARCHER_EXP_INHIBITOR
      ChaosBarracksBonuses[_FORV_5_].ArcherGoldGiven = ChaosBarracksBonuses[_FORV_5_].MeleeGoldGiven - ARCHER_GOLD_INHIBITOR
      ChaosBarracksBonuses[_FORV_5_].CasterExpGiven = ChaosBarracksBonuses[_FORV_5_].CasterExpGiven - CASTER_EXP_INHIBITOR
      ChaosBarracksBonuses[_FORV_5_].CasterGoldGiven = ChaosBarracksBonuses[_FORV_5_].MeleeGoldGiven - CASTER_EXP_INHIBITOR
      ChaosBarracksBonuses[_FORV_5_].SuperExpGiven = ChaosBarracksBonuses[_FORV_5_].SuperExpGiven - SUPER_EXP_INHIBITOR
      ChaosBarracksBonuses[_FORV_5_].SuperGoldGiven = ChaosBarracksBonuses[_FORV_5_].MeleeGoldGiven - SUPER_EXP_INHIBITOR
      if _FORV_5_ == _ARG_1_ + 1 then
        totalNumberOfOrderBarracks = totalNumberOfOrderBarracks - 1
        ChaosBarracksBonuses[_FORV_5_].WillSpawnSuperMinion = 1
      end
    end
  end
end
ReductionCounter = 0
function ApplyBarracksRespawnReductions(_ARG_0_, _ARG_1_)
  ReductionCounter = ReductionCounter + 1
  for _FORV_5_ = 1, 3 do
    if _ARG_0_ == TEAM_ORDER then
      OrderBarracksBonuses[_FORV_5_].MeleeHPBonus = OrderBarracksBonuses[_FORV_5_].MeleeHPBonus - MELEE_HEALTH_INHIBITOR
      OrderBarracksBonuses[_FORV_5_].MeleeDamageBonus = OrderBarracksBonuses[_FORV_5_].MeleeDamageBonus - MELEE_DAMAGE_INHIBITOR
      OrderBarracksBonuses[_FORV_5_].ArcherHPBonus = OrderBarracksBonuses[_FORV_5_].ArcherHPBonus - ARCHER_HEALTH_INHIBITOR
      OrderBarracksBonuses[_FORV_5_].ArcherDamageBonus = OrderBarracksBonuses[_FORV_5_].ArcherDamageBonus - ARCHER_DAMAGE_INHIBITOR
      OrderBarracksBonuses[_FORV_5_].CasterHPBonus = OrderBarracksBonuses[_FORV_5_].CasterHPBonus - CASTER_HEALTH_INHIBITOR
      OrderBarracksBonuses[_FORV_5_].CasterDamageBonus = OrderBarracksBonuses[_FORV_5_].CasterDamageBonus - CASTER_DAMAGE_INHIBITOR
      OrderBarracksBonuses[_FORV_5_].SuperHPBonus = OrderBarracksBonuses[_FORV_5_].SuperHPBonus - SUPER_HEALTH_INHIBITOR
      OrderBarracksBonuses[_FORV_5_].SuperDamageBonus = OrderBarracksBonuses[_FORV_5_].SuperDamageBonus - SUPER_DAMAGE_INHIBITOR
      OrderBarracksBonuses[_FORV_5_].MeleeExpGiven = OrderBarracksBonuses[_FORV_5_].MeleeExpGiven + MELEE_EXP_INHIBITOR
      OrderBarracksBonuses[_FORV_5_].MeleeGoldGiven = OrderBarracksBonuses[_FORV_5_].MeleeGoldGiven + MELEE_GOLD_INHIBITOR
      OrderBarracksBonuses[_FORV_5_].ArcherExpGiven = OrderBarracksBonuses[_FORV_5_].ArcherExpGiven + ARCHER_EXP_INHIBITOR
      OrderBarracksBonuses[_FORV_5_].ArcherGoldGiven = OrderBarracksBonuses[_FORV_5_].MeleeGoldGiven + ARCHER_GOLD_INHIBITOR
      OrderBarracksBonuses[_FORV_5_].CasterExpGiven = OrderBarracksBonuses[_FORV_5_].CasterExpGiven + CASTER_EXP_INHIBITOR
      OrderBarracksBonuses[_FORV_5_].CasterGoldGiven = OrderBarracksBonuses[_FORV_5_].MeleeGoldGiven + CASTER_EXP_INHIBITOR
      OrderBarracksBonuses[_FORV_5_].SuperExpGiven = OrderBarracksBonuses[_FORV_5_].SuperExpGiven + SUPER_EXP_INHIBITOR
      OrderBarracksBonuses[_FORV_5_].SuperGoldGiven = OrderBarracksBonuses[_FORV_5_].MeleeGoldGiven + SUPER_EXP_INHIBITOR
      if _FORV_5_ == _ARG_1_ + 1 then
        totalNumberOfChaosBarracks = totalNumberOfChaosBarracks + 1
        OrderBarracksBonuses[_FORV_5_].WillSpawnSuperMinion = 0
      end
    elseif _ARG_0_ == TEAM_CHAOS then
      ChaosBarracksBonuses[_FORV_5_].MeleeHPBonus = ChaosBarracksBonuses[_FORV_5_].MeleeHPBonus - MELEE_HEALTH_INHIBITOR
      ChaosBarracksBonuses[_FORV_5_].MeleeDamageBonus = ChaosBarracksBonuses[_FORV_5_].MeleeDamageBonus - MELEE_DAMAGE_INHIBITOR
      ChaosBarracksBonuses[_FORV_5_].ArcherHPBonus = ChaosBarracksBonuses[_FORV_5_].ArcherHPBonus - ARCHER_HEALTH_INHIBITOR
      ChaosBarracksBonuses[_FORV_5_].ArcherDamageBonus = ChaosBarracksBonuses[_FORV_5_].ArcherDamageBonus - ARCHER_DAMAGE_INHIBITOR
      ChaosBarracksBonuses[_FORV_5_].CasterHPBonus = ChaosBarracksBonuses[_FORV_5_].CasterHPBonus - CASTER_HEALTH_INHIBITOR
      ChaosBarracksBonuses[_FORV_5_].CasterDamageBonus = ChaosBarracksBonuses[_FORV_5_].CasterDamageBonus - CASTER_DAMAGE_INHIBITOR
      ChaosBarracksBonuses[_FORV_5_].SuperHPBonus = ChaosBarracksBonuses[_FORV_5_].SuperHPBonus - SUPER_HEALTH_INHIBITOR
      ChaosBarracksBonuses[_FORV_5_].SuperDamageBonus = ChaosBarracksBonuses[_FORV_5_].SuperDamageBonus - SUPER_DAMAGE_INHIBITOR
      ChaosBarracksBonuses[_FORV_5_].MeleeExpGiven = ChaosBarracksBonuses[_FORV_5_].MeleeExpGiven + MELEE_EXP_INHIBITOR
      ChaosBarracksBonuses[_FORV_5_].MeleeGoldGiven = ChaosBarracksBonuses[_FORV_5_].MeleeGoldGiven + MELEE_GOLD_INHIBITOR
      ChaosBarracksBonuses[_FORV_5_].ArcherExpGiven = ChaosBarracksBonuses[_FORV_5_].ArcherExpGiven + ARCHER_EXP_INHIBITOR
      ChaosBarracksBonuses[_FORV_5_].ArcherGoldGiven = ChaosBarracksBonuses[_FORV_5_].MeleeGoldGiven + ARCHER_GOLD_INHIBITOR
      ChaosBarracksBonuses[_FORV_5_].CasterExpGiven = ChaosBarracksBonuses[_FORV_5_].CasterExpGiven + CASTER_EXP_INHIBITOR
      ChaosBarracksBonuses[_FORV_5_].CasterGoldGiven = ChaosBarracksBonuses[_FORV_5_].MeleeGoldGiven + CASTER_EXP_INHIBITOR
      ChaosBarracksBonuses[_FORV_5_].SuperExpGiven = ChaosBarracksBonuses[_FORV_5_].SuperExpGiven + SUPER_EXP_INHIBITOR
      ChaosBarracksBonuses[_FORV_5_].SuperGoldGiven = ChaosBarracksBonuses[_FORV_5_].MeleeGoldGiven + SUPER_EXP_INHIBITOR
      if _FORV_5_ == _ARG_1_ + 1 then
        totalNumberOfOrderBarracks = totalNumberOfOrderBarracks + 1
        ChaosBarracksBonuses[_FORV_5_].WillSpawnSuperMinion = 0
      end
    end
  end
end
ReactiveCounter = 0
function BarrackReactiveEvent(_ARG_0_, _ARG_1_)
  ReactiveCounter = ReactiveCounter + 1
  dampener = GetDampener(_ARG_0_, _ARG_1_)
  SetInvulnerable(dampener, false)
  SetTargetable(dampener, true)
  ApplyBarracksRespawnReductions(OppositeTeam(_ARG_0_), _ARG_1_)
end
DisactivatedCounter = 0
function HandleDestroyedObject(_ARG_0_)
  HQType = GetHQType(_ARG_0_)
  if HQType == ORDER_HQ or HQType == CHAOS_HQ then
    if HQType == CHAOS_HQ then
      EndOfGameCeremony(TEAM_ORDER, _ARG_0_)
    else
      EndOfGameCeremony(TEAM_CHAOS, _ARG_0_)
    end
    return
  end
  if IsDampener(_ARG_0_) then
    barrack = GetLinkedBarrack(_ARG_0_)
    barrackTeam = GetTeamID(barrack)
    barrackLane = GetLane(_ARG_0_)
    DisableBarracksSpawn(barrackLane, barrackTeam)
    SetDampenerState(_ARG_0_, DampenerRegenerationState)
    SetInvulnerable(_ARG_0_, true)
    SetTargetable(_ARG_0_, false)
    DisactivatedCounter = DisactivatedCounter + 1
    for _FORV_4_ = RIGHT_LANE, LEFT_LANE do
      if GetTurret(barrackTeam, _FORV_4_, HQ_TOWER1) ~= Nil then
        SetInvulnerable(GetTurret(barrackTeam, _FORV_4_, HQ_TOWER1), false)
        SetTargetable(GetTurret(barrackTeam, _FORV_4_, HQ_TOWER1), true)
      else
      end
      if GetTurret(barrackTeam, _FORV_4_, HQ_TOWER2) ~= Nil then
        SetInvulnerable(GetTurret(barrackTeam, _FORV_4_, HQ_TOWER2), false)
        SetTargetable(GetTurret(barrackTeam, _FORV_4_, HQ_TOWER2), true)
      else
      end
    end
    HQTurretAttackable = _FOR_
    if barrackTeam == TEAM_CHAOS then
    else
    end
    ApplyBarracksDestructionBonuses(TEAM_CHAOS, barrackLane)
  end
  if IsTurretAI(_ARG_0_) then
    DeactivateCorrectStructure(GetTeamID(_ARG_0_), GetObjectLaneId(_ARG_0_), (GetTurretPosition(_ARG_0_)))
    return
  end
  if GetDampenerType(_ARG_0_) > -1 then
    if GetDampenerType(_ARG_0_) % TEAM_CHAOS >= RIGHT_LANE and GetDampenerType(_ARG_0_) % TEAM_CHAOS <= LEFT_LANE then
      ChaosBuildingStatus[GetDampenerType(_ARG_0_) % TEAM_CHAOS + 1].Barracks = false
    else
      OrderBuildingStatus[GetDampenerType(_ARG_0_) % TEAM_CHAOS - TEAM_ORDER + 1].Barracks = false
    end
  else
    Log("Could not find Linking barracks!")
  end
  return true
end
