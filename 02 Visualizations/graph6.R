#Graph 6


df <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select * from titanic where sex is not null and age is not null"'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDBF15DV.usuniversi01134.oraclecloud.internal', USER='cs329e_in2422', PASS='orcl_in2422', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE), ))

ggplot() + 
  coord_cartesian() + 
  scale_x_discrete() +
  scale_y_continuous()+

  labs(title='Titanic') +
  labs(x="Survived", y=paste("Age")) +
  layer(data=df, 
        mapping=aes(x=as.character(SURVIVED), y=as.numeric(as.character(AGE)), color=SEX), 
        stat="identity", 
        stat_params=list(), 
        geom="point",
        geom_params=list(), 

        position=position_jitter(width=.3, height=0)
  ) + 
  layer(data=df, 
        mapping=aes(x=as.character(SURVIVED), y=as.numeric(as.character(AGE))), 
        stat="boxplot", 
        stat_params=list(), 
        geom="boxplot",
        geom_params=list(color="red", fill="red", alpha=0), 
        position=position_identity()
  ) 