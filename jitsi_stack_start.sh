# EDIT the CONFIG, point to the location of your jitsi meet cfg location (ex: /opt/jitsi-meet-cfg)
#      the PUBLIC_URL: your jitsi public url

CONFIG=/mnt/nfs/jitsi-meet-cfg \
PUBLIC_URL="https://jitsi.<yourdomain>.com" \

ENABLE_LETSENCRYPT=0 \
TZ=Asia/Ho_Chi_Minh \
XMPP_DOMAIN=meetjitsi \
XMPP_SERVER=xmpp.meetjitsi \
XMPP_BOSH_URL_BASE=http://xmpp.meetjitsi:5280 \
XMPP_AUTH_DOMAIN=auth.meetjitsi \
XMPP_MUC_DOMAIN=muc.meetjitsi \
XMPP_INTERNAL_MUC_DOMAIN=internal-muc.meetjitsi \
XMPP_GUEST_DOMAIN=guest.meetjitsi \
XMPP_MODULES= \
XMPP_MUC_MODULES= \
XMPP_INTERNAL_MUC_MODULES= \
JVB_BREWERY_MUC=jvbbrewery \
JVB_AUTH_USER=jvb \
JVB_AUTH_PASSWORD=passw0rd1 \
JVB_STUN_SERVERS=stun.l.google.com:19302,stun1.l.google.com:19302,stun2.l.google.com:19302 \
JVB_PORT=10000 \
JVB_TCP_HARVESTER_DISABLED=true \
JVB_TCP_PORT=4443 \
JICOFO_COMPONENT_SECRET=s3cr371 \
JICOFO_AUTH_USER=focus \
JICOFO_AUTH_PASSWORD=passw0rd1 \
JIGASI_XMPP_USER=jigasi \
JIGASI_XMPP_PASSWORD=passw0rd1 \
JIGASI_BREWERY_MUC=jigasibrewery \
JIGASI_PORT_MIN=20000 \
JIGASI_PORT_MAX=20050 \
XMPP_RECORDER_DOMAIN=recorder.meetjitsi \
JIBRI_RECORDER_USER=recorder \
JIBRI_RECORDER_PASSWORD=passw0rd1 \
JIBRI_RECORDING_DIR=/config/recordings \
JIBRI_FINALIZE_RECORDING_SCRIPT_PATH=/config/finalize.sh \
JIBRI_XMPP_USER=jibri \
JIBRI_XMPP_PASSWORD=passw0rd1 \
JIBRI_BREWERY_MUC=jibribrewery \
JIBRI_PENDING_TIMEOUT=90 \
JIBRI_STRIP_DOMAIN_JID=muc \
JIBRI_LOGS_DIR=/config/logs \
DISABLE_HTTPS=1 \
docker stack deploy -c jitsi.yml jitsi
