DoLuaShared("GlobalLevelScript")
EVENT_STAGE_WELCOME_TIME = 30
EVENT_STAGE_PREANNOUNCE_TIME = 45
EVENT_STAGE_MINIONS_SPAWNED_TIME = 75
EOG_SCOREBOARD_PHASE_DELAY_TIME = 1.2
MAX_MINIONS_EVER = 180
TEAM_UNKNOWN = 0
TEAM_ORDER = 100
TEAM_CHAOS = 200
TEAM_NEUTRAL = 300
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
INITIAL_TIME_TO_SPAWN = 75
CANNON_MINION_SPAWN_FREQUENCY = 3
INCREASE_CANNON_RATE_TIMER = 1200
INCREASE_CANNON_RATE_TIMER2 = 2100
MINION_HEALTH_DENIAL_PERCENT = 0
SMITE_CHARGE_START = 90
UPGRADE_MINION_TIMER = 90
UPGRADE_MINION_ITERATIONS_FOR_LATE_SCALING = 6
TOWER_DAMAGE_PER_UPGRADE_MINION_ITERATION = 3
EXP_GIVEN_RADIUS = 1400
GOLD_GIVEN_RADIUS = 1250
DISABLE_MINION_SPAWN_BASE_TIME = 300
DISABLE_MINION_SPAWN_MAG_TIME = 0
CHAOS_INHIBITOR_RESPAWN_ANIMATION_DURATION = 11.67
ORDER_INHIBITOR_RESPAWN_ANIMATION_DURATION = 11
LAST_WAVE = -1
SPECIAL_MINION_MODE = "none"
HQTurretAttackable = false
UpgradedMinionIterations = 0
DoLuaLevel("BBLuaConversionLibrary")
SpawnTable = {
  WaveSpawnRate = 30000,
  SingleMinionSpawnDelay = 800,
  ExpRadius = EXP_GIVEN_RADIUS,
  GoldRadius = GOLD_GIVEN_RADIUS
}
MeleeDefaultMinionInfo = {
  DefaultNumPerWave = 3,
  Armor = 0,
  ArmorUpgrade = 1,
  MagicResistance = 0,
  MagicResistanceUpgrade = 0.625,
  HPBonus = 0,
  HPUpgrade = 13,
  HPUpgradeGrowth = 0.2,
  HPUpgradeLate = TOWER_DAMAGE_PER_UPGRADE_MINION_ITERATION * 2,
  HPUpgradeGrowthLate = 0,
  HPInhibitor = 0,
  DamageBonus = 0,
  DamageUpgrade = 0.5,
  DamageInhibitor = 0,
  ExpGiven = 64,
  ExpBonus = 0,
  ExpUpgrade = 0,
  ExpInhibitor = 0,
  GoldGiven = 19.875,
  GoldBonus = 0,
  GoldUpgrade = 0.125,
  GoldInhibitor = 0,
  GoldShared = 0,
  GoldShareUpgrade = 0,
  GoldMaximumBonus = 12,
  LocalGoldGiven = 0,
  LocalGoldBonus = 0
}
CasterDefaultMinionInfo = {
  DefaultNumPerWave = 3,
  Armor = 0,
  ArmorUpgrade = 0.625,
  MagicResistance = 0,
  MagicResistanceUpgrade = 1,
  HPBonus = 0,
  HPUpgrade = 10,
  HPUpgradeGrowth = 0.2,
  HPUpgradeLate = TOWER_DAMAGE_PER_UPGRADE_MINION_ITERATION * 1,
  HPUpgradeGrowthLate = 0,
  HPInhibitor = 0,
  DamageBonus = 0,
  DamageUpgrade = 1,
  DamageInhibitor = 0,
  ExpGiven = 32,
  ExpBonus = 0,
  ExpUpgrade = 0,
  ExpInhibitor = 0,
  GoldGiven = 16.875,
  GoldBonus = 0,
  GoldUpgrade = 0.125,
  GoldInhibitor = 0,
  GoldShared = 0,
  GoldShareUpgrade = 0,
  GoldMaximumBonus = 8,
  LocalGoldGiven = 0,
  LocalGoldBonus = 0
}
CannonDefaultMinionInfo = {
  DefaultNumPerWave = 0,
  Armor = 0,
  ArmorUpgrade = 1.5,
  MagicResistance = 0,
  MagicResistanceUpgrade = 1.5,
  HPBonus = 0,
  HPUpgrade = 23,
  HPUpgradeGrowth = 0.3,
  HPUpgradeLate = TOWER_DAMAGE_PER_UPGRADE_MINION_ITERATION * 3,
  HPUpgradeGrowthLate = 0,
  HPInhibitor = 0,
  DamageBonus = 0,
  DamageUpgrade = 1.5,
  DamageInhibitor = 0,
  ExpGiven = 100,
  ExpBonus = 0,
  ExpUpgrade = 0,
  ExpInhibitor = 0,
  GoldGiven = 44.65,
  GoldBonus = 0,
  GoldUpgrade = 0.35,
  GoldInhibitor = 0,
  GoldShared = 0,
  GoldShareUpgrade = 0,
  GoldMaximumBonus = 30,
  LocalGoldGiven = 0,
  LocalGoldBonus = 0
}
SuperDefaultMinionInfo = {
  DefaultNumPerWave = 0,
  Armor = 0,
  ArmorUpgrade = 0,
  MagicResistance = 0,
  MagicResistanceUpgrade = 0,
  HPBonus = 0,
  HPUpgrade = 100,
  HPUpgradeGrowth = 0,
  HPUpgradeLate = 0,
  HPUpgradeGrowthLate = 0,
  HPInhibitor = 0,
  DamageBonus = 0,
  DamageUpgrade = 5,
  DamageInhibitor = 0,
  ExpGiven = 100,
  ExpBonus = 0,
  ExpUpgrade = 0,
  ExpInhibitor = 0,
  GoldGiven = 44.65,
  GoldBonus = 0,
  GoldUpgrade = 0.35,
  GoldInhibitor = 0,
  GoldShared = 0,
  GoldShareUpgrade = 0,
  GoldMaximumBonus = 30,
  LocalGoldGiven = 0,
  LocalGoldBonus = 0
}
OrderMeleeMinionInfo = {
  MinionName = "SRU_OrderMinionMelee",
  DefaultInfo = MeleeDefaultMinionInfo
}
ChaosMeleeMinionInfo = {
  MinionName = "SRU_ChaosMinionMelee",
  DefaultInfo = MeleeDefaultMinionInfo
}
OrderCasterMinionInfo = {
  MinionName = "SRU_OrderMinionRanged",
  DefaultInfo = CasterDefaultMinionInfo
}
ChaosCasterMinionInfo = {
  MinionName = "SRU_ChaosMinionRanged",
  DefaultInfo = CasterDefaultMinionInfo
}
OrderCannonMinionInfo = {
  MinionName = "SRU_OrderMinionSiege",
  DefaultInfo = CannonDefaultMinionInfo
}
ChaosCannonMinionInfo = {
  MinionName = "SRU_ChaosMinionSiege",
  DefaultInfo = CannonDefaultMinionInfo
}
OrderSuperMinionInfo = {
  MinionName = "SRU_OrderMinionSuper",
  DefaultInfo = SuperDefaultMinionInfo
}
ChaosSuperMinionInfo = {
  MinionName = "SRU_ChaosMinionSuper",
  DefaultInfo = SuperDefaultMinionInfo
}
DefaultBarrackInfo = {
  IsDestroyed = false,
  NumOfSpawnDisables = 0,
  WillSpawnSuperMinion = 0,
  SpawnOrderMinionNames = {
    "Super",
    "Melee",
    "Cannon",
    "Caster"
  }
}
DefaultOrderMinionInfoTable = {
  Melee = OrderMeleeMinionInfo,
  Caster = OrderCasterMinionInfo,
  Cannon = OrderCannonMinionInfo,
  Super = OrderSuperMinionInfo
}
DefaultChaosMinionInfoTable = {
  Melee = ChaosMeleeMinionInfo,
  Caster = ChaosCasterMinionInfo,
  Cannon = ChaosCannonMinionInfo,
  Super = ChaosSuperMinionInfo
}
OrderBarrack0 = {DefaultInfo = DefaultBarrackInfo, DefaultMinionInfoTable = DefaultOrderMinionInfoTable}
OrderBarrack1 = {DefaultInfo = DefaultBarrackInfo, DefaultMinionInfoTable = DefaultOrderMinionInfoTable}
OrderBarrack2 = {DefaultInfo = DefaultBarrackInfo, DefaultMinionInfoTable = DefaultOrderMinionInfoTable}
ChaosBarrack0 = {DefaultInfo = DefaultBarrackInfo, DefaultMinionInfoTable = DefaultChaosMinionInfoTable}
ChaosBarrack1 = {DefaultInfo = DefaultBarrackInfo, DefaultMinionInfoTable = DefaultChaosMinionInfoTable}
ChaosBarrack2 = {DefaultInfo = DefaultBarrackInfo, DefaultMinionInfoTable = DefaultChaosMinionInfoTable}
BASE_AMBIENT_GOLD = 10.2
dynamicAmbientGold = 4
DYNAMIC_AMBIENT_GOLD_INCREASE_PER_10 = 0.017
function AppendTable(A0_0, A1_1, A2_2, A3_3)
  local L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10
  if A1_1 ~= nil then
    L4_4 = type
    L5_5 = A1_1
    L4_4 = L4_4(L5_5)
    if L4_4 == "table" then
      L4_4, L5_5 = nil, nil
      if A0_0 == nil then
        A0_0 = L6_6
      end
      for L9_9, L10_10 in L6_6(L7_7) do
        if A2_2 == true and type(L10_10) == "table" then
          A0_0[L9_9] = AppendTable(A0_0[L9_9], L10_10, A3_3, A3_3)
        else
          A0_0[L9_9] = L10_10
        end
      end
    end
  end
  return A0_0
