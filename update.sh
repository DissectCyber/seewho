# Checking rights.
if [[ $EUID -ne 0 ]]; then
    echo "The update must be run as root. Type in 'sudo bash $0' to run it as root."
	exit 1
fi

if [ $PWD = "/usr/share/seewho" ]; then
    echo "[+] Cloning the current repository to /tmp/"
    rm -rf /tmp/seewho/ &> /dev/null 
    cd /tmp/ && git clone https://github.com/KasperskyLab/seewho
    cd /tmp/seewho && bash update.sh
elif [ $PWD = "/tmp/seewho" ]; then

    echo "[+] Saving current backend's SSL configuration in /tmp/"
    mv /usr/share/seewho/server/backend/*.pem /tmp/

    echo "[+] Deleting the current SeeWho folders and files."
    rm -rf /usr/share/seewho/app/
    rm -rf /usr/share/seewho/server/
    rm -rf /usr/share/seewho/analysis/
    rm /usr/share/seewho/update.sh
    rm /usr/share/seewho/kiosk.sh
    rm /usr/share/seewho/uninstall.sh

    echo "[+] Copying the new SeeWho version"
    cp -R app/ /usr/share/seewho/app/
    cp -R server/ /usr/share/seewho/server/
    cp -R analysis/ /usr/share/seewho/analysis/
    cp update.sh /usr/share/seewho/update.sh
    cp kiosk.sh /usr/share/seewho/kiosk.sh
    cp uninstall.sh /usr/share/seewho/uninstall.sh

    echo "[+] Retoring the backend's SSL configuration from /tmp/"
    mv /tmp/*.pem /usr/share/seewho/server/backend/

    echo "[+] Checking possible new Python dependencies"
    python3 -m pip install -r assets/requirements.txt

    echo "[+] Building new interfaces..."
    cd /usr/share/seewho/app/frontend/ && npm install && npm run build
    cd /usr/share/seewho/app/backend/ && npm install && npm run build

    echo "[+] Updating current configuration with new values."
    if ! grep -q reboot_option /usr/share/seewho/config.yaml; then
        sed -i 's/frontend:/frontend:\n  reboot_option: true/g' /usr/share/seewho/config.yaml
    fi

    if ! grep -q user_lang /usr/share/seewho/config.yaml; then
        sed -i 's/frontend:/frontend:\n  user_lang: en/g' /usr/share/seewho/config.yaml
    fi

    if ! grep -q shutdown_option /usr/share/seewho/config.yaml; then
        sed -i 's/frontend:/frontend:\n  shutdown_option: true/g' /usr/share/seewho/config.yaml
    fi

    if ! grep -q quit_option /usr/share/seewho/config.yaml; then
        sed -i 's/frontend:/frontend:\n  quit_option: true/g' /usr/share/seewho/config.yaml
    fi

    if ! grep -q active /usr/share/seewho/config.yaml; then
        sed -i 's/analysis:/analysis:\n  active: true/g' /usr/share/seewho/config.yaml
    fi

    if ! grep -q update /usr/share/seewho/config.yaml; then
        sed -i 's/frontend:/frontend:\n  update: true/g' /usr/share/seewho/config.yaml
    fi

    if ! grep -q "CN=R3,O=Let's Encrypt,C=US" /usr/share/seewho/config.yaml; then
        sed -i "s/free_issuers:/free_issuers:\n  - CN=R3,O=Let's Encrypt,C=US/g" /usr/share/seewho/config.yaml
    fi

    echo "[+] Restarting services"
    service seewho-backend restart
    service seewho-frontend restart
    service seewho-watchers restart

    echo "[+] Updating the SeeWho version"
    cd /tmp/seewho && git tag | tail -n 1 | xargs echo -n > /usr/share/seewho/VERSION

    echo "[+] SeeWho updated!"
fi
