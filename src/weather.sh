#! /bin/bash
curl http://www.accuweather.com/de/de/bayern/munich/forecast.aspx | grep -n 'Forecast' > /tmp/accuweather.txt
cat /tmp/accuweather.txt | grep -n 'ForecastDay' > /tmp/accuweatherday.txt
cat /tmp/accuweather.txt | grep -n 'ForecastNight' > /tmp/accuweathernight.txt
echo ''

count=1
while [ $count -le 7 ]
do
#  img[$count]=$(cat /tmp/accuweatherday.txt | grep -n 'ForecastIcon' | sed -n $"$count"p | awk -F'src="' '{print $2}' | awk -F'" ' '{print $1}')
#  imgname[$count]=$(cat /tmp/accuweatherday.txt | grep -n 'ForecastIcon' | sed -n $"$count"p | awk -F'blue/' '{print $2}' | awk -F'" ' '{print $1}')
  day[$count]=$(cat /tmp/accuweatherday.txt | grep -n 'textmedbold' | sed -n $"$count"p | awk -F'lblDate">' '{print $2}'| awk -F'</span></div>' '{print $1}')
  desc[$count]=$(cat /tmp/accuweatherday.txt | grep -n 'lblDesc' | sed -n $"$count"p | awk -F'lblDesc">' '{print $2}'| awk -F'</span></div>' '{print $1}')
  label[$count]=$(cat /tmp/accuweatherday.txt | grep -n 'Label1' | sed -n $"$count"p | awk -F'Label1">' '{print $2}'| awk -F'</span>' '{print $1}')
  temp[$count]=$(cat /tmp/accuweatherday.txt | grep -n 'Label1' | sed -n $"$count"p | awk -F'lblHigh">' '{print $2}' | awk -F'</span></div>' '{print $1}' | sed -e 's/&deg;/°/')
  feel[$count]=$(cat /tmp/accuweatherday.txt | grep -n 'RealFeelValue' | sed -n $"$count"p | awk -F'RealFeelValue">' '{print $2}'| awk -F'</span></div>' '{print $1}' | sed -e 's/&deg;/°/')

#  imgnight[$count]=$(cat /tmp/accuweathernight.txt | grep -n 'ForecastIcon' | sed -n $"$count"p | awk -F'src="' '{print $2}' | awk -F'" ' '{print $1}')
#  imgnamenight[$count]=$(cat /tmp/accuweathernight.txt | grep -n 'ForecastIcon' | sed -n $"$count"p | awk -F'blue/' '{print $2}' | awk -F'" ' '{print $1}')
  daynight[$count]=$(cat /tmp/accuweathernight.txt | grep -n 'textmedbold' | sed -n $"$count"p | awk -F'lblDate">' '{print $2}'| awk -F'</span></div>' '{print $1}')
  descnight[$count]=$(cat /tmp/accuweathernight.txt | grep -n 'lblDesc' | sed -n $"$count"p | awk -F'lblDesc">' '{print $2}'| awk -F'</span></div>' '{print $1}')
  labelnight[$count]=$(cat /tmp/accuweathernight.txt | grep -n 'Label1' | sed -n $"$count"p | awk -F'Label1">' '{print $2}'| awk -F'</span>' '{print $1}')
  tempnight[$count]=$(cat /tmp/accuweathernight.txt | grep -n 'Label1' | sed -n $"$count"p | awk -F'lblHigh">' '{print $2}' | awk -F'</span></div>' '{print $1}' | sed -e 's/&deg;/°/')
  feelnight[$count]=$(cat /tmp/accuweathernight.txt | grep -n 'RealFeelValue' | sed -n $"$count"p | awk -F'RealFeelValue">' '{print $2}'| awk -F'</span></div>' '{print $1}' | sed -e 's/&deg;/°/')

  echo $count
  echo ${day[$count]} 
#  echo ${img[$count]} 
#  echo ${imgname[$count]} 
  echo ${desc[$count]} 
  echo ${label[$count]} ${temp[$count]}
  echo Realfeel ${feel[$count]}
  echo ''
  
  echo $count
  echo ${daynight[$count]} 
#  echo ${imgnight[$count]} 
#  echo ${imgnamenight[$count]} 
  echo ${descnight[$count]} 
  echo ${labelnight[$count]} ${temp[$count]}
  echo Realfeel ${feelnight[$count]}
  echo ''
  
  count=`expr $count + 1`
done

exit 