end
function InitBarrackInfo(A0_11)
  local L1_12, L2_13, L3_14, L4_15, L5_16, L6_17, L7_18, L8_19, L9_20
  L1_12 = AppendTable
  L2_13 = A0_11
  L1_12 = L1_12(L2_13, L3_14, L4_15, L5_16)
  A0_11 = L1_12
  L1_12 = AppendTable
  L2_13 = A0_11.MinionInfoTable
  L1_12 = L1_12(L2_13, L3_14, L4_15, L5_16)
  A0_11.MinionInfoTable = L1_12
  L1_12 = A0_11.MinionInfoTable
  if L1_12 ~= nil then
    L1_12 = A0_11.MinionInfoTable
    L2_13 = nil
    for L7_18, L8_19 in L4_15(L5_16) do
      L9_20 = L1_12[L7_18]
      if L9_20.DefaultInfo ~= nil then
        AppendTable(L9_20, L9_20.DefaultInfo, true, true)
        L9_20.NumPerWave = L9_20.DefaultNumPerWave
        L9_20.GoldGivenBase = L9_20.GoldGiven
        L9_20.ExpGivenBase = L9_20.ExpGiven
      end
    end
  end
  L1_12 = A0_11.Overrides
  if L1_12 ~= nil then
    L1_12, L2_13 = nil, nil
    for L6_17, L7_18 in L3_14(L4_15) do
      L8_19 = type
      L9_20 = A0_11[L6_17]
      L8_19 = L8_19(L9_20)
      if L8_19 == "table" then
        L8_19 = type
        L9_20 = L7_18
        L8_19 = L8_19(L9_20)
        if L8_19 == "table" then
          L8_19 = AppendTable
          L9_20 = A0_11[L6_17]
          L8_19(L9_20, L7_18, true, true)
        end
      else
        L8_19 = type
        L9_20 = L7_18
        L8_19 = L8_19(L9_20)
        if L8_19 ~= "table" then
          A0_11[L6_17] = L7_18
        end
      end
    end
  end
  return A0_11
