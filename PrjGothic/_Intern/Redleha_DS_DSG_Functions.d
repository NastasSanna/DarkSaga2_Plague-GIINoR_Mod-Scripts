//----------------------------------------------------------------------------
/*Сюда вынесены новые функции, сделанные мной и которые удобно использовать*/
/*Являются не пассивными, то есть использоваться могут в диалогах*/
//----------------------------------------------------------------------------

/* Функция декипировки всех колец и поясов. Если надо, то можно и амулеты добавить.
Необходимо если что, добавлять сюда новые инстанции.

void B_ds_ResetBelts(var C_NPC her)
*/

/*
Функция построения информационной строки для торговли в диалоге. Показывает, сколько всего есть предметов,
чтобы не продать лишнее.
Образует на выходе строку: "$text Всего: XXX штук." 
Пример: b_build_trdString("(продать лечебные растения)",ItPl_Health_Herb_02)

string b_build_trdString(var string text, var int itemInstance)
*/

/*
Получение строки для отображения в диалоге обучения характеристикам.
string b_Ds_buildString_TeachPayment_Attr(var C_NPC her, var string text, var int attribut, var int points)

Получение строки для отображения в диалоге обучения талантам
string b_Ds_buildString_TeachPayment_Talent(var C_NPC her, var string text, var int talent, var int points, var int Value_force)
*/

/*
Очищает от золота, руды или всего вместе у НПС self
void B_DS_ClearGold()
void B_DS_ClearNugget()
void B_DS_ClearGoldNugget()
*/

/*
Увеличивает боевой талант владения оружием НПС slf на diff_bonus. Используется в наложении бонусов.
Пример: 
B_DS_GiveBonusFightSkill(self,NPC_DS_TALENT_1H | NPC_DS_TALENT_2H | NPC_DS_TALENT_BOW | NPC_DS_TALENT_CROSSBOW, 5);

void B_DS_GiveBonusFightSkill(var C_NPC slf, var int NPC_TALENT_TYPE, var int diff_bonus)
*/

/*
Увеличивает защиту НПС slf на diff_bonus. Использовалось в обучении и в бонусах от итемок.
Пример: 
B_DS_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT, BA_Bonus01);
B_DS_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT, -BA_Bonus01);

void B_DS_GiveBonusProt(var C_NPC slf, var int PROT_TYPE, var int diff_bonus)
*/

/*
Первая из таких функций. Удобная для сокращения строки при добавлении в дневник и от(за-)крытии миссии.
Пример:
B_DSG_Log_OpenClose(TOPIC_WINEBOTTLE,LOG_MISSION,LOG_Running,"Висп попросил принести ему бутылку вина.");
B_DSG_Log_OpenClose(TOPIC_WINEBOTTLE,LOG_MISSION,LOG_SUCCESS,"Висп по достоинству оценил мои старания.");
B_DSG_Log_OpenClose(TOPIC_ARENA01,LOG_MISSION,LOG_Running,"");
B_DSG_Log_OpenClose(TOPIC_TEACHERINMINE,LOG_NOTE,-1,"Карло может повысить мой навык рудного дела.");

void B_DSG_Log_OpenClose(var string topic,var int log_type,var int log_status,var string topictext)
----------------------------------------------------------------------------------------------------------------

В добавление - вызываемая в предыдущей функции.
Необходима для информирования игрока, куда добавляется запись. Также цветом определяется степень миссии:
- зелёный - квест сдан, 
- желтый - добавление строки в квест или в раздел общей информации
- красный - провален
Идёт координация вывода нескольких строк по Y-координате сразу (один квест закрылся, второй сразу начался)
void B_ds_LogEntry(var string topic, var int log_type, var int status, var string entry)
*/

/*
Осмотр фейковой руны НПС self
void B_ds_UseFakeRune()

Чтение фейкового свитка в течение времени time
void b_usefakescrolltime(var float time)

Чтение фейковой книги
void b_usefakebook()
*/

//---------------------------------------------------------------------
/*
int C_Npc_DS_HasItems(var C_NPC owner, var int itemInstance, var int amount)

Возвращает TRUE, если owner имеет itemInstance в кол-ве amount
*/

/*
int C_Npc_DS_HasItems_Scr(var C_NPC owner, var int itemInstance, var int amount, var int dS_PosY, var int boolShowOnScreen)

Возвращает TRUE,если owner имеет itemInstance в кол-ве amount
Выводится текст на экран о кол-ве в инвентаре в оотношении с необходимым: есть/необходимо
Пример:
if(C_Npc_DS_HasItems_Scr(hero,ItPl_SwampHerb,1,YPos_3,true) && C_Npc_DS_HasItems_Scr(hero,ItPl_Beet,2,YPos_5,true)
-------------------------------------------------------------------------------------------------

void Print_DS_Npc_HasItems(var C_NPC owner, var int itemInstance, var int dS_PosY)

Выводит на экран кол-во итемов в инвентаре
*/

/*
int C_Npc_GetDistToWP(var C_NPC pointMan, var string waypoint, var int Dist, var int MoreOrLess)
Возвращает TRUE, если расстояние от pointMan до waypoint <> Dist (> - More; < - Less). 

int C_Npc_GetDistToNpc(var C_NPC pointMan, var C_NPC targetMan, var int Dist, var int MoreOrLess)
Возвращает TRUE, если расстояние от pointMan до targetMan <> Dist (> - More; < - Less). 
*/

/*
int C_DS_GiveInvItems(var C_Npc giver,var int itemInstance,var int amount)
Функция проверки условия на наличие предметов

int B_GiveInvItem_red(var C_Npc giver, var C_Npc taker, var int itemInstance, var int amount, var int screenprocent)
Функция передачи предмета с проверкой на наличие и заданием Y-координаты вывода

int B_DS_GiveRemoveItems(var C_Npc giver, var C_Npc taker, var int itemInstance, var int amount)
Передача и удаление итемов из инвентаря берущего:

int B_DS_GiveRemoveItems_Red(var C_Npc giver, var C_Npc taker, var int itemInstance, var int amount, var int screenproc)
Передача и удаление итемов из инвентаря берущего c указанием Y-координаты на экране
*/

/*
Задание конкретных параметров боевых навыков НПС slf, а не повышение в функции void B_SetFightSkills(var C_Npc slf,var int percent)
void B_DS_SetFightSkills(var C_Npc slf,var int percent)
*/

/*
Установка начальных параметров в зависимости от уровня сложности
Пример: B_DS_SetMst_Attribute(cMst_Default_Pyranha);
void B_DS_SetMst_Attribute(var int Monster)
*/
var int temp_222;
