!/bin/bash                                                               
                                                                          
# Define the maximum number of attempts to check for internet connection  
MAX_ATTEMPTS=10                                                           
ATTEMPT=0                                                                 
                                                                          
# Check for internet connection and wait until it is available or max atte
while ! ping -c 1 google.com > /dev/null 2>&1; do                         
    echo "No internet connection. Attempting to reconnect... (Attempt $ATT
    ATTEMPT=$((ATTEMPT + 1))                                              
    if [ "$ATTEMPT" -ge "$MAX_ATTEMPTS" ]; then                           
        echo "Internet connection is required to start the gateway. Exitin
        exit 1                                                    
    fi                                                            
    sleep 10                                                      
done                                                              
                                                                  
echo "Internet connection is available. Starting the gateway..."  
                                                                  
# Navigate to the directory containing the start-station.sh script
cd /home/root/basicstation/projects/iotc/ || exit 1              
                                                                 
# Check if start-station.sh exists and is executable             
if [ ! -x "./start-station.sh" ]; then         
    echo "Error: ./start-station.sh not found or not executable." 
    exit 1                                                        
fi                                                                
                                                                 
# Start the gateway                                              
./start-station.sh -l lns-iotc                   