end
OrderBarracksBonuses = {
  InitBarrackInfo(OrderBarrack0),
  InitBarrackInfo(OrderBarrack1),
  InitBarrackInfo(OrderBarrack2)
}
ChaosBarracksBonuses = {
  InitBarrackInfo(ChaosBarrack0),
  InitBarrackInfo(ChaosBarrack1),
  InitBarrackInfo(ChaosBarrack2)
}
NeutralMinionNames = {
  "SRU_Dragon",
  "SRU_Krug",
  "SRU_KrugMini",
  "SRU_Red",
  "SRU_RedMini",
  "SRU_Razorbeak",
  "SRU_RazorbeakMini",
  "SRU_Murkwolf",
  "SRU_MurkwolfMini",
  "SRU_Blue",
  "SRU_BlueMini",
  "SRU_Gromp",
  "SRU_Baron"
}
function CreateLaneBuildingTable()
  local L0_21, L1_22
  L0_21 = {}
  L0_21.Turret3 = true
  L0_21.Turret2 = true
  L0_21.Turret1 = true
  L0_21.Barracks = true
  return L0_21
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
function PreloadBarrackCharacters(A0_23)
  local L1_24, L2_25
  for _FORV_6_, _FORV_7_ in pairs(A0_23.DefaultMinionInfoTable) do
    if _FORV_7_.PreloadedCharacter == nil then
      _FORV_7_.PreloadedCharacter = 1
      PreloadCharacter(_FORV_7_.MinionName)
    end
  end
end
function SuppressMinionSpawnForBarrack(A0_26)
  for _FORV_4_, _FORV_5_ in pairs(DefaultBarrackInfo.SpawnOrderMinionNames) do
    A0_26.MinionInfoTable[_FORV_5_].NumPerWave = 0
  end
end
function SetMutatorGlobals()
  local L0_27, L1_28
end
function OnLevelInit()
  local L0_29, L1_30, L2_31, L3_32, L4_33, L5_34, L6_35
  for L5_34, L6_35 in L2_31(L3_32) do
    PreloadBarrackCharacters(L6_35)
  end
  for L5_34, L6_35 in L2_31(L3_32) do
    PreloadBarrackCharacters(L6_35)
  end
  L2_31()
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L6_35 = L3_32()
  L2_31(L3_32, L4_33, L5_34, L6_35, L3_32())
  L3_32(L4_33)
  L3_32()
  L3_32(L4_33)
end
function OnLevelInitServer()
  InitTimer("UpgradeMinionTimerInitial", INITIAL_TIME_TO_SPAWN, false)
  InitTimer("UpgradeMinionTimer", UPGRADE_MINION_TIMER, true)
  InitTimer("IncreaseCannonMinionSpawnRate", INCREASE_CANNON_RATE_TIMER, false)
  InitTimer("IncreaseCannonMinionSpawnRateAgain", INCREASE_CANNON_RATE_TIMER2, false)
  InitTimer("AllowDamageOnBuildings", 10, false)
  InitTimer("InitialUpdateAmbientGold", 720, false)
end
function OnPostLevelLoad()
  local L0_36, L1_37, L2_38, L3_39, L4_40, L5_41, L6_42, L7_43, L8_44, L9_45, L10_46, L11_47
  L0_36 = GetMutatorParameterString
  L0_36 = L0_36(L1_37)
  L1_37(L2_38)
  L1_37()
  for L4_40 = RIGHT_LANE, LEFT_LANE do
    L5_41 = GetDampener
    L6_42 = TEAM_ORDER
    L7_43 = L4_40
    L5_41 = L5_41(L6_42, L7_43)
    L6_42 = SetDampenerRespawnAnimationDuration
    L7_43 = L5_41
    L6_42(L7_43, L8_44)
    L6_42 = GetDampener
    L7_43 = TEAM_CHAOS
    L6_42 = L6_42(L7_43, L8_44)
    L5_41 = L6_42
    L6_42 = SetDampenerRespawnAnimationDuration
    L7_43 = L5_41
    L6_42(L7_43, L8_44)
    L6_42 = SetLaneExposed
    L7_43 = TEAM_ORDER
    L6_42(L7_43, L8_44, L9_45)
    L6_42 = SetLaneExposed
    L7_43 = TEAM_CHAOS
    L6_42(L7_43, L8_44, L9_45)
    L6_42 = 0
    L7_43 = 0
    for L11_47 = BACK_TOWER, FRONT_TOWER do
      orderTurret = GetTurret(TEAM_ORDER, L4_40, L11_47)
      if orderTurret ~= nil then
        L6_42 = L6_42 + 1
      end
      chaosTurret = GetTurret(TEAM_CHAOS, L4_40, L11_47)
      if chaosTurret ~= nil then
        L7_43 = L7_43 + 1
      end
    end
    L11_47 = L6_42
    L8_44(L9_45, L10_46, L11_47)
    L11_47 = L7_43
    L8_44(L9_45, L10_46, L11_47)
  end
  L1_37(L2_38, L3_39)
  L1_37(L2_38, L3_39)
  L1_37(L2_38, L3_39)
  L1_37(L2_38, L3_39)
end
function OnLevelReset()
  local L0_48
  L0_48 = OnPostLevelLoad
  L0_48()
  L0_48 = InitTimer
  L0_48("AllowDamageOnBuildings", 10, false)
  L0_48 = GetHQ
  L0_48 = L0_48(TEAM_ORDER)
  SetInvulnerable(L0_48, true)
  SetTargetable(L0_48, false)
  L0_48 = GetHQ(TEAM_CHAOS)
  SetInvulnerable(L0_48, true)
  SetTargetable(L0_48, false)
end
function OnGameStartup()
  local L0_49
  L0_49 = LuaForEachChampion
  L0_49(TEAM_UNKNOWN, "ApplySRBuffs")
  L0_49 = 0
  OrderHQPos = GetKeyLocation(L0_49, TEAM_ORDER)
  ChaosHQPos = GetKeyLocation(L0_49, TEAM_CHAOS)
end
function ApplySRBuffs(A0_50)
  ApplyPersistentBuff(A0_50, "S6Test_RegionRules", false, 1, 1)
  ApplyPersistentBuff(A0_50, "SRChampionBuff", false, 1, 1)
end
function ApplyBaseBuffToAllChampions()
  LuaForEachChampion(TEAM_CHAOS, "ApplyBaseBuffChaos")
  LuaForEachChampion(TEAM_ORDER, "ApplyBaseBuffOrder")
