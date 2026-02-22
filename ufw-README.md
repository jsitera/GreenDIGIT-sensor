# add to /etc/ufw/after.rules

# ==========================================
# Custom Docker rules for DOCKER-USER chain
# ==========================================
*filter
:DOCKER-USER - [0:0]

# 1. Allow the specific subnet to access port 80 and return to Docker's routing
-A DOCKER-USER -s 147.228.0.0/16 -p tcp --dport 80 -j RETURN

# 2. Drop all other external traffic trying to reach port 80
-A DOCKER-USER -p tcp --dport 80 -j DROP

# 3. Allow all other normal Docker traffic to proceed (Critical!)
-A DOCKER-USER -j RETURN

COMMIT
