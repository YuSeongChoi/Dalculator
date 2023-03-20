//
//  ItemVO.swift
//  Dalculator
//
//  Created by YuSeongChoi on 2023/03/14.
//

import Foundation

import CodableWrappers

typealias ItemVO = [ItemVOElement]

// MARK: - ChampionVOElement
struct ItemVOElement: Codable, Hashable {
    /// 이름
    @FallbackDecoding<EmptyString>
    var name: String = ""
    /// 착용 레벨
    @FallbackDecoding<EmptyInt>
    var level: Int = 0
    /// 희귀도
    var rarity: ItemRarityType?
    /// 아이템 타입
    var itype: ItemType?
    /// 세트 이름
    @FallbackDecoding<EmptyArray>
    var setOf: [String] = []
    /// 장비 옵션
    let attrs: ChampionVOAttrs
    /// 장비 아이디
    @FallbackDecoding<EmptyInt>
    var id: Int = 0
    /// 장비 이미지 이름
    @FallbackDecoding<EmptyString>
    var image: String = ""
    /// 공격 옵션 발동 조건 및 효과
    let branch: [Branch]?
    /// 시너지 옵션 발동 조건 및 효과
    let gives: [Give]?
    /// 솔라리스 무기 옵션
    let exclusive: [Exclusive]?
    /// 솔라리스 오즈마 환영극단 2막
    var content: ItemContentType?
    /// 윈드시어
    @FallbackDecoding<EmptyArray>
    var who: [String] = []
    /// 재질
    @FallbackDecoding<EmptyString>
    var material: String = ""
    /// 카드 부위
    @FallbackDecoding<EmptyArray>
    var part: [String] = []
    /// 아티팩트 색상
    @FallbackDecoding<EmptyString>
    var artiColor: String = ""

    enum CodingKeys: String, CodingKey {
        case name, level, rarity, itype, setOf, attrs, id, image, branch, gives, exclusive, content, who, material, part
        case artiColor = "ArtiColor"
    }
    
    enum ItemRarityType: String, Codable {
        case epic = "Epic"
        case unique = "Unique"
        case rare = "Rare"
        case uncommon = "Uncommon"
    }
    
    enum ItemContentType: String, Codable {
        case solaris = "솔라리스"
        case ozma = "오즈마"
        case illusion = "환영극단 2막"
    }
    
}

// MARK: - ChampionVOAttrs
struct ChampionVOAttrs: Codable, Hashable {
    let atkPh, atkMg, strInc, intInc: Int?
    let strn, intl: Int?
    let speedCast: Double?
    let critMgPct, accu: Int?
    let misc: [String]?
    let dmgInc, dmgAdd, defPh, defMg: Int?
    let accuPct, critPhPct, vit: Int?
    let speedAtk: Double?
    let eltype: Elementtype?
    let elLght, elFire, elIce, elDark: Int?
    let resFire, atkPhInc, atkMgInc, psi: Int?
    let skLV, skbAdd: [String: Int]?
    let critPh, cdmgInc, critMg, hpmax: Int?
    let mpmax: Int?
    let speedMove: Double?
    let resIce, defPhPct, defMgPct, eldmgFire: Int?
    let eldmgIce, skInc: Int?
    let skHit: [String: Int]?
    let skCool: SkCool?
    let skVal: [String: Int]?
    let resLght, resDark, eldmgLght, targetDef: Int?
    let eldmgDark: Int?

    enum CodingKeys: String, CodingKey {
        case atkPh = "atk_ph"
        case atkMg = "atk_mg"
        case strInc = "str_inc"
        case intInc = "int_inc"
        case strn, intl
        case speedCast = "speed_cast"
        case critMgPct = "crit_mg_pct"
        case accu = "Accu"
        case misc
        case dmgInc = "dmg_inc"
        case dmgAdd = "dmg_add"
        case defPh = "def_ph"
        case defMg = "def_mg"
        case accuPct = "AccuPct"
        case critPhPct = "crit_ph_pct"
        case vit
        case speedAtk = "speed_atk"
        case eltype
        case elLght = "el_lght"
        case elFire = "el_fire"
        case elIce = "el_ice"
        case elDark = "el_dark"
        case resFire = "res_fire"
        case atkPhInc = "atk_ph_inc"
        case atkMgInc = "atk_mg_inc"
        case psi
        case skLV = "sk_lv"
        case skbAdd = "skb_add"
        case critPh = "crit_ph"
        case cdmgInc = "cdmg_inc"
        case critMg = "crit_mg"
        case hpmax, mpmax
        case speedMove = "speed_move"
        case resIce = "res_ice"
        case defPhPct = "def_ph_pct"
        case defMgPct = "def_mg_pct"
        case eldmgFire = "eldmg_fire"
        case eldmgIce = "eldmg_ice"
        case skInc = "sk_inc"
        case skHit = "sk_hit"
        case skCool = "sk_cool"
        case skVal = "sk_val"
        case resLght = "res_lght"
        case resDark = "res_dark"
        case eldmgLght = "eldmg_lght"
        case targetDef = "target_def"
        case eldmgDark = "eldmg_dark"
    }
    
    enum Elementtype: String, Codable {
        case dark = "Dark"
        case fire = "Fire"
        case ice = "Ice"
        case light = "Light"
    }
}

// MARK: - SkCool
struct SkCool: Codable, Hashable {
    let all: Int
}