end
function ApplyBaseBuffChaos(A0_51)
  ApplyBaseBuff(A0_51, ChaosHQPos)
end
function ApplyBaseBuffOrder(A0_52)
  ApplyBaseBuff(A0_52, OrderHQPos)
end
baseBuffRadiusSquared = 12250000
BUFF_Aura = 1
function ApplyBaseBuff(A0_53, A1_54)
  if (GetPosition(A0_53) - A1_54):lengthSq() < baseBuffRadiusSquared then
    SpellBuffAdd(A0_53, A0_53, "S5Test_BaseBuff", BUFF_Aura, 1, 0.5, nil)
  end
end
function OppositeTeam(A0_55)
  if A0_55 == TEAM_CHAOS then
    return TEAM_ORDER
  else
    return TEAM_CHAOS
  end
end
function UpgradeMinionTimerInitial()
  UpgradeMinionTimer()
  InitTimer("UpgradeMinionTimer", UPGRADE_MINION_TIMER, true)
end
function UpgradeMinionTimer()
  local L0_56, L1_57, L2_58, L3_59, L4_60, L5_61, L6_62, L7_63, L8_64, L9_65, L10_66, L11_67
  UpgradedMinionIterations = L1_57
  L1_57(L2_58, L3_59)
  for L4_60 = 1, 2 do
    if L4_60 == 1 then
      L0_56 = OrderBarracksBonuses
    else
      L0_56 = ChaosBarracksBonuses
    end
    for L8_64 = 1, 3 do
      L9_65, L10_66 = nil, nil
      L11_67 = L0_56[L8_64]
      L11_67 = L11_67.MinionInfoTable
      for _FORV_15_, _FORV_16_ in pairs(L11_67) do
        if UpgradedMinionIterations >= UPGRADE_MINION_ITERATIONS_FOR_LATE_SCALING then
        end
        _FORV_16_.HPBonus = _FORV_16_.HPBonus + (_FORV_16_.HPUpgrade + _FORV_16_.HPUpgradeLate)
        _FORV_16_.HPUpgrade = _FORV_16_.HPUpgrade + (_FORV_16_.HPUpgradeGrowth + _FORV_16_.HPUpgradeGrowthLate)
        _FORV_16_.DamageBonus = _FORV_16_.DamageBonus + _FORV_16_.DamageUpgrade
        _FORV_16_.GoldBonus = _FORV_16_.GoldBonus + _FORV_16_.GoldUpgrade
        if _FORV_16_.GoldBonus > _FORV_16_.GoldMaximumBonus then
          _FORV_16_.GoldBonus = _FORV_16_.GoldMaximumBonus
        end
        _FORV_16_.LocalGoldBonus = _FORV_16_.LocalGoldBonus + _FORV_16_.GoldShareUpgrade
        _FORV_16_.Armor = _FORV_16_.Armor
        _FORV_16_.MagicResistance = _FORV_16_.MagicResistance
        _FORV_16_.ExpBonus = _FORV_16_.ExpBonus + _FORV_16_.ExpUpgrade
        _FORV_16_.GoldGiven = _FORV_16_.GoldBonus + _FORV_16_.GoldGivenBase
        _FORV_16_.LocalGoldGiven = _FORV_16_.LocalGoldBonus + _FORV_16_.GoldShared
        _FORV_16_.ExpGiven = _FORV_16_.ExpBonus + _FORV_16_.ExpGivenBase
      end
    end
  end
end
function AllowDamageOnBuildings()
  local L0_68, L1_69, L2_70, L3_71, L4_72, L5_73, L6_74, L7_75, L8_76, L9_77
  for L3_71 = RIGHT_LANE, LEFT_LANE do
    L4_72 = -1
    L5_73 = -1
    for L9_77 = FRONT_TOWER, BACK_TOWER, -1 do
      orderTurret = GetTurret(TEAM_ORDER, L3_71, L9_77)
      if orderTurret ~= nil and L4_72 == -1 then
        L4_72 = L9_77
      end
      chaosTurret = GetTurret(TEAM_CHAOS, L3_71, L9_77)
      if chaosTurret ~= nil and L5_73 == -1 then
        L5_73 = L9_77
      end
    end
    for L9_77 = BACK_TOWER, HQ_TOWER1 do
      orderTurret = GetTurret(TEAM_ORDER, L3_71, L9_77)
      if orderTurret ~= nil then
        if L9_77 == L4_72 then
          SetInvulnerable(orderTurret, false)
          SetTargetable(orderTurret, true)
        else
          SetInvulnerable(orderTurret, true)
          SetNotTargetableToTeam(orderTurret, true, TEAM_CHAOS)
        end
      end
      chaosTurret = GetTurret(TEAM_CHAOS, L3_71, L9_77)
      if chaosTurret ~= nil then
        if L9_77 == L5_73 then
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
function ResetToDefaultWaveCounts(A0_78)
  local L1_79, L2_80
  for _FORV_6_, _FORV_7_ in pairs(A0_78) do
    _FORV_7_.NumPerWave = _FORV_7_.DefaultNumPerWave
  end
end
function ClearCurrentWaveCounts(A0_81)
  local L1_82, L2_83
  for _FORV_6_, _FORV_7_ in pairs(A0_81) do
    _FORV_7_.NumPerWave = 0
  end
end
function GetInitSpawnInfo(A0_84, A1_85)
  local L2_86, L3_87, L4_88
  L2_86 = 0
  L3_87 = TEAM_ORDER
  if A1_85 == L3_87 then
    L3_87 = OrderBarracksBonuses
    L4_88 = A0_84 + 1
    L2_86 = L3_87[L4_88]
  else
    L3_87 = ChaosBarracksBonuses
    L4_88 = A0_84 + 1
    L2_86 = L3_87[L4_88]
  end
  L3_87 = {}
  L4_88 = SpawnTable
  L4_88 = L4_88.WaveSpawnRate
  L3_87.WaveSpawnRate = L4_88
  L4_88 = SpawnTable
  L4_88 = L4_88.SingleMinionSpawnDelay
  L3_87.SingleMinionSpawnDelay = L4_88
  L4_88 = L2_86.IsDestroyed
  L3_87.IsDestroyed = L4_88
  L4_88 = L2_86.MinionInfoTable
  L3_87.MinionInfoTable = L4_88
  ReturnTable = L3_87
  L3_87 = ReturnTable
  return L3_87
