
func void b_ds_closetopic(var string topic,var int mis)
{
	if(mis == LOG_Running)
	{
		Log_SetTopicStatus(topic,LOG_FAILED);
		mis = LOG_FAILED;
	};
};

