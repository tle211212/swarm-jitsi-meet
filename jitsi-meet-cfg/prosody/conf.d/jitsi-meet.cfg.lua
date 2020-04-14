admins = { "focus@auth.meetjitsi" }
plugin_paths = { "/prosody-plugins/", "/prosody-plugins-custom" }
http_default_host = "meetjitsi"












VirtualHost "meetjitsi"

    authentication = "anonymous"

    ssl = {
        key = "/config/certs/meetjitsi.key";
        certificate = "/config/certs/meetjitsi.crt";
    }
    modules_enabled = {
        "bosh";
        "pubsub";
        "ping";
        
        
    }

    c2s_require_encryption = false



VirtualHost "auth.meetjitsi"
--    ssl = {
--        key = "/config/certs/auth.meetjitsi.key";
--        certificate = "/config/certs/auth.meetjitsi.crt";
--    }
    authentication = "internal_plain"


VirtualHost "recorder.meetjitsi"
    modules_enabled = {
      "ping";
    }
    authentication = "internal_plain"


Component "internal-muc.meetjitsi" "muc"
    modules_enabled = {
        "ping";
        
    }
    storage = "memory"
    muc_room_cache_size = 1000

Component "muc.meetjitsi" "muc"
    storage = "memory"
    modules_enabled = {
        
        
    }

Component "focus.meetjitsi"
    component_secret = "s3cr371"