end
function GetMinionSpawnInfo(A0_89, A1_90, A2_91, A3_92, A4_93)
  local L5_94, L6_95, L7_96
  L5_94 = 0
  L6_95 = TEAM_ORDER
  if A3_92 == L6_95 then
    L6_95 = OrderBarracksBonuses
    L7_96 = A0_89 + 1
    L5_94 = L6_95[L7_96]
  else
    L6_95 = ChaosBarracksBonuses
    L7_96 = A0_89 + 1
    L5_94 = L6_95[L7_96]
  end
  L6_95 = L5_94.MinionInfoTable
  L6_95 = L6_95.Super
  L7_96 = L5_94.MinionInfoTable
  L7_96 = L7_96.Cannon
  ResetToDefaultWaveCounts(L5_94.MinionInfoTable)
  if A1_90 % CANNON_MINION_SPAWN_FREQUENCY == 0 then
    L7_96.NumPerWave = L7_96.NumPerWave + 1
  end
  if A4_93 ~= LAST_WAVE then
    BARRACKSCOUNT = 6
    totalMinionsRemaining = MAX_MINIONS_EVER - GetTotalTeamMinionsSpawned()
    if totalMinionsRemaining <= BARRACKSCOUNT * 7 then
      if 0 >= totalMinionsRemaining then
        SPECIAL_MINION_MODE = "None"
      elseif totalMinionsRemaining >= BARRACKSCOUNT then
        SPECIAL_MINION_MODE = "2MeleeMinions"
      else
        SPECIAL_MINION_MODE = "None"
      end
    else
      SPECIAL_MINION_MODE = ""
    end
    LAST_WAVE = A4_93
  end
  if L5_94.WillSpawnSuperMinion == 1 then
    if A3_92 == TEAM_ORDER and totalNumberOfChaosBarracks == 0 or A3_92 == TEAM_CHAOS and totalNumberOfOrderBarracks == 0 then
      L6_95.NumPerWave = 2
    else
      L6_95.NumPerWave = 1
    end
    L7_96.NumPerWave = 0
  end
  if SPECIAL_MINION_MODE == "2MeleeMinions" then
    ClearCurrentWaveCounts(L5_94.MinionInfoTable)
    L6_95.NumPerWave = L5_94.MinionInfoTable.Super.NumPerWave
    L5_94.MinionInfoTable.Melee.NumPerWave = math.max(2 - L5_94.MinionInfoTable.Super.NumPerWave, 0)
  elseif SPECIAL_MINION_MODE == "None" then
    ClearCurrentWaveCounts(L5_94.MinionInfoTable)
  end
  if GetMutatorParameterBool("SuppressMinionSpawn") then
    SuppressMinionSpawnForBarrack(L5_94)
  end
  ReturnTable = {
    NewFormat = true,
    SpawnOrderMinionNames = L5_94.SpawnOrderMinionNames,
    IsDestroyed = L5_94.IsDestroyed,
    ExperienceRadius = SpawnTable.ExpRadius,
    GoldRadius = SpawnTable.GoldRadius,
    MinionInfoTable = L5_94.MinionInfoTable
  }
  return ReturnTable
end
function DeactivateCorrectStructure(A0_97, A1_98, A2_99)
  local L3_100, L4_101
  L4_101 = TEAM_ORDER
  if A0_97 == L4_101 then
    L3_100 = OrderBuildingStatus
  else
    L3_100 = ChaosBuildingStatus
  end
  L4_101 = FRONT_TOWER
  if A2_99 == L4_101 then
    L4_101 = A1_98 + 1
    L4_101 = L3_100[L4_101]
    L4_101.Turret3 = false
    L4_101 = GetTurret
    L4_101 = L4_101(A0_97, A1_98, MIDDLE_TOWER)
    SetInvulnerable(L4_101, false)
    SetTargetable(L4_101, true)
    SetLaneTowerCount(A0_97, A1_98, 2)
  else
    L4_101 = MIDDLE_TOWER
    if A2_99 == L4_101 then
      L4_101 = A1_98 + 1
      L4_101 = L3_100[L4_101]
      L4_101.Turret2 = false
      L4_101 = GetTurret
      L4_101 = L4_101(A0_97, A1_98, BACK_TOWER)
      SetInvulnerable(L4_101, false)
      SetTargetable(L4_101, true)
      SetLaneTowerCount(A0_97, A1_98, 1)
    else
      L4_101 = BACK_TOWER
      if A2_99 == L4_101 then
        L4_101 = A1_98 + 1
        L4_101 = L3_100[L4_101]
        L4_101.Turret1 = false
        L4_101 = GetDampener
        L4_101 = L4_101(A0_97, A1_98)
        SetInvulnerable(L4_101, false)
        SetTargetable(L4_101, true)
        SetLaneTowerCount(A0_97, A1_98, 0)
      else
        L4_101 = HQ_TOWER2
        if A2_99 == L4_101 then
          L3_100.HQTower2 = false
          L4_101 = L3_100.HQTower1
          if L4_101 == false then
            L4_101 = GetHQ
            L4_101 = L4_101(A0_97)
            SetInvulnerable(L4_101, false)
            SetTargetable(L4_101, true)
          end
        else
          L4_101 = HQ_TOWER1
          if A2_99 == L4_101 then
            L3_100.HQTower1 = false
            L4_101 = L3_100.HQTower2
            if L4_101 == false then
              L4_101 = GetHQ
              L4_101 = L4_101(A0_97)
              SetInvulnerable(L4_101, false)
              SetTargetable(L4_101, true)
            end
          end
        end
      end
    end
  end
end
function GetLuaBarracks(A0_102, A1_103)
  local L2_104, L3_105, L4_106
  L3_105 = TEAM_ORDER
  if A0_102 == L3_105 then
    L3_105 = OrderBarracksBonuses
    L4_106 = A1_103 + 1
    L2_104 = L3_105[L4_106]
  else
    L3_105 = ChaosBarracksBonuses
    L4_106 = A1_103 + 1
    L2_104 = L3_105[L4_106]
  end
  return L2_104
