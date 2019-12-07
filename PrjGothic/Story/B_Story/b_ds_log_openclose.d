
func void B_DS_Log_OpenClose(var string topic,var int log_type,var int log_status,var string topictext)
{
	if(log_type == LOG_MISSION)
	{
		if(log_status == LOG_Running)
		{
			Log_CreateTopic(topic,log_type);
			Log_SetTopicStatus(topic,log_status);
			B_ds_LogEntry(topic,log_type,log_status,topictext);
			//MEM_Call(B_DS_LogCloseOnDeath);	//NS (15/02/2014) Ikarus ���� ������ npc �����, ����� ����� ���������
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
//����� �������. 24.05.2013
//
//������������� � ����� � ������ ������ � ����������.
//
func void B_DSG_Log_OpenClose(var string topic, var int log_type, var int log_status, var string topictext)
{
	/*
	����� ���������� ��������������:
	����� const string TOPIC_DSG_PLAGUE = "Plague ����";
	���� ��������� ��� �������� ������������� int-���� ���������� � ����� �� �� ���� ������ MIS_DSG_Plague;
	�� �������� �� "Plague ����" ����� "Plague". ��������� � ������ ��������� "MIS_DSG_", 
	�������� �� ������ ���������� ��� int-���� ����������: "MIS_DSG_Plague";
	����� ���� ��� ���������� ��� � �������, � ���� ���������� � ����� ����������� ������ ��������.
	
	NS: DSG (Dark Saga Gates) => DS2P (Dark Saga 2: Prolog (��� Plague))
	*/
	if(log_type == LOG_MISSION)
	{
		var string var_MisName;	//���������� ��� ���������� ��� ������: MIS_DSG_TOPICNAME
		var int sym_varMisName;	//��������� �� ���������� MIS_DSG_TOPICNAME � ���������� �������;
		
		var_MisName = STR_Split(topic, "_" , 1); 											//�������� �������� ��� ������ �� ����� ������.
		var_MisName = ConcatStrings(CONST_str_MIS_MOD, var_MisName);	//���������� MIS_DSG_ + TOPICNAME = MIS_DSG_TOPICNAME;
		PrintScreen(var_MisName,1,3,Font_ScreenSmall,1);
		topic = STR_Split(topic, "_" , 0);	//�������� �����, ������� �������� ������ ������ � �������� (�� ������� :) )
		PrintScreen(topic,1,5,Font_ScreenSmall,1);
		
		sym_varMisName = MEM_GetParserSymbol(var_MisName);
		if(sym_varMisName)
		{
			var zCPar_Symbol s; 
			s = MEM_PtrToInst(sym_varMisName);	//����������� (��������� �� ����������) � ��������� ���� zCPar_Symbol, ����� ��������� ������ ������ ������.
			if((s.bitfield & zCPar_Symbol_bitfield_type) == zPAR_TYPE_INT) 	//���� MIS_DSG_%NAME% - int-���� ��������� (�������� �� ������ ������)
			{
				if(s.content != log_status)	//���������� ��������, ���� ����������.
				{
					s.content = log_status;								//����������� ���� ���������� ${var_MisName} �������� %log_status%
				};
			} else 
			{
				MEM_Error("���������� ��� ������ �� �������� ��������");
			};
			
		}
		else
		{
			MEM_Error("���������� ��� ������ �� ����������.");
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


