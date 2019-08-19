Seven algorithms for importing exporting csv files without proc export import                                                      
                                                                                                                                   
    Export CSV                                                                                                                     
                                                                                                                                   
       a. dm "dexport have 'd:\csv\have.csv' replace";                                                                             
       b. ods csv                                                                                                                  
       d. ods csv (with SAS labels as headers)                                                                                     
       e. datastep                                                                                                                 
       f. SAS ds2csv macro                                                                                                         
          https://tinyurl.com/y5xnhfbz                                                                                             
                                                                                                                                   
    Import CSV                                                                                                                     
                                                                                                                                   
       a. dm "dimport 'd:\csv\have.csv' havedm  replace";                                                                          
       b. datastep and utl_optlen';                                                                                                
                                                                                                                                   
                                                                                                                                   
github                                                                                                                             
https://tinyurl.com/y5vb6vy4                                                                                                       
https://github.com/rogerjdeangelis/utl-seven-algorithms-for-importing-exporting-csv-files-without-proc-export-import               
                                                                                                                                   
SAS Forum                                                                                                                          
https://tinyurl.com/y53ws4sl                                                                                                       
https://communities.sas.com/t5/SAS-Programming/ODS-csv-to-export-to-csv-file/m-p/577612                                            
                                                                                                                                   
Ronein profile                                                                                                                     
https://communities.sas.com/t5/user/viewprofilepage/user-id/159549                                                                 
                                                                                                                                   
*                           _                                                                                                      
  _____  ___ __   ___  _ __| |_                                                                                                    
 / _ \ \/ / '_ \ / _ \| '__| __|                                                                                                   
|  __/>  <| |_) | (_) | |  | |_                                                                                                    
 \___/_/\_\ .__/ \___/|_|   \__|                                                                                                   
          |_|                                                                                                                      
;                                                                                                                                  
                                                                                                                                   
data have;                                                                                                                         
  set sashelp.class(obs=5);                                                                                                        
  label name='First Name'                                                                                                          
           sex='Gender'                                                                                                            
           Age='Age of Person'                                                                                                     
           Height='Height of Person'                                                                                               
           Weight='Weight of Person';                                                                                              
run;quit;                                                                                                                          
                                                                                                                                   
WORK.HAVE total obs=19                                                                                                             
                                                                                                                                   
 NAME       SEX    AGE    HEIGHT    WEIGHT                                                                                         
                                                                                                                                   
 Alfred      M      14     69.0      112.5                                                                                         
 Alice       F      13     56.5       84.0                                                                                         
 Barbara     F      13     65.3       98.0                                                                                         
 Carol       F      14     62.8      102.5                                                                                         
 Henry       M      14     63.5      102.5                                                                                         
                                                                                                                                   
*          _       _   _                                                                                                           
 ___  ___ | |_   _| |_(_) ___  _ __  ___                                                                                           
/ __|/ _ \| | | | | __| |/ _ \| '_ \/ __|                                                                                          
\__ \ (_) | | |_| | |_| | (_) | | | \__ \                                                                                          
|___/\___/|_|\__,_|\__|_|\___/|_| |_|___/                                                                                          
                                                                                                                                   
;                                                                                                                                  
                                                                                                                                   
*    _                                        _                                                                                    
  __| |_ __ ___     _____  ___ __   ___  _ __| |_                                                                                  
 / _` | '_ ` _ \   / _ \ \/ / '_ \ / _ \| '__| __|                                                                                 
| (_| | | | | | | |  __/>  <| |_) | (_) | |  | |_                                                                                  
 \__,_|_| |_| |_|  \___/_/\_\ .__/ \___/|_|   \__|                                                                                 
                            |_|                                                                                                    
;                                                                                                                                  
                                                                                                                                   
dm "dexport have 'd:\csv\have.csv' replace";                                                                                       
                                                                                                                                   
NAME,SEX,AGE,HEIGHT,WEIGHT                                                                                                         
Alfred,M,14,69,112.5                                                                                                               
Alice,F,13,56.5,84                                                                                                                 
Barbara,F,13,65.3,98                                                                                                               
Carol,F,14,62.8,102.5                                                                                                              
Henry,M,14,63.5,102.5                                                                                                              
                                                                                                                                   
