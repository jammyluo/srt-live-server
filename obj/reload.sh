export LD_LIBRARY_PATH=/data/app/srt_live_svr/bin
cd .. 

for ((i=0;i<=6;i++));
do
    port=500$i
    PID=`ps -ef | grep './bin/sls -c sls.conf.'$port | grep -v 'grep' | awk '{print $2}'`
    if [[ ${PID} -ge 1 ]]; then
    	kill -9  $PID
        echo 'reloading sls $port'
        ./bin/sls -c sls.conf.$port > /dev/null 2>&1 &
        echo 'reload sls  done!' $port
    fi
done 