end
function GetDisableMinionSpawnTime(A0_107, A1_108)
  barrack = GetLuaBarracks(A1_108, A0_107)
  return DISABLE_MINION_SPAWN_BASE_TIME + DISABLE_MINION_SPAWN_MAG_TIME * barrack.NumOfSpawnDisables
end
function DisableBarracksSpawn(A0_109, A1_110)
  cLangBarracks = GetBarracks(A1_110, A0_109)
  luaBarrack = GetLuaBarracks(A1_110, A0_109)
  SetDisableMinionSpawn(cLangBarracks, GetDisableMinionSpawnTime(A0_109, A1_110))
  luaBarrack.NumOfSpawnDisables = luaBarrack.NumOfSpawnDisables + 1
end
BonusesCounter = 0
function ApplyBarracksDestructionBonuses(A0_111, A1_112)
  local L2_113, L3_114, L4_115, L5_116, L6_117, L7_118, L8_119, L9_120, L10_121
  BonusesCounter = L2_113
  for L5_116 = 1, 3 do
    L6_117, L7_118 = nil, nil
    L8_119 = TEAM_ORDER
    if A0_111 == L8_119 then
      L7_118 = TEAM_CHAOS
      L6_117 = OrderBarracksBonuses
      L8_119 = ChaosBarracksBonuses
      EnemyBarracks = L8_119
    else
      L7_118 = TEAM_ORDER
      L6_117 = ChaosBarracksBonuses
      L8_119 = OrderBarracksBonuses
      EnemyBarracks = L8_119
    end
    L8_119, L9_120 = nil, nil
    L10_121 = L6_117[L5_116]
    L10_121 = L10_121.MinionInfoTable
    for _FORV_14_, _FORV_15_ in pairs(L10_121) do
      _FORV_15_.HPBonus = _FORV_15_.HPBonus + _FORV_15_.HPInhibitor
      _FORV_15_.DamageBonus = _FORV_15_.DamageBonus + _FORV_15_.DamageInhibitor
      _FORV_15_.ExpGiven = _FORV_15_.ExpGiven - _FORV_15_.ExpInhibitor
      _FORV_15_.GoldGiven = _FORV_15_.GoldGiven - _FORV_15_.GoldInhibitor
    end
    if L5_116 == A1_112 + 1 then
      L6_117[L5_116].WillSpawnSuperMinion = 1
      if A0_111 == TEAM_ORDER then
        totalNumberOfChaosBarracks = totalNumberOfChaosBarracks - 1
      else
        totalNumberOfOrderBarracks = totalNumberOfOrderBarracks - 1
      end
    end
  end
end
ReductionCounter = 0
function ApplyBarracksRespawnReductions(A0_122, A1_123)
  local L2_124, L3_125, L4_126, L5_127, L6_128, L7_129, L8_130, L9_131, L10_132, L11_133, L12_134, L13_135, L14_136, L15_137, L16_138, L17_139, L18_140
  ReductionCounter = L2_124
  for L5_127 = 1, 3 do
    L6_128, L7_129, L8_130 = nil, nil, nil
    L9_131 = TEAM_ORDER
    if A0_122 == L9_131 then
      L8_130 = TEAM_CHAOS
      L6_128 = OrderBarracksBonuses
      L7_129 = ChaosBarracksBonuses
    else
      L8_130 = TEAM_ORDER
      L6_128 = ChaosBarracksBonuses
      L7_129 = OrderBarracksBonuses
    end
    L9_131, L10_132 = nil, nil
    L11_133 = L6_128[L5_127]
    L11_133 = L11_133.MinionInfoTable
    for L15_137, L16_138 in L12_134(L13_135) do
      L17_139 = L16_138.HPBonus
      L18_140 = L16_138.HPInhibitor
      L17_139 = L17_139 - L18_140
      L16_138.HPBonus = L17_139
      L17_139 = L16_138.DamageBonus
      L18_140 = L16_138.DamageInhibitor
      L17_139 = L17_139 - L18_140
      L16_138.DamageBonus = L17_139
      L17_139 = L16_138.ExpGiven
      L18_140 = L16_138.ExpInhibitor
      L17_139 = L17_139 + L18_140
      L16_138.ExpGiven = L17_139
      L17_139 = L16_138.GoldGiven
      L18_140 = L16_138.GoldInhibitor
      L17_139 = L17_139 + L18_140
      L16_138.GoldGiven = L17_139
    end
    if L5_127 == L13_135 then
      if A0_122 == L13_135 then
        totalNumberOfChaosBarracks = L13_135
      else
        totalNumberOfOrderBarracks = L13_135
      end
      L13_135.WillSpawnSuperMinion = 0
      L16_138 = false
      L13_135(L14_136, L15_137, L16_138)
    end
    if L12_134 == 3 then
      HQ = L13_135
      L13_135(L14_136, L15_137)
      L13_135(L14_136, L15_137)
      for L16_138 = RIGHT_LANE, LEFT_LANE do
        L17_139 = GetTurret
        L18_140 = L8_130
        L17_139 = L17_139(L18_140, L16_138, HQ_TOWER1)
        L18_140 = GetTurret
        L18_140 = L18_140(L8_130, L16_138, HQ_TOWER2)
        if L17_139 ~= Nil then
          SetInvulnerable(L17_139, true)
          SetNotTargetableToTeam(L17_139, true, A0_122)
        end
        if L18_140 ~= Nil then
          SetInvulnerable(L18_140, true)
          SetNotTargetableToTeam(L18_140, true, A0_122)
        end
      end
    end
  end
end
ReactiveCounter = 0
function BarrackReactiveEvent(A0_141, A1_142)
  local L2_143
  ReactiveCounter = ReactiveCounter + 1
  L2_143 = OppositeTeam(A0_141)
  dampener = GetDampener(A0_141, A1_142)
  SetInvulnerable(dampener, false)
  SetTargetable(dampener, true)
  ApplyBarracksRespawnReductions(L2_143, A1_142)
