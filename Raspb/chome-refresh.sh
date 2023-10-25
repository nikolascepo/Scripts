#Refresh chrome every 5 minutes
touch autorefresh-chromium.sh
printf "#!/bin/bash\nwhile true\ndo\nxdotools key = ”ctrl+F5” &\nsleep 300\ndone" >> autorefresh-chromium.sh
chmod +x autorefresh-chromium.sh

