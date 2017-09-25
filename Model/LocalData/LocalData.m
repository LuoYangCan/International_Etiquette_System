//
//  LocalData.m
//  国际礼仪应对系统
//
//  Created by 孤岛 on 2017/9/25.
//  Copyright © 2017年 孤岛. All rights reserved.
//

#import "LocalData.h"
static LocalData *_LocalData = nil;
@implementation LocalData
+ (LocalData *)getInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _LocalData = [[LocalData alloc]init];
    });
    return _LocalData;
}


-(void)getArticalwithContent_id:(NSString *)Content_id completion:(void (^) (id responseArray, NSError * error))block{
    NSDictionary *ArticalDic = [NSDictionary dictionary];
    for (NSDictionary *dic in [self setDetailDic]) {
        @autoreleasepool{
            if ([dic[@"content_id"]isEqualToString:Content_id]) {
                ArticalDic = [dic copy];
                break;
            }
        }
    }
    if (block) {
        block  (ArticalDic, nil);
    }
}


-(void)getDataArrayWithcompletion:(void(^) (NSArray * responseArray))completionblock{
    NSArray *array = [NSArray arrayWithArray:[self setDetailDic]];
    if (completionblock) {
        completionblock(array);
    }
}



-(void)getSearchMessagewithArray:(NSMutableArray *)searchArray Searchstr:(NSString *)searchStr completion:(void (^) (NSError * error , id responseArray))block{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K CONTAINS[c] %@",@"title",searchStr];
    if (searchArray != nil) {
        [searchArray removeAllObjects];
    }
    NSArray *array = [self setSearchArray];
    searchArray = [NSMutableArray arrayWithArray:[array filteredArrayUsingPredicate:predicate]];
    if ([searchArray isEqualToArray:@[]]) {
        [searchArray addObject:@{@"title":@"没有相关信息",
                                  @"content_id":@"nil"}];
    }
    if (block) {
        block(nil, searchArray);
    }
}