// MARK: - Branch
struct Branch: Codable, Hashable {
    let when: String
    let attrs: [String: Double]
    let maxRepeat: Int?
}

// MARK: - Exclusive
struct Exclusive: Codable, Hashable {
    let name: ExclusiveName
    let label: Label
    let children: [Child]
    
    enum ExclusiveName: String, Codable {
        case hp = "HP"
        case solaris = "Solaris"
    }
    
    enum Label: String, Codable {
        case the30초마다 = "30초마다"
        case 내HP가 = "내 HP가"
    }
}

// MARK: - Child
struct Child: Codable, Hashable {
    let name: ChildName
    let attrs: ChildAttrs
    
    enum ChildName: String, Codable {
        case the80미만 = "80% 미만"
        case the80이상 = "80% 이상"
        case 공격력15 = "공격력 +15%"
        case 모속강32 = "모속강 +32"
    }
}

// MARK: - ChildAttrs
struct ChildAttrs: Codable, Hashable {
    let dmgAdd, atkPhInc, atkMgInc, elFire: Int?
    let elIce, elLght, elDark: Int?

    enum CodingKeys: String, CodingKey {
        case dmgAdd = "dmg_add"
        case atkPhInc = "atk_ph_inc"
        case atkMgInc = "atk_mg_inc"
        case elFire = "el_fire"
        case elIce = "el_ice"
        case elLght = "el_lght"
        case elDark = "el_dark"
    }
}

// MARK: - Give
struct Give: Codable, Hashable {
    let attrs: [String: Int]
    let when: String?
}

enum ItemType: String, Codable {
    /// 머리어깨
    case shoulder = "머리어깨"
    /// 상의
    case coat = "상의"
    /// 하의
    case pants = "하의"
    /// 벨트
    case belt = "벨트"
    /// 신발
    case shoes = "신발"
    /// 목걸이
    case necklace = "목걸이"
    /// 팔찌
    case bracelet = "팔찌"
    /// 반지
    case ring = "반지"
    /// 보조장비
    case supequip = "보조장비"
    /// 칭호
    case title = "칭호"
    /// 크리쳐
    case creature = "크리쳐"
    /// 봉인석
    case sealstone = "봉인석"
    /// 정수
    case essence = "정수"
    /// 카드
    case card = "카드"
    /// 아티팩트
    case artifact = "아티팩트"
    /// 무기아바타
    case weaponavavtar = "무기아바타"
    /// 오라
    case ora = "오라"
    
    /// 건틀릿
    case gauntlet = "건틀릿"
    /// 너클
    case nuckle = "너클"
    /// 광검
    case lightsword = "광검"
    /// 대검
    case bigsword = "대검"
    /// 소검
    case smallsword = "소검"
    /// 도
    case sword = "도"
    /// 둔기
    case bluntsword = "둔기"
    /// 권투글러브
    case glove = "권투글러브"
    /// 클로
    case claw = "클로"
    /// 통파
    case tonpa = "통파"
    /// 리볼버
    case revolver = "리볼버"
    /// 머스켓
    case muscket = "머스켓"
    /// 보우건
    case bowgun = "보우건"
    /// 핸드캐넌
    case handcannon = "핸드캐넌"
    /// 자동권총
    case autogun = "자동권총"
    /// 낫
    case sickle = "낫"
    /// 배틀액스
    case battleaxe = "배틀액스"
    /// 십자가
    case cross = "십자가"
    /// 염주
    case rosary = "염주"
    /// 토템
    case totem = "토템"
    /// 로드
    case lord = "로드"
    /// 봉
    case pole = "봉"
    /// 스태프
    case staff = "스태프"
    /// 스탭
    case stab = "스탭"
    /// 빗자루
    case broom = "빗자루"
    /// 창
    case spear = "창"
    /// 락소드
    case rocksword = "락소드"
    /// 윙블레이드
    case wingblade = "윙블레이드"
}

enum WeaponType: String {
    /// 건틀릿
    case gauntlet = "건틀릿"
    /// 너클
    case nuckle = "너클"
    /// 광검
    case lightsword = "광검"
    /// 대검
    case bigsword = "대검"
    /// 소검
    case smallsword = "소검"
    /// 도
    case sword = "도"
    /// 둔기
    case bluntsword = "둔기"
    /// 권투글러브
    case glove = "권투글러브"
    /// 클로
    case claw = "클로"
    /// 통파
    case tonpa = "통파"
    /// 리볼버
    case revolver = "리볼버"
    /// 머스켓
    case muscket = "머스켓"
    /// 보우건
    case bowgun = "보우건"
    /// 핸드캐넌
    case handcannon = "핸드캐넌"
    /// 자동권총
    case autogun = "자동권총"
    /// 낫
    case sickle = "낫"
    /// 배틀액스
    case battleaxe = "배틀액스"
    /// 십자가
    case cross = "십자가"
    /// 염주
    case rosary = "염주"
    /// 토템
    case totem = "토템"
    /// 로드
    case lord = "로드"
    /// 봉
    case pole = "봉"
    /// 스태프
    case staff = "스태프"
    /// 빗자루
    case broom = "빗자루"
    /// 창
    case spear = "창"
    /// 락소드
    case rocksword = "락소드"
    /// 윙블레이드
    case wingblade = "윙블레이드"
}