end
function DisableSuperMinions(A0_144, A1_145)
  local L2_146, L3_147
  if A0_144 == TEAM_ORDER then
    L2_146 = OrderBarracksBonuses[A1_145 + 1]
    L3_147 = ChaosBarracksBonuses[A1_145 + 1]
  elseif A0_144 == TEAM_CHAOS then
    L2_146 = ChaosBarracksBonuses[A1_145 + 1]
    L3_147 = OrderBarracksBonuses[A1_145 + 1]
  end
  if L3_147 then
    L3_147.WillSpawnSuperMinion = 0
  end
end
function OnJumpToMidGameCheat(A0_148)
  local L1_149
  L1_149 = GetTurret
  L1_149 = L1_149(TEAM_ORDER, 1, HQ_TOWER1)
  if A0_148 == 0 then
    ApplyPersistentBuff(L1_149, "DebugMidGameBuff", false, 1, 1)
  else
    ApplyPersistentBuff(L1_149, "DebugLateGameBuff", false, 1, 1)
  end
end
function EqualizeDragonsCheat()
  local L0_150
  L0_150 = GetTurret
  L0_150 = L0_150(TEAM_ORDER, 1, 0)
  ApplyPersistentBuff(L0_150, "DebugEqualizeDragons", false, 1, 1)
end
function OnBarracksToggled(A0_151)
  local L1_152
  if A0_151 == 0 then
  end
end
DisactivatedCounter = 0
function HandleDestroyedObject(A0_153)
  local L1_154, L2_155, L3_156
  L1_154 = GetHQType
  L2_155 = A0_153
  L1_154 = L1_154(L2_155)
  HQType = L1_154
  L1_154 = HQType
  L2_155 = ORDER_HQ
  if L1_154 ~= L2_155 then
    L1_154 = HQType
    L2_155 = CHAOS_HQ
  elseif L1_154 == L2_155 then
    L1_154 = HQType
    L2_155 = CHAOS_HQ
    if L1_154 == L2_155 then
      L1_154 = EndOfGameCeremony
      L2_155 = TEAM_ORDER
      L3_156 = A0_153
      L1_154(L2_155, L3_156)
    else
      L1_154 = EndOfGameCeremony
      L2_155 = TEAM_CHAOS
      L3_156 = A0_153
      L1_154(L2_155, L3_156)
    end
    return
  end
  L1_154 = IsDampener
  L2_155 = A0_153
  L1_154 = L1_154(L2_155)
  if L1_154 then
    L1_154 = GetLinkedBarrack
    L2_155 = A0_153
    L1_154 = L1_154(L2_155)
    barrack = L1_154
    L1_154 = GetTeamID
    L2_155 = barrack
    L1_154 = L1_154(L2_155)
    barrackTeam = L1_154
    L1_154 = GetLane
    L2_155 = A0_153
    L1_154 = L1_154(L2_155)
    barrackLane = L1_154
    L1_154 = SetLaneExposed
    L2_155 = barrackTeam
    L3_156 = barrackLane
    L1_154(L2_155, L3_156, true)
    L1_154 = DisableBarracksSpawn
    L2_155 = barrackLane
    L3_156 = barrackTeam
    L1_154(L2_155, L3_156)
    L1_154 = SetDampenerState
    L2_155 = A0_153
    L3_156 = DampenerRegenerationState
    L1_154(L2_155, L3_156)
    L1_154 = SetInvulnerable
    L2_155 = A0_153
    L3_156 = true
    L1_154(L2_155, L3_156)
    L1_154 = SetTargetable
    L2_155 = A0_153
    L3_156 = false
    L1_154(L2_155, L3_156)
    L1_154 = DisactivatedCounter
    L1_154 = L1_154 + 1
    DisactivatedCounter = L1_154
    L1_154 = GetTurret
    L2_155 = barrackTeam
    L3_156 = 1
    L1_154 = L1_154(L2_155, L3_156, HQ_TOWER1)
    L2_155 = GetTurret
    L3_156 = barrackTeam
    L2_155 = L2_155(L3_156, 1, HQ_TOWER2)
    L3_156 = Nil
    if L1_154 ~= L3_156 then
      L3_156 = SetInvulnerable
      L3_156(L1_154, false)
      L3_156 = SetTargetable
      L3_156(L1_154, true)
    end
    L3_156 = Nil
    if L2_155 ~= L3_156 then
      L3_156 = SetInvulnerable
      L3_156(L2_155, false)
      L3_156 = SetTargetable
      L3_156(L2_155, true)
    end
    L3_156 = Nil
    if L1_154 == L3_156 then
      L3_156 = Nil
      if L2_155 == L3_156 then
        L3_156 = GetHQ
        L3_156 = L3_156(barrackTeam)
        SetInvulnerable(L3_156, false)
        SetTargetable(L3_156, true)
      end
    end
    L3_156 = nil
    if barrackTeam == TEAM_CHAOS then
      L3_156 = TEAM_ORDER
    else
      L3_156 = TEAM_CHAOS
    end
    ApplyBarracksDestructionBonuses(L3_156, barrackLane)
  end
  L1_154 = IsTurretAI
  L2_155 = A0_153
  L1_154 = L1_154(L2_155)
  if L1_154 then
    L1_154 = GetTeamID
    L2_155 = A0_153
    L1_154 = L1_154(L2_155)
    L2_155 = GetObjectLaneId
    L3_156 = A0_153
    L2_155 = L2_155(L3_156)
    L3_156 = GetTurretPosition
    L3_156 = L3_156(A0_153)
    DeactivateCorrectStructure(L1_154, L2_155, L3_156)
    return
  end
  L1_154 = GetDampenerType
  L2_155 = A0_153
  L1_154 = L1_154(L2_155)
  if L1_154 > -1 then
    L2_155 = 0
    L3_156 = TEAM_ORDER
    if L1_154 % TEAM_CHAOS >= RIGHT_LANE and L1_154 % TEAM_CHAOS <= LEFT_LANE then
      L2_155 = ChaosBarracksBonuses[L1_154 % TEAM_CHAOS + 1]
      ChaosBuildingStatus[L1_154 % TEAM_CHAOS + 1].Barracks = false
    else
      L3_156 = TEAM_CHAOS
      L2_155 = OrderBarracksBonuses[L1_154 % TEAM_CHAOS - TEAM_ORDER + 1]
      OrderBuildingStatus[L1_154 % TEAM_CHAOS - TEAM_ORDER + 1].Barracks = false
    end
  else
    L2_155 = Log
    L3_156 = "Could not find Linking barracks!"
    L2_155(L3_156)
  end
  L2_155 = true
  return L2_155