*          _                                                                                                                       
  ___   __| |___    ___ _____   __                                                                                                 
 / _ \ / _` / __|  / __/ __\ \ / /                                                                                                 
| (_) | (_| \__ \ | (__\__ \\ V /                                                                                                  
 \___/ \__,_|___/  \___|___/ \_/                                                                                                   
                                                                                                                                   
;                                                                                                                                  
                                                                                                                                   
ODS CSV FILE="d:/csv/haveods.csv";                                                                                                 
proc print data=have nolabel noobs;                                                                                                
run;                                                                                                                               
ODS CSV CLOSE;                                                                                                                     
                                                                                                                                   
"NAME","SEX","AGE","HEIGHT","WEIGHT"                                                                                               
"Alfred","M",14,69.0,112.5                                                                                                         
"Alice","F",13,56.5,84.0                                                                                                           
"Barbara","F",13,65.3,98.0                                                                                                         
"Carol","F",14,62.8,102.5                                                                                                          
"Henry","M",14,63.5,102.5                                                                                                          
                                                                                                                                   
*          _                        _       _          _                                                                           
  ___   __| |___    ___ _____   __ | | __ _| |__   ___| |                                                                          
 / _ \ / _` / __|  / __/ __\ \ / / | |/ _` | '_ \ / _ \ |                                                                          
| (_) | (_| \__ \ | (__\__ \\ V /  | | (_| | |_) |  __/ |                                                                          
 \___/ \__,_|___/  \___|___/ \_/   |_|\__,_|_.__/ \___|_|                                                                          
                                                                                                                                   
;                                                                                                                                  
                                                                                                                                   
ODS CSV FILE="d:/csv/havelbl.csv";                                                                                                 
proc print data=have label noobs;                                                                                                  
run;                                                                                                                               
ODS CSV CLOSE;                                                                                                                     
                                                                                                                                   
"First Name","Gender","Age of Person","Height of Person","Weight of Person"                                                        
"Alfred","M",14,69.0,112.5                                                                                                         
"Alice","F",13,56.5,84.0                                                                                                           
"Barbara","F",13,65.3,98.0                                                                                                         
"Carol","F",14,62.8,102.5                                                                                                          
"Henry","M",14,63.5,102.5                                                                                                          
                                                                                                                                   
*    _       _            _                                                                                                        
  __| | __ _| |_ __ _ ___| |_ ___ _ __                                                                                             
 / _` |/ _` | __/ _` / __| __/ _ \ '_ \                                                                                            
