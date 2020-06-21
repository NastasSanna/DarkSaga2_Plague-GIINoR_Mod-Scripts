
func void B_LogEntry(var string topic,var string entry)
{
	//YPOS_LOGENTRY = 45;
	var string concatString;	
	concatString = "";
	Log_AddEntry(topic,entry);
	concatString = ConcatStrings(PRINT_NewLogEntry,": �");
	concatString = ConcatStrings(concatString,topic);
	concatString = ConcatStrings(concatString,"�");
	PrintScreen(concatString,-1,YPOS_LOGENTRY,FONT_ScreenSmall_HI,4);
	Snd_Play("LogEntry");
};
const int pos_dy_ds_log = 2;
func void B_ds_LogEntry(var string topic, var int log_type, var int status, var string entry)
{
	//PRINT_DS_NewLogEntry = "������ � ��������: �";	//�� Text.d - ��� ����������
	var string concatString;
	var string concatString1;
	concatString = "";
	concatString1 = "";
	Log_AddEntry(topic,entry);
	if(log_type == LOG_MISSION)
	{
		//������ ������: ������ � ��������: "�������"
		concatString = ConcatStrings(PRINT_DS_NewLogEntry,"��������");
		AI_PrintScreen(concatString,-1,YPOS_LOGENTRY + pos_y_ds_log,FONT_ScreenSmall_HI,4);
		//������ ������: ����� "$topic": (������� "$log_status" ��� "��������� ����� ����������")
		if(status == LOG_SUCCESS)
		{
			concatString1 = ConcatStrings("����� �",topic);
			concatString1 = ConcatStrings(concatString1,"�: ");
			concatString1 = ConcatStrings(concatString1,"������� ���������");
			AI_PrintScreen(concatString1,-1,YPOS_LOGENTRY + pos_y_ds_log + pos_dy_ds_log,FONT_ScreenSmall_Green_HI,4);
		}
		else if(status == LOG_FAILED)
		{
			concatString1 = ConcatStrings("����� �",topic);
			concatString1 = ConcatStrings(concatString1,"�: ");
			concatString1 = ConcatStrings(concatString1,"������� ���������");
			AI_PrintScreen(concatString1,-1,YPOS_LOGENTRY + pos_y_ds_log + pos_dy_ds_log,FONT_ScreenSmall_Red_HI,4);
		}
		else if(status == LOG_RUNNING)
		{
			concatString1 = ConcatStrings("����� �",topic);
			concatString1 = ConcatStrings(concatString1,"�: ");
			concatString1 = ConcatStrings(concatString1,"��������� ����� ����������");
			AI_PrintScreen(concatString1,-1,YPOS_LOGENTRY + pos_y_ds_log + pos_dy_ds_log,FONT_ScreenSmall_Yellow_HI,4);
		}
		else if(status == LOG_OBSOLETE)
		{
			concatString1 = ConcatStrings("����� �",topic);
			concatString1 = ConcatStrings(concatString1,"�: ");
			concatString1 = ConcatStrings(concatString1,"������� ��������� ��� ��������");
			AI_PrintScreen(concatString1,-1,YPOS_LOGENTRY + pos_y_ds_log + pos_dy_ds_log,FONT_ScreenSmall_Green_HI,4);
		};
	}
	else if(log_type == LOG_NOTE)
	{
		//������ ������: ������ � ��������: "����� ����������"
		concatString = ConcatStrings(PRINT_DS_NewLogEntry,"����� �����������");
		AI_PrintScreen(concatString,-1,YPOS_LOGENTRY + pos_y_ds_log,FONT_ScreenSmall_HI,4);
		concatString1 = ConcatStrings("�",topic);
		concatString1 = ConcatStrings(concatString1,"�");
		AI_PrintScreen(concatString1,-1,YPOS_LOGENTRY + pos_y_ds_log + pos_dy_ds_log,FONT_ScreenSmall_Yellow_HI,4);
	};
	Snd_Play("LogEntry");
	if(pos_y_ds_log == 0)
	{
		pos_y_ds_log = 6;
	}
	else if(pos_y_ds_log == 6)
	{
		pos_y_ds_log = 12;
	}
	else if(pos_y_ds_log == 12)
	{
		pos_y_ds_log = 0;
	};
};

func void B_LogNote(var string topic, var string entry)
{
	Log_CreateTopic(topic,LOG_NOTE);
	B_ds_LogEntry(topic,LOG_NOTE,LOG_Running,entry);
};
