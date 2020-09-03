#!/usr/bin/expect  
set timeout 10000  
set host [lindex $argv 0]  
set username [lindex $argv 1]  
set password [lindex $argv 2]  
set src_file [lindex $argv 3]  
set dest_file [lindex $argv 4]  

spawn scp -P 31737 -r $username@$host:$src_file $dest_file
 expect {  
 "(yes/no)?"  
  {  
    send "yes\n"  
    expect "*assword:" { send "$password\n"}  
  }  
 "*assword:"  
  {  
    send "$password\n"  
  }  
} 
expect "100%"
expect "100%"
expect "100%"

spawn ssh $username@$host -p 31737 "cd $src_file && rm -rf *"
 expect {  
 "(yes/no)?"  
  {  
    send "yes\n"  
    expect "*assword:" { send "$password\n"}  
  }  
 "*assword:"  
  {  
    send "$password\n"  
    
  } 
 

} 
expect eof  
 

