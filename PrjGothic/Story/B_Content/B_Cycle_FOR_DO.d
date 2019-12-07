/*---------------------------------------------------------------------------
-------------ТЕСТОВЫЕ ФУНКЦИИ наподобие цикла--------------------------------
----------------------------------------------------------------------------*/

//
//ВСТАВКА КУЧИ ОДНОТИПНЫХ НПС на однотипные точки
//
func void B_Cycle_Wld_InsertNpc(var int npcInstance, var string PointName, var int count)
{
	var string point;	//Точка вставки НПС
	var int i;				//Переменная для итерации
	if(count <= 1) {return;};
	count -= 1;
	POINT = ConcatStrings(PointName,IntToString(count+1));
	Wld_InsertNpc(npcInstance,POINT);
	B_Cycle_Wld_InsertNpc(npcInstance,PointName,count);
};
//Вставка десятка яриковыских падальщиков по квесту "Выбор Тамира"
const int npc_Count_TamirScavengers = 10;	//Кол-во падальщиков. Может быть изменено от сложности.
const string npc_point_TamirScavengers = "FP_ROAM_SCAVENGER_Q_TAMIR_0";	//Точки вставки падальщиков

func void B_DSG_Insert_TamirScavengers()
{
	B_Cycle_Wld_InsertNpc(Scavenger_Demon,npc_point_TamirScavengers,npc_Count_TamirScavengers);
};

//Вставка десятка варгов по квесту "Выбор Тамира"
const int npc_Count_TamirWargs= 10;	//Кол-во варгов. Может быть изменено от сложности.
const string npc_point_TamirWargs = "FP_ROAM_WARG_Q_TAMIR_0";	//Точки вставки варгов

func void B_DSG_Insert_TamirWargs()	//Кол-во варгов. Может быть изменено от сложности! ОБЯЗАТЕЛЬНО!
{
	B_Cycle_Wld_InsertNpc(Scavenger_Demon,npc_point_TamirWargs,npc_Count_TamirWargs);
};
