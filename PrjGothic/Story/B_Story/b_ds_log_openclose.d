
func void B_DS_Log_OpenClose(var string topic,var int log_type,var int log_status,var string topictext)
{
	if(log_type == LOG_MISSION)
	{
		if(log_status == LOG_Running)
		{
			Log_CreateTopic(topic,log_type);
			Log_SetTopicStatus(topic,log_status);
			B_ds_LogEntry(topic,log_type,log_status,topictext);
			//MEM_Call(B_DS_LogCloseOnDeath);	//NS (15/02/2014) Ikarus если важный npc мертв, квест сразу закроетс€
		}
		else if(log_status == LOG_SUCCESS)
		{
			B_ds_LogEntry(topic,log_type,log_status,topictext);
			Log_SetTopicStatus(topic,log_status);
		}
		else if(log_status == LOG_FAILED)
		{
			B_ds_LogEntry(topic,log_type,log_status,topictext);
			Log_SetTopicStatus(topic,log_status);
		}
		else if(log_status == LOG_OBSOLETE)
		{
			B_ds_LogEntry(topic,log_type,log_status,topictext);
			Log_SetTopicStatus(topic,LOG_OBSOLETE);
		};
	}
	else if(log_type == LOG_NOTE)
	{
		Log_CreateTopic(topic,log_type);
		B_ds_LogEntry(topic,log_type,log_status,topictext);
	};
};
//
//Ќова€ функци€. 24.05.2013
//
//”станавливает и топик в нужный статус и переменную.
//
func void B_DSG_Log_OpenClose(var string topic, var int log_type, var int log_status, var string topictext)
{
	/*
	—мысл начального преобразовани€:
	»меем const string TOPIC_DSG_PLAGUE = "Plague „ума";
	Ётой константе дл€ дневника соответствует int-ова€ переменна€ с таким же по сути именем MIS_DSG_Plague;
	ћы отрезаем от "Plague „ума" слово "Plague". ƒобавл€ем в начало приставку "MIS_DSG_", 
	получаем на выходе символьное им€ int-овой переменной: "MIS_DSG_Plague";
	ѕотом ищем это символьное им€ в таблице, и этой переменной в итоге присваиваем нужное значение.
	
	NS: DSG (Dark Saga Gates) => DS2P (Dark Saga 2: Prolog (или Plague))
	*/
	if(log_type == LOG_MISSION)
	{
		var string var_MisName;	//—имвольное им€ переменной дл€ миссии: MIS_DSG_TOPICNAME
		var int sym_varMisName;	//”казатель на переменную MIS_DSG_TOPICNAME в символьной таблице;
		
		var_MisName = STR_Split(topic, "_" , 1); 											//отрезаем значащее им€ топика от имени топика.
		var_MisName = ConcatStrings(CONST_str_MIS_MOD, var_MisName);	//—кладываем MIS_DSG_ + TOPICNAME = MIS_DSG_TOPICNAME;
		PrintScreen(var_MisName,1,3,Font_ScreenSmall,1);
		topic = STR_Split(topic, "_" , 0);	//ќтрезаем слово, которое €вл€етс€ именем миссии в дневнике (на русском :) )
		PrintScreen(topic,1,5,Font_ScreenSmall,1);
		
		sym_varMisName = MEM_GetParserSymbol(var_MisName);
		if(sym_varMisName)
		{
			var zCPar_Symbol s; 
			s = MEM_PtrToInst(sym_varMisName);	//ѕреобразуем (указатель на переменную) в инстанцию типа zCPar_Symbol, чтобы управл€ть пол€ми такого класса.
			if((s.bitfield & zCPar_Symbol_bitfield_type) == zPAR_TYPE_INT) 	//≈сли MIS_DSG_%NAME% - int-ова€ пременна€ (проверка на вс€кий случай)
			{
				if(s.content != log_status)	//«аписываем значение, если отличаетс€.
				{
					s.content = log_status;								//ѕрисваиваем этой переменной ${var_MisName} значение %log_status%
				};
			} else 
			{
				MEM_Error("ѕеременна€ дл€ миссии не €вл€етс€ числовой");
			};
			
		}
		else
		{
			MEM_Error("ѕеременной дл€ миссии не существует.");
		};
	};
	if(log_type == LOG_MISSION)
	{
		if(log_status == LOG_Running)
		{
			if(!Log_GetTopicStatus(topic))
			{
				Log_CreateTopic(topic,log_type);
				Log_SetTopicStatus(topic,log_status);
			};
			B_ds_LogEntry(topic,log_type,log_status,topictext);
		}
		else if(log_status == LOG_SUCCESS)
		{
			B_ds_LogEntry(topic,log_type,log_status,topictext);
			Log_SetTopicStatus(topic,log_status);
		}
		else if(log_status == LOG_FAILED)
		{
			B_ds_LogEntry(topic,log_type,log_status,topictext);
			Log_SetTopicStatus(topic,log_status);
		}
		else if(log_status == LOG_OBSOLETE)
		{
			B_ds_LogEntry(topic,log_type,log_status,topictext);
			Log_SetTopicStatus(topic,LOG_OBSOLETE);
		};
	}
	else if(log_type == LOG_NOTE)
	{
		if(!Log_GetTopicStatus(topic))
		{
			Log_CreateTopic(topic,log_type);
		};
		B_ds_LogEntry(topic,log_type,log_status,topictext);
	};
};
/*
func string _getVarName() {
	MEM_PopInst();
	MEM_PushInst(zPAR_TOK_PUSHINT);
	var int ptr; ptr = MEM_PopInt() - zCParSymbol_content_offset;
	var zCPar_Symbol symb; symb = _^(ptr);
	return symb.name;
};

func string getVarName(var int par) {
	MEM_Error("This function should have never been entered.");
	return "";
};

func void initVarName() {
	MEM_ReplaceFunc(getVarName, _getVarName);
};**/