end
function SetLaneExposed(A0_157, A1_158, A2_159)
  if A0_157 == TEAM_ORDER then
    if A1_158 == LEFT_LANE then
      SetWorldVar("OrderTopLaneExposed", A2_159)
    elseif A1_158 == RIGHT_LANE then
      SetWorldVar("OrderBotLaneExposed", A2_159)
    else
      SetWorldVar("OrderMidLaneExposed", A2_159)
    end
  elseif A1_158 == LEFT_LANE then
    SetWorldVar("ChaosTopLaneExposed", A2_159)
  elseif A1_158 == RIGHT_LANE then
    SetWorldVar("ChaosBotLaneExposed", A2_159)
  else
    SetWorldVar("ChaosMidLaneExposed", A2_159)
  end
end
function SetLaneTowerCount(A0_160, A1_161, A2_162)
  if A0_160 == TEAM_ORDER then
    if A1_161 == LEFT_LANE then
      SetWorldVar("OrderTopLaneTowerCount", A2_162)
    elseif A1_161 == RIGHT_LANE then
      SetWorldVar("OrderBotLaneTowerCount", A2_162)
    else
      SetWorldVar("OrderMidLaneTowerCount", A2_162)
    end
  elseif A1_161 == LEFT_LANE then
    SetWorldVar("ChaosTopLaneTowerCount", A2_162)
  elseif A1_161 == RIGHT_LANE then
    SetWorldVar("ChaosBotLaneTowerCount", A2_162)
  else
    SetWorldVar("ChaosMidLaneTowerCount", A2_162)
  end
end
function IncreaseCannonMinionSpawnRate()
  local L1_163
  L1_163 = 2
  CANNON_MINION_SPAWN_FREQUENCY = L1_163
end
function IncreaseCannonMinionSpawnRateAgain()
  local L1_164
  L1_164 = 1
  CANNON_MINION_SPAWN_FREQUENCY = L1_164
end
function InitialUpdateAmbientGold()
  UpdateAmbientGold()
  InitTimer("UpdateAmbientGold", 10, true)
end
function UpdateAmbientGold()
  local L0_165, L1_166, L2_167, L3_168, L4_169, L5_170, L6_171, L7_172, L8_173, L9_174, L10_175, L11_176, L12_177, L13_178, L14_179, L15_180, L16_181
  L0_165 = dynamicAmbientGold
  L1_166 = DYNAMIC_AMBIENT_GOLD_INCREASE_PER_10
  L0_165 = L0_165 + L1_166
  dynamicAmbientGold = L0_165
  L0_165 = BASE_AMBIENT_GOLD
  baseAmbientGold = L0_165
  L0_165 = dynamicAmbientGold
  additionalAmbientGold = L0_165
  L0_165 = additionalAmbientGold
  if L0_165 == 0 then
    return
  end
  L0_165 = GetPlayers
  L1_166 = TEAM_CHAOS
  L0_165 = L0_165(L1_166)
  L1_166 = -1
  L2_167 = 0
  L3_168 = {}
  L4_169, L5_170 = nil, nil
  for L9_174, L10_175 in L6_171(L7_172) do
    if L9_174 > L1_166 then
      L1_166 = L9_174
    end
    L11_176 = GetPlayerNetWorth
    L11_176 = L11_176(L12_177)
    netWorth = L11_176
    L11_176 = table
    L11_176 = L11_176.insert
    L13_178.Player = L10_175
    L13_178.Worth = L14_179
    L11_176(L12_177, L13_178)
    L11_176 = netWorth
    L2_167 = L2_167 + L11_176
    L11_176 = SetPlayerAmbientGold
    L11_176(L12_177, L13_178)
  end
  L1_166 = L1_166 + 1
  L9_174 = {}
  L10_175, L11_176 = nil, nil
  for L15_180, L16_181 in L12_177(L13_178) do
    netWorth = GetPlayerNetWorth(L16_181)
    table.insert(L9_174, {Player = L16_181, Worth = netWorth})
    SetPlayerAmbientGold(L16_181, baseAmbientGold)
  end
  if L12_177 < 10 then
    return
  end
  L12_177(L13_178, L14_179)
  L12_177(L13_178, L14_179)
  L15_180 = L3_168[5]
  L15_180 = L15_180.Worth
  L15_180 = L12_177 / L15_180
  L16_181 = L9_174[4]
  L16_181 = L16_181.Worth
  L16_181 = L13_178 / L16_181
  SetPlayerAmbientGold(L3_168[4].Player, additionalAmbientGold * (L14_179 / (L14_179 + L15_180)) + baseAmbientGold)
  SetPlayerAmbientGold(L3_168[5].Player, additionalAmbientGold * (L15_180 / (L14_179 + L15_180)) + baseAmbientGold)
  SetPlayerAmbientGold(L9_174[4].Player, additionalAmbientGold * (L16_181 / (L16_181 + L13_178 / L9_174[5].Worth)) + baseAmbientGold)
  SetPlayerAmbientGold(L9_174[5].Player, additionalAmbientGold * (L13_178 / L9_174[5].Worth / (L16_181 + L13_178 / L9_174[5].Worth)) + baseAmbientGold)
end
function PostGameSetup(A0_182)
  POST_GAME_EVENTS = {}
end
function PostGameUpdate(A0_183, A1_184)
  local L2_185, L3_186, L4_187, L5_188, L6_189, L7_190
  for L7_190, _FORV_8_ in L4_187(L5_188) do
    if A0_183 > _FORV_8_.delay then
      ClientSide_CameraMoveCameraFromCurrentPositionToPoint(_FORV_8_.cameraLocation, _FORV_8_.travelTime)
      if _FORV_8_.soundFile then
        ClientSide_PlaySoundFile(_FORV_8_.soundFile)
      end
      table.remove(POST_GAME_EVENTS, L7_190)
      break
    end
  end
end