-(NSArray *)setDetailDic{
    NSArray *array = @[@{   @"content_id":@"National",
                            @"title":@"世界各国人民日常习俗",
                            @"content":@"外国旅游禁忌\n虽然，随着全球越来越国际化，然而除去许多较为开化的地区以外，诸多地区仍然保留着相对传统的习俗。哪怕一些发达的国家和地区，日常的习俗依然被保留，所以作为一个外国游客，在进入到陌生的环境中，一定要多了解当地的生活习俗，避免去冒犯，以免造成不必要的麻烦。\n1、美国人见面时，不一定会握手，只要笑一笑，打个招呼就行了，即使是第一次见面。人们见面时喜欢直呼其名，这是亲切友好的表示，纵使交谈之初可能互相用姓称呼，但过一会儿就改称名字。美国从来不用行政职务如局长、经理、校长等头衔来称呼别人。另外，在与人交谈时，切不可谈及个人的私事，诸如年龄、婚姻、收入、信仰等等。看到别人买的东西不可问其价格；如果看到别人回来，也不能问他去哪儿了或者从哪里来，否则就会遭人厌恶，美国人常用“鼻子伸到人家私生活里来了”这句话来表示对提问人的轻蔑。\n2、对英国人，人们穿得很正式，最好不要有身体接触。可以拥抱，但不能有其他身体接触。在英国的柴郡，火车乘客不允许在站台逗留、亲昵话别，也不允许接吻。如果你真的有很多离别的话要说或想要接吻，你可以去接吻区域。在大不列颠做“V”手势的时候掌心不要向内，因为这被认为是挑衅或侮辱。据说，2个手指的致意是起源于英法百年战争。法国扬言要砍掉所有英国人射箭的手指头，结果最后英国大胜，因此摆出手指来炫耀自己是完好无损的。\n3、对意大利人，握手很重要，在业务活动中表示很正式的尊重。\n4、对德国人，握手很正式并伴有几乎感觉不到的鞠躬，除非对主人很了解，其他的接触，例如拥抱和接吻面颊是不提倡的。\n5、日本等许多东方国家，鞠躬是常见的传统礼节，行礼时立正站直，双手垂在眼前面，俯身低头，同时问候，弯身越低，越示敬意。对日本人的鞠躬礼，每次必须同样还礼。对日本客人，眼睛的直接接触和身体的直接接触都不提倡，因为这代表傲慢，不要看他的眼睛，取而代之的是看他的领带打结处，以表尊敬。在日本鞠躬要哈腰，头要低到身体一半处，双手放在一起。见到的人的年纪越大、职位越高，鞠躬应该越深。声音和态度应该平静，不要嘈杂。在日本，不管任何原因，都不能把筷子插入饭碗里离开，因为这是不祥的征兆。因为饭碗里直立的筷子会让日本人想起墓碑。而且，如果你用入口那端的筷子去夹菜也是一种不礼貌的行为，应该用另一端去夹菜。\n6、对拉美人，握手和拥抱很频繁，说话时他们比美国人站得更近。向后站是不礼貌的。\n7、阿拉伯和伊斯兰国家在社交场合中握手后又在双方脸颊上互吻，要同样回敬。\n8、对佛教国家的外宾要行合十礼。\n9、对军人要等其行举手注目礼后再行握手礼。\n10、所有人，不管是穆斯林还是非穆斯林，在踏入清真寺前都要脱鞋。游客也应该遵循穆斯林的穿衣风格：男士应该穿长裤和长袖衬衫；女士应该遮住所有裸露在外的皮肤，虽然各国对此的严格性会有所不同。女士必须围头巾，如果你没有，在很多大的清真市入口处你可以借一条。\n11、在乌克兰，如果你打算送花，一定要确保花束是奇数，因为偶数的花束是送在葬礼上的。如果你要给女主人送花，或为庆祝生日或其他特殊节日，不要送黄花或复活节百合，因为这些花也只是为葬礼准备的。\n12、虽然埃及人非常好客，但是他们的烹饪却有些温柔的自我。在埃及旅行的时候，不要在你的碗里加盐，因为这被看作是对厨师的侮辱。幸运的是，由于埃及人烹饪时经常使用大蒜、洋葱和其他芳香剂，埃及的食物还是很可口的。\n13、如果你打算在温暖的气候去意大利的教堂，出发的时候不要仅仅带短裤和无袖上衣。去意大利教堂天主教大教堂的游客穿着必须谨慎，无论是男士还是女士，都不允许穿短裤和无袖上衣。在教堂门口会有警卫或教民检查，所以在出发的时候记得带上一件长袖衫或其他套头衫。\n14、匈牙利人敬酒的时候不会碰杯，因为奥地利人曾经在杀害13个匈牙利烈士后用碰杯而庆祝。之后的150年之内，没有任何一个匈牙利人在敬酒的时候碰杯。现在虽然过去很长时间了，但是这个传统还一直保留。对于游人来说，记住这个传统比记住匈牙利语的干杯容易多了。\n15、在柬埔寨，如果你吃光盘子内所有的食物，这表明主人没有招待好你，因为你没有吃饱还想要。"
                            },
                       @{   @"content_id":@"Menggu",
                            @"title":@"蒙古族的礼仪文化",
                            @"content":@"\t\t\t\t蒙古族是一个历史悠久而又富有传奇色彩的民族，过着“逐水草而迁徙”的游牧生活。中国的大部分草原都留下了蒙古族牧民的足迹，因而被誉为“草原骄子”。每年七、八月牲畜肥壮的季节举行“那达慕”大会是蒙古族历史悠久的传统节日，这是人们为了庆祝丰收而举行的文体娱乐大会。\n\t\t\t\t“那达慕”大会上有惊险动人的赛马、摔跤，令人赞赏的射箭，有争强斗胜的棋艺，有引人入胜的歌舞，显示出草原民族独有的特色。蒙古族被称为草原上的民族，主要聚居于内蒙古自治区和新疆、青海、甘肃、黑龙江、吉林、辽宁等省（区）的蒙古族自治州、县，余者散居于宁夏、河北、四川、云南、北京等省、市、区。\n\t\t\t\t婚姻禁忌：古代禁忌为氏族内部不通婚，男子只能娶他部落女子。嫁到该氏族的妇女，从此不可脱离该氏族。若夫死，只能改嫁丈夫的近亲。旧时，新郎娶亲时，须挎佩刀与弓箭。到女家，摘下刀箭放于马窗西侧，走时再挎。娶亲归来仍将其放于马窗西侧，3天人禁触动。3天后，新娘将其收起，作为吉祥物和镇器永久保存。该族忌讳离婚，视其为最不道德、不吉祥的事。\n\t\t\t\t产忌：产妇生产期，忌外人入内，忌门均挂有标志：生男，挂弓箭，以示男儿之勇；生女，挂红布条，以示女儿之巧。云南蒙古族则在门上挂一篾帽，生男挂左，生女挂右。不满月不准外人入内，商业部不准从产妇家借物，否则“踩断奶路”或“带走奶”。产褥污秽，须远处掩埋，以免污渎天、佛，招致灾难。产妇、婴儿住处须挂帷幔，与外人隔绝。\n\t\t\t\t丧葬禁忌：寿衣为兰布裤、白布衫，不穿棉衣。儿女不许伸手给死者穿寿衣。忌长时间停灵，一般不超过一个时辰（两小时），即卯时死，卯时出。入殓时忌尸从门过，要从窗户抬出。出殡时，忌灵车上死者头朝前，而须脚朝前。青海蒙古族实行天葬，送葬者将尸体送至葬场后，须立即返身跨越点起的人火堆，以除污秽，后急速回家，不能回头。服丧期，孝男孝女禁娱乐，禁着艳服。\n\t\t\t\t生活习俗禁忌：忌食虾、蟹、鱼、海味等，吃肉时须用刀，给人递刀时忌刀尖冲接刀者，应反之。厌恶黑色，认为黑色是不祥的颜色。忌用碗在水缸、锅中取水。忌碗口朝下扣放。忌从衣、帽、碗、桌、粮袋、锅台、磨台、井口、绳上跨过。忌以鞋、袜、裤为枕。忌讳别人（包括客人）骑着马在蒙古包门口下马和骑马闯进羊群，忌讳手持马鞭进入毡房。蒙古人客人不经允许不可擅自进入包内，在蒙古包内不能随便就坐，不能蹲、不能将腿伸向西北方或炉灶。不能从主人的衣帽、被褥、枕头上跨过，不能在包房内吐痰，出包房不能踩门槛。蒙古族人还忌讳别人用烟袋、刀剪、筷子等指头部。"
                            },
                       @{   @"content_id":@"India",
                            @"title":@"印度的风俗和禁忌",
                            @"content":@"印度\n有“牛的王国”之称的印度，牛是神圣不可侵犯的动物，路上驾车千万不要撞到牛，更不能配戴牛制品进入庙宇，最好也能尽量避免以牛为摄影对象。印度还有一项特别不同的习惯，回答问题时若将头歪一边或摇头，那是肯定的表示，可别会错了意。信仰印度教的印度人实行种姓制度，打听当地人的种姓阶级是一项极不礼貌的事。印度禁忌\n1、左手不洁\n去印度或中东旅游，吃饭和接拿东西，只能用右手，绝对不能用左手。因为这些国家的人一般是用左手洗澡，上厕所，左手是不洁净的。所以用左手接拿食品是对主人最大的不礼貌。\n2、视牛如神\n在印度，牛是印度教徒爱护的动物，被视为神圣不可侵犯，任何人均不得伤害他们，牛群在大街上，逍遥自在地走着，受到最好的保护。\n有人郑重其事地说：“在印度开车，特别要小心牛。”甚至要进入印度教的寺庙，身上绝不可穿上牛皮制造的东西。\n3、绝不可骑在佛像上拍照\n在东南亚的佛教国家，旅客如果对寺庙、佛像、和尚等做出轻率的行动，被视为“罪恶滔天”。有些不明利害的观光客，曾经由于跨坐在佛像上大拍纪念照而被刑罚。\n4、对想带回去的佛像纪念品，也不可放置地上。\n在信奉佛教的国家购买的佛像虽然归自己所有，但必须对它有一份敬意，如当它是一无物，随意放置或粗手粗脚地动它，这种行为，会引起该国人的不快。\n5、与和尚交谈时，要保持低姿式\n到斯里兰卡等佛教国家旅行，经常看见有人与和尚交谈，但只要仔细观察便可发觉一般人绝不会坐在高过和尚的座位，他们必定设法使自己的头低过和尚的头，贵如总统或总理，也谨守这个原则。\n6、不要摸小孩的头\n印尼等地的人们不希望别人摸自己身上的任何一部份，相对的，他们也不喜欢去摸别人，他们认为：头部是人体最高的部分，也是人体中最神圣无比的部分，尤其是孩子的头，被视为神明停留之处。所以，在任何情况之下绝不许触摸。\n7、被邀去吃饭不必客气\n在印尼人的观念中，吃东西时要大家一起分享，独食是小气而不礼貌的行为，所以印尼人邀请人共餐，绝不是碍于情面假惺惺，而是诚心诚意的邀请，拒人千里之外的回绝当然令人不高兴。\n8、摇头或头歪到一边是表示“yes”\n在印度，头歪到一边是表示“yes”。他们表示赞同时，总是先把头往左右轻轻地斜一下脖子，然后立刻恢复原状，令人以为是“不要”或“不愿意”，其实是表示“知道了”或“好的”。\n9、双手交出东西\n在印度，东南亚诸国，若以左手把东西交给对方，对方会认为你是蔑视他，或是对他怀有恶意，交东西时，必须用右手交出，或是使用双手。一般老观光客的意思：还是使用双手最妥当。"
                            },
                       @{   @"content_id":@"Korea",
                            @"title":@"韩国人的风俗和禁忌",
                            @"content":@"随着越来越多的华人开始赴韩国旅游，韩国的许多旅游景点、旅行指南以及一些地方餐馆的菜单都开始有了中文字，其中包括“济州岛”等也越来越受到华人的热捧，然而人们在赴韩之余，多少应该对该国人民的文化习俗有更多的了解，特别是一些文化的禁忌，比如拍照的禁忌。\n韩国人崇尚儒教，尊重长老，长者进屋时大家都要起立，问他们高寿。和长者谈话时要摘去墨镜。早晨起床和饭后都要向父母问安；父母外出回来，子女都要迎接。乘车时，要让位给老年人。吃饭时应先为老人或长辈盛饭上菜，老人动筷后，其他人才能吃。\n韩国人见面时的传统礼节是鞠躬，晚辈、下级走路时遇到长辈或上级，应鞠躬、问候，站在一旁，让其先行，以示敬意。男人之间见面打招呼互相鞠躬并握手，握手时或用双手，或用左手，并只限于点一次头。鞠躬礼节一般在生意人中不使用。和韩国官员打交道一般可以握手或是轻轻点一下头。女人一般不与人握手。\n在社会集体和宴会中，男女分开进行社交活动，甚至在家里或在餐馆里都是如此。\n在韩国，如有人邀请你到家吃饭或赴宴，你应带小礼品，最好挑选包装好的食品。席间敬酒时，要用右手拿酒瓶，左手托瓶底，然后鞠躬致祝辞，最后再倒酒，且要一连三杯。敬酒人应把自己的酒杯举得低一些，用自己杯子的杯沿去碰对方的杯身。敬完酒后再鞠个躬才能离开。做客时，主人不会让你参观房子的全貌，不要自己到处逛。你要离去时，主人送你到门口，甚至送到门外，然后说再见。\n韩国人用双手接礼物，但不会当着客人的面打开。不宜送外国香烟给韩国友人。酒是送韩国男人最好的礼品，但不能送酒给妇女，除非你说清楚这酒是送给她丈夫的。在赠送韩国人礼品时应注意，韩国男性多喜欢名牌纺织品、领带、打火机、电动剃须刀等。女性喜欢化妆品、提包、手套、围巾类物品和厨房里用的调料。孩子则喜欢食品。如果送钱，应放在信封内。\n若有拜访必须预先约定。韩国人很重视交往中的接待，宴请一般在饭店或酒吧举行，夫人很少在场。\n韩国禁忌\n政府规定，韩国公民对国旗、国歌、国花必须敬重。不但电台定时播出国歌，而且影剧院放映演出前也放国歌，观众须起立。外国人在上述场所如表现过分怠慢，会被认为是对韩国和韩族的不敬。\n韩国人禁忌颇多。逢年过节相互见面时，不能说不吉利的话，更不能生气、吵架。农历正月头三天不能倒垃圾、扫地，更不能杀鸡宰猪。寒食节忌生火。生肖相克思婚姻，婚期忌单日。渔民吃鱼不许翻面，因忌翻船。忌到别人家里剪指甲，否则两家死后结冤。吃饭时忌带帽子，否则终身受穷。睡觉时忌枕书，否则读无成。忌杀正月里生的狗，否则三年内必死无疑。\n与年长者同坐时，坐姿要端正。由于韩国人的餐桌是矮腿小桌，放在地炕上，用餐时，宾主都应席地盘腿而坐。若是在长辈面前应跪坐在自己的脚底板上，无论是谁，绝对不能把双腿伸直或叉开，否则会被认为是不懂礼貌或侮辱人。末征得同意前，不能在上级、长辈面前抽烟，不能向其借火或接火。吃饭时不要随便发出声响，更不许交谈。进入家庭住宅或韩式饭店应脱鞋。在大街上吃东西、在人面前擤鼻涕，都被认为是粗鲁的。\n在韩国人面前，切勿提\"朝鲜\"三字，也不要把\"汉城\"说成\"京城\"。照相在韩国受到严格限制，军事设施、机场、水库、地铁、国立博物馆以及娱乐场所都是禁照对象，在空中和高层建筑拍照也都在被禁之列。\n"
                            },
                       @{   @"content_id":@"NeiMeng",
                            @"title":@"中国内蒙古旅游风俗禁忌",
                            @"content":@"内蒙古是我国北部边陲省区, 也是问国最早建立的省级民族自治区。东西蜿蜒2500公里, 辽阔、富饶、美丽。自治区首府为呼和浩特市, 是国家确定的民族特需品生产基地。全境通称内蒙古高原, 拥有辽阔丰美的草场资源, 是中国五大牧区之一。东部大兴安岭山地森林茂密, 是中国重要林区之一。13世纪蒙古民族登上了历史舞台,留下了丰富的文化遗产。如今, 全区已经形成多层次、全方位对外开放的新格局 ,并将建成中国北部边疆经济高速发展的开放区。\n全区旅游资源丰富。蓝天, 白云 ,草场, 骏马, 以及浓郁的民族风情, 吸引着无数中外游客。然而，这里生活着的49个民族中，少数民族竟然有48个，其中还有许多牧民，有着不同的禁忌文化，其中就包括以下8中禁忌：\n1、火忌 \n蒙古族崇拜火、火神和灶神，认为火、火神或灶神是驱妖避邪的圣洁物。所以进入蒙古包后，禁忌在火炉上烤脚，更不许在火炉旁烤湿靴子和鞋子。不得跨越炉灶，或脚蹬炉灶，不得在炉灶上磕烟袋、摔东西、扔脏物。不能用刀子挑火、将刀子插入火中，或用刀子从锅中取肉。 \n2、水忌 \n蒙古族认为水是纯洁的神灵。忌讳在河流中洗手或沐浴，更不许洗女人的脏衣物，或者将不干净的东西投入河中。草原干旱缺水，逐水草放牧，无水则无法生存。所以牧民习惯节约用水，注意保持水的清洁，并视水为生命之源。 \n3、病忌 \n牧民家有重病号或病危的人时，一般在蒙古包左侧挂一根绳子，并将绳子的一端埋在东侧，说明家里有重患者，不待客。\n4、产忌\n蒙古族妇女生孩子时的忌讳。各地习俗大同小异。蒙古族妇女生孩子不让外人进产房。一般要在屋檐下挂一个明显的标志。生男孩子挂弓箭，生女孩则挂红布条。客人见标志即不再进入产房。\n5、忌蹬门槛 \n到牧民家作客，出入蒙古包时，绝不许踩蹬门槛。农区、半牧区的蒙古人也有此禁忌。在古代，如果有人误踏蒙古可汗宫帐的门槛，即被处死。这种禁忌习俗，一直延续到现在。\n6、忌摸头 \n蒙古族忌讳生人用手摸小孩的头部。旧观念认为生人的手不清洁，如果模孩子的头，会对孩子的健康发育不利。\n7、忌打狗 \n到牧民家作客时，要在蒙古包附近勒马慢行，待主人出包迎接，并看住狗后再下马，以免狗扑过来咬伤人。千万不能打狗、骂狗，闯入蒙古包。\n8、作客忌讳\n牧民虽好客，但作客的忌讳也比较多。客人进蒙古包时，要注意整装，切勿挽着袖子，把衣襟掖在腰带上。也不可提着马鞭子进去，要把鞭子放在蒙古包门的右方，并且要立着放。进蒙古包后，忌坐佛龛前面。否则主人就会冷待客人，并认为客人不懂礼俗，不尊重民族习惯。"
                            },
                       @{   @"content_id":@"XinJiang",
                            @"title":@"中国新疆旅游风俗禁忌",
                            @"content":@"新疆有许多禁忌，这些禁忌是伴随着新疆的历代宗教信仰及长期的生活习惯沿袭下来的。因此这些禁忌对于新疆人来说根深蒂固，你必须详细研读以下文字，且要记住“入国问禁，入乡随俗”的原则。\n一、性感禁忌\n禁止穿坦胸露背的衣服及过于短小的衣服，反感穿背心短裤在室外活动和作客。禁止女性服饰或打扮过于性感，因为伊斯兰教创始人穆罕默德认为：“女性对任何男人都有魔力”，因此过于性感的打扮，可能导致周围已经沐浴过准备去礼拜的某些穆斯林群众无法抵御的小小思想变化。这样，“性感”在新疆将直接导致两种犯罪：一是犯“性骚扰诱惑罪”，二是按照伊斯兰教经典《圣训经》，如果有精液不慎泄漏，将导致沐浴无效！而犯下“过失影响穆斯林礼拜”罪。\n二、凝视禁忌\n不少维吾尔人认为人们忌羡他物或忌妒贤能的眼光，具有某种超自然的恶的力量，会给所喜爱的人、物或所从事的事业带来种种不利，如凝视人家漂亮聪明的孩子，会使这个孩子遭到某种不幸；烤馕时被人凝视，馕就在馕炕贴不住；灌面肺子时要在肺子上蒙一块布，不让别人凝视，被人凝视肺子就会破；织布时被人凝视，就会经常出现断线等。维吾尔人防范毒眼致厄的手主要有佩带护身符，行熏烟术等。\n在新疆，你可千万不能凝视维吾尔人或他们的东西，或在巴扎（自由市场）上看了好久而不买，由于这个原因，导致的各种恶性事件屡见不鲜，可悲的是被骂或被打的游客居然理直气壮地说“看看不行吗”，回答是：在新疆，不行！因为这与他们的原始宗教信仰有关，“入国问禁，入乡随俗”的原则判您“不尊重民族习惯”罪名成立。\n三、放屁禁忌\n在新疆，绝对禁止在公众场合放任何有声屁或无声屁，因为周围可能有已经沐浴过准备去礼拜的各族穆斯林群众，按照伊斯兰教经典《圣训经》，有声屁或无声屁均导致沐浴无效！因此这些穆斯林群众按照经典将被迫应该重新沐浴。因此公众场合“排气”可能在疆外习以为常，但在新疆毫无疑问判您“骚扰穆斯林礼拜”罪名成立。\n四、饮食禁忌\n在饮食上，新疆穆斯林禁食猪、狗、驴、骡肉和猛兽猛禽的肉，忌食未经杀而自死的动物的肉，也禁食所有动物的血。这些禁忌源于伊斯兰教，现已演变为生活习俗。因此切不可将以上诸物带入穆斯林家庭或餐厅，或在这种场合谈论这些物品。如果你能向穆斯林表示，自己不吃以上食品，那么就会更受欢迎。\n五、崇拜禁忌\n忌践踏粮食、咸盐及各种食物，否则会被当地人指遭到报应，不是日后变成乞丐，就是双目失明，永远生活在黑暗里；不能朝咸盐和火吐唾沫。忌踩或跨“亚拉克”（倒泔水的地方），认为这种地方有饭粒、馕渣和盐水，而这些都是“圣物”，否则会带来厄运，遭到各种磨难。\n六、礼仪禁忌\n新疆人待客和作客有许多讲究。忌踩餐布或从餐布跨过。客人不可随便拨弄盘中的食物，不能嗅食物，不能随便到锅灶前去，不能随便揭看锅盆等炊具。尽可能不剩食物于碗中。不能将饭粒落地，万一掉到地上，要起来放在餐布上。要把碗中的饭吃干净。吃馕或馒头时，要将馕或馒头掰开吃，不可整吃。吃完饭后不能敲碗碟。作客时，如有事要离席，不能从人前走，必须到人后走。吃完饭祈祷时，禁止东张西望、嘻笑和起身走动。客人不能随便借翻主人家的东西，不能在主人的房子里来回走动。\n饭前饭后要洗手，洗完手后不能乱甩手上的水珠，必须用毛巾擦干。不能坐在装有食物的箱子、麻袋和装有盐的袋子和做饭用具上。吃饭或与人交谈时，最忌讳吐痰、擤鼻涕、挖鼻孔、掏耳朵、剪指甲、挠痒等，否则被人认为是失礼的行为；在屋内炕上坐下时，不能双腿伸直，脚底朝人。接受或奉送礼物、茶饭碗时要双手，单手接受或递送物品被视为缺乏礼貌，家里有客人时不能扫地。作客时，应听从主人的招待，如实在不想吃东西，也要尝一口，以示尊敬，不能完全拒绝。主人给客人倒茶时，客人应双手捧起碗，不能为了表示客气接过茶壶自己倒。\n在新疆，你的行为如能这样，就可能会处处招人喜欢！\n七、赞美禁忌\n有些新疆人忌讳别人当面赞美自己的孩子，尤其不能用 “胖”、“漂亮”、“胃口好”等之类的词句；不论是亲戚还是朋友，忌讳一进屋就去抱主人家的孩子，尤其忌讳远道而来的客人去抱，认为这样会使小孩受惊生病。\n因此，在新疆，你常会听到一些老人见到小孩时常说“这个小孩太难看了”。\n八、其他禁忌\n穆斯林在做乃玛孜（礼拜）时，不能喧闹，诵读祈祷经文时，不能说话，不能站在或经过做乃玛孜的人面前或将人像置于做乃玛孜的人面前，也不能不脱鞋或用脏脚踩礼拜毯。\n不能在清真寺或麻扎（坟场）喧哗或谈论与此无关的内容。不能朝着太阳、月亮大小便，往水里撒尿，不能朝天空吐唾沫，清晨未洗脸前不能看太阳等；不能踩拔庄稼和小草，尤其是不能往庄稼和草上大小便。\n路经麻扎时，不能骑马、骡、驴；不许牲畜在墓地内乱跑；不允许任何人无故进入墓地，不许从墓地上大量取土，以防坟墓倒塌，墓地附近禁止修猪圈、厕所，禁止在墓地、清真寺以及小渠边大小便、吐痰、擤鼻涕、带污秽物经过和逗留。\n妇女不能跨越绳子、脏水，认为跨越绳子生孩子时胎盘不容易下来；跨越脏水，分娩时将会无力。陌生人不能随便进入产妇的房间，一般要在产后满十二天之后去探望产妇。忌讳男人将头发、胡子留得过长和带金戒指，忌讳女人将指甲、腋毛等留得过长。认为星期二、星期五上路不吉利，会遇到倒霉的事。吸毒、赌钱、酗酒、斗殴、说谎、奸淫、暗算别人、占别人的便宜等，均被禁忌。"
                            },
                       @{   @"content_id":@"Han",
                            @"title":@"汉族的礼仪文化",
                            @"content":@""
                            },
                       @{   @"content_id":@"Han",
                            @"title":@"汉族的礼仪文化",
                            @"content":@""
                            },
                       @{   @"content_id":@"Han",
                            @"title":@"汉族的礼仪文化",
                            @"content":@""
                            },
                       
                       ];
    return array;
}




- (NSArray *)setSearchArray{
    NSArray * array = @[@{ @"title":@"世界各国人民日常习俗",
                           @"content_id":@"National"},
                        @{ @"title":@"韩国人的风俗和禁忌",
                           @"content_id":@"Korea"},
                        @{ @"title":@"蒙古族的礼仪文化",
                           @"content_id":@"Menggu"},
                        @{ @"title":@"印度的风俗和禁忌",
                           @"content_id":@"India"},
                        @{ @"title":@"中国新疆旅游风俗禁忌",
                           @"content_id":@"XinJiang"},
                        @{ @"title":@"傈僳族",
                           @"content_id":@"Lisu"}
                        
                        ];
    return [array copy];
}
@end