| (_| | (_| | || (_| \__ \ ||  __/ |_) |                                                                                           
 \__,_|\__,_|\__\__,_|___/\__\___| .__/                                                                                            
                                 |_|                                                                                               
;                                                                                                                                  
                                                                                                                                   
data _null_;                                                                                                                       
    file "d:/csv/havesd1.csv";                                                                                                     
    set have;                                                                                                                      
    if _n_=1 then put "%varlist(have,od=%str(,))";                                                                                 
    put (_all_) ( $ +(-1) ",");                                                                                                    
run;quit;                                                                                                                          
                                                                                                                                   
NAME,SEX,AGE,HEIGHT,WEIGHT                                                                                                         
Alfred,M,14,69,112.5                                                                                                               
Alice,F,13,56.5,84                                                                                                                 
Barbara,F,13,65.3,98                                                                                                               
Carol,F,14,62.8,102.5                                                                                                              
Henry,M,14,63.5,102.5                                                                                                              
                                                                                                                                   
                                                                                                                                   
                                                                                                                                   
*    _     ____                                                                                                                    
  __| |___|___ \ ___ _____   __                                                                                                    
 / _` / __| __) / __/ __\ \ / /                                                                                                    
| (_| \__ \/ __/ (__\__ \\ V /                                                                                                     
 \__,_|___/_____\___|___/ \_/                                                                                                      
                                                                                                                                   
;                                                                                                                                  
                                                                                                                                   
Comment by                                                                                                                         
Bartosz Jablonski                                                                                                                  
yabwon@gmail.com                                                                                                                   
                                                                                                                                   
SAS D0c                                                                                                                            
https://tinyurl.com/y5xnhfbz                                                                                                       
https://documentation.sas.com/?docsetId=lebaseutilref&docsetTarget=n0yo3bszlrh0byn1j4fxh4ndei8u.htm&docsetVersion=9.4&locale=en    
                                                                                                                                   
%ds2csv (data=sashelp.class, runmode=b, csvfile=d:\csv\havemac.csv);                                                               
                                                                                                                                   
"NAME","SEX","AGE","HEIGHT","WEIGHT"                                                                                               
"Alfred","M","14","69","112.5"                                                                                                     
"Alice","F","13","56.5","84"                                                                                                       
"Barbara","F","13","65.3","98"                                                                                                     
"Carol","F","14","62.8","102.5"                                                                                                    
"Henry","M","14","63.5","102.5"                                                                                                    
                                                                                                                                   
*_                            _                                                                                                    
(_)_ __ ___  _ __   ___  _ __| |_                                                                                                  
| | '_ ` _ \| '_ \ / _ \| '__| __|                                                                                                 
| | | | | | | |_) | (_) | |  | |_                                                                                                  
|_|_| |_| |_| .__/ \___/|_|   \__|                                                                                                 
            |_|                                                                                                                    
;                                                                                                                                  
                                                                                                                                   
*    _             _                            _                                                                                  
  __| |_ __ ___   (_)_ __ ___  _ __   ___  _ __| |_                                                                                
 / _` | '_ ` _ \  | | '_ ` _ \| '_ \ / _ \| '__| __|                                                                               
| (_| | | | | | | | | | | | | | |_) | (_) | |  | |_                                                                                
 \__,_|_| |_| |_| |_|_| |_| |_| .__/ \___/|_|   \__|                                                                               
                              |_|                                                                                                  
;                                                                                                                                  
                                                                                                                                   
dm "dimport 'd:\csv\have.csv' havedm  replace";                                                                                    
                                                                                                                                   
 WORK.HAVIMP total obs=5                                                                                                           
                                                                                                                                   
   NAME      SEX    AGE    HEIGHT    WEIGHT                                                                                        
                                                                                                                                   
  Alfred      M     14      69       112.5                                                                                         
  Alice       F     13      56.5     84                                                                                            
  Barbara     F     13      65.3     98                                                                                            
  Carol       F     14      62.8     102.5                                                                                         
  Henry       M     14      63.5     102.5                                                                                         
                                                                                                                                   
*    _       _            _                                                                                                        
  __| | __ _| |_ __ _ ___| |_ ___ _ __                                                                                             
 / _` |/ _` | __/ _` / __| __/ _ \ '_ \                                                                                            
| (_| | (_| | || (_| \__ \ ||  __/ |_) |                                                                                           
 \__,_|\__,_|\__\__,_|___/\__\___| .__/                                                                                            
                                 |_|                                                                                               
;                                                                                                                                  
                                                                                                                                   
data havImp;                                                                                                                       
   if _n_=0 then do; %let rc=%sysfunc(dosubl('                                                                                     
      data null;                                                                                                                   
        infile "d:/csv/havesd1.csv";                                                                                               
        input;                                                                                                                     
        call symputx('nams',translate(_infile_," ",","));                                                                          
        stop;                                                                                                                      
      run;quit;                                                                                                                    
      '));                                                                                                                         
   end;                                                                                                                            
   informat &nams $4096.;                                                                                                          
   infile "d:/csv/havesd1.csv" delimiter=',' firstobs=2;                                                                           
   input &nams;                                                                                                                    
run;quit;                                                                                                                          
                                                                                                                                   
 WORK.HAVIMP total obs=5                                                                                                           
                                                                                                                                   
   NAME      SEX    AGE    HEIGHT    WEIGHT                                                                                        
                                                                                                                                   
  Alfred      M     14      69       112.5                                                                                         
  Alice       F     13      56.5     84                                                                                            
  Barbara     F     13      65.3     98                                                                                            
  Carol       F     14      62.8     102.5                                                                                         
  Henry       M     14      63.5     102.5                                                                                         
                                                                                                                                   
       Variables in Creation Order                                                                                                 
                                                                                                                                   
#    Variable    Type     Len    Informat                                                                                          
                                                                                                                                   
1    NAME        Char    4096    $4096.                                                                                            
2    SEX         Char    4096    $4096.                                                                                            
3    AGE         Char    4096    $4096.                                                                                            
4    HEIGHT      Char    4096    $4096.                                                                                            
5    WEIGHT      Char    4096    $4096.                                                                                            
                                                                                                                                   
                                                                                                                                   
* optimize lengths;                                                                                                                
%utl_optlen(inp=HAVIMP,out=HAVIMP);                                                                                                
                                                                                                                                   
       Variables in Creation Order                                                                                                 
                                                                                                                                   
#    Variable    Type    Len                                                                                                       
                                                                                                                                   
1    NAME        Char      7                                                                                                       
2    SEX         Char      1                                                                                                       
3    AGE         Char      2                                                                                                       
4    HEIGHT      Char      4                                                                                                       
5    WEIGHT      Char      5                                                                                                       
                                                                                                                                   